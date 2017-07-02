package dao.ts_battlemodule;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import dto.Battle_Play;
import dto.Battle_Room;
import dto.Quiz;

@ServerEndpoint("/battlesocket")
public class Websocket {
	static HashMap<String, Session> map = new HashMap<String, Session>();

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	String me = "";
	String br_num = "";
	String user01 = "";
	String user02 = "";
	Boolean startFlag = false;

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);

		// �޾ƿ� �ؽ�Ʈ ���ڿ��� �и�
		String strArray[] = message.split(":");

		/*
		 * if (strArray[0].equals("messageSend")) { synchronized (clients) { for
		 * (Session client : clients) { if (!client.equals(session)) {
		 * client.getBasicRemote().sendText(message); } } } }
		 */

		// �޽��� ����
		if (strArray[0].equals("messageSend")) {
			synchronized (clients) {
				for (Session client : clients) {
					if (!client.equals(session)) {
						client.getBasicRemote().sendText(message);
					}
				}
			}
		}

		// ���� �� ����
		if (strArray[0].equals("sessionValue")) {
			// 0-sessionValue, 1-���ȣ, 2-u_id
			me = strArray[2];
			map.put(me, session);
			Session usersession = map.get(me);
		}

		// ������ ���ӽ��� ��ư�� ������ ��
		if (strArray[0].equals("gameStart")) {
			// message =  "gameStart:" + br_num + ":" + me + ":" + q_type;
			br_num = strArray[1];
			me = strArray[2];
			String q_type = strArray[3];

			BattlePlay battleplay = new BattlePlay();
			List list = battleplay.roomInfo(me);
			Battle_Room room = (Battle_Room) list.get(0);
			int people_cnt = room.getBr_people();
			if (people_cnt < 2) {
				message = "people_cnt_check:" + br_num + ":�ο��� �����մϴ�.:";
				synchronized (clients) {
					for (Session client : clients) {
						if (client.equals(session)) {
							client.getBasicRemote().sendText(message);
						}
					}
				}
				return;
			}

			String startFlag = battleplay.updateBattleRoomState(br_num);

			if (startFlag.equals("N")) {
				String question = "";
				String answer = "";
				String wa1 = "";
				String wa2 = "";
				String wa3 = "";
				String code = "";

				GetBattleQuiz getBattleQuiz = new GetBattleQuiz();
				String quiz = getBattleQuiz.getQuiz(q_type);

				String quizinfo[] = quiz.split(":");
				// Q0012:C:���� ������� ������?:���ֱ���:����:���ٱ���:�ʱ���:
				// 0.�ڵ� 1.���� 2.���� 3.���� 4.���� 5.���� 6.����
				code = quizinfo[0];
				question = quizinfo[2];
				answer = quizinfo[3];
				wa1 = quizinfo[4];
				wa2 = quizinfo[5];
				wa3 = quizinfo[6];
				message = "getget:" + br_num + ":" + code + ":" + question + ":" + answer + ":" + wa1 + ":" + wa2 + ":"
						+ wa3 + ":";
				synchronized (clients) {
					for (Session client : clients) {
						client.getBasicRemote().sendText(message);
					}
				}
			}
		}

		// ���� ������ �ѱ��
		if (strArray[0].equals("nextSend")) {
			// message = "nextSend:" + br_num + ":" + me + ":" + q_type);
			br_num = strArray[1];
			me = strArray[2];
			String q_type = strArray[3];

			String question = "";
			String answer = "";
			String wa1 = "";
			String wa2 = "";
			String wa3 = "";
			String code = "";

			GetBattleQuiz getBattleQuiz = new GetBattleQuiz();
			String quiz = getBattleQuiz.getQuiz(q_type);

			String quizinfo[] = quiz.split(":");
			// Q0012:C:���� ������� ������?:���ֱ���:����:���ٱ���:�ʱ���:
			// 0.�ڵ� 1.���� 2.���� 3.���� 4.���� 5.���� 6.����
			code = quizinfo[0];
			question = quizinfo[2];
			answer = quizinfo[3];
			wa1 = quizinfo[4];
			wa2 = quizinfo[5];
			wa3 = quizinfo[6];
			message = "getget:" + br_num + ":" + code + ":" + question + ":" + answer + ":" + wa1 + ":" + wa2 + ":"
					+ wa3 + ":";
			synchronized (clients) {
				for (Session client : clients) {
					client.getBasicRemote().sendText(message);
				}
			}
		}

		// ������ ���� ���� �޾ƿ´�.
		if (strArray[0].equals("button")) {
			// message = button:"+ br_num+":"+me+":"+code+":"+button4.value
			br_num = strArray[1];
			me = strArray[2];
			String q_code = strArray[3];
			String value = strArray[4];
			
			// �ʱ� ��ư ������ �ƹ� ���� ���� �ʰ� ���ƹ�����.
			if(value.equals("Ű�е�1") || value.equals("Ű�е�2") || value.equals("Ű�е�3") || value.equals("Ű�е�4") ||
				value.equals("undefined"))
			{
				return;
			}
			
			BattlePlay battleplay = new BattlePlay();
			Battle_Play roomdto = new Battle_Play();
			// ������ 2������ Ȯ���ϴ� ��
			List list = battleplay.playInfo(br_num);
			roomdto = (Battle_Play) list.get(0);
			int bp_state = roomdto.getBp_state();

			// ���� �� ��������
			String checkFlag = battleplay.checkanswer(q_code);

			if (bp_state < 1) {
				// ������ Ʋ�� ���
				if (!value.equals(checkFlag)) {
					// bp_state ī���� +1 �Ѵ�.
					if (!value.equals("����������")) {
						battleplay.updatePlayRoomState(br_num);
					}
					message = "wrong:" + br_num + ":Ʋ�Ƚ��ϴ�. ������ ������ Ǯ ���� ��ٷ� �ּ���:����������";
					synchronized (clients) {
						for (Session client : clients) {
							if (client.equals(session)) {
								client.getBasicRemote().sendText(message);
							}
						}
					}
					return;
				} else {
					// ������ ���� ���
					// bp_01cnt, bp_02cnt ī�����Ѵ�.
					battleplay.updatePlayCnt(br_num, me);
					message = "next:" + br_num + ":";
					synchronized (clients) {
						for (Session client : clients) {
							if (client.equals(session)) {
								client.getBasicRemote().sendText(message);
							}
						}
					}
					return;
				}
			}
			// ������ �ʰ� Ǭ ���
			else {
				if (!value.equals("����������")) {
					if (value.equals(checkFlag)) {
						battleplay.updatePlayCnt(br_num, me);
						message = "next:" + br_num + ":";
						synchronized (clients) {
							for (Session client : clients) {
								if (client.equals(session)) {
									client.getBasicRemote().sendText(message);
								}
							}
						}
						return;
					} else {
						battleplay.updatePlayCnt(br_num);
						message = "next:" + br_num + ":";
						synchronized (clients) {
							for (Session client : clients) {
								if (client.equals(session)) {
									client.getBasicRemote().sendText(message);
								}
							}
						}
						return;
					}
				}
			}
		}

	}

	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
}
