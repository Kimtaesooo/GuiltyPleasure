package dao.battlemodule;

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

import command.battle.GetBattleQuiz;
import dto.Battle_Play;
import dto.Battle_Room;

@ServerEndpoint("/battlesocket")
public class Websocket {
	static HashMap<String, Session> map = new HashMap<String, Session>(); // ���ǰ� ���̵� �����ҷ��� ������ �Ⱦ�

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	String me = ""; // ������ ������ ����
	String br_num = ""; // ���ӹ� ��ȣ
	String user01 = ""; // ���ӹ� ����1
	String user02 = ""; // ������ ����2
	Boolean startFlag = false; // ���ӹ��� ���۵Ǿ����� �ȵǾ����� Ȯ���ϴ� ����

	/**
	 * ������ ���� �޼����� �޴� �޼���
	 * @param message
	 * 			�޽����� �޴´�.
	 * @param session
	 * 			������ �޴´�.(���� �ѹ�)
	 * @throws IOException
	 * 			���� ó��
	 */
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);

		// �޾ƿ� ���ڿ��� ':' �����ڸ� ���Ͽ� �迭�� ����
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
		// "sessionValue:" + br_num + ":" + me
		if (strArray[0].equals("sessionValue")) {
			// 0-sessionValue, 1-���ȣ, 2-u_id
			me = strArray[2];
			map.put(me, session);
			Session usersession = map.get(me);
			message = "checkPeople:" + br_num + ":" + me;
			for (Session client : clients) {
					client.getBasicRemote().sendText(message);
			}
		}

		// ������ ���ӽ��� ��ư�� ������ ��
		if (strArray[0].equals("gameStart")) {
			// message = "gameStart:" + br_num + ":" + me + ":" + q_type;
			br_num = strArray[1];
			me = strArray[2];
			String q_type = strArray[3];

			BattlePlay battleplay = new BattlePlay();
			List list = battleplay.roomInfo(me);
			Battle_Room room = (Battle_Room) list.get(0);
			int people_cnt = room.getBr_people();
			// ���ӹ� �ο��� 2�� �����ϋ� (��, �� ȥ���϶�)
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

			// DB�� ���� ���ӹ��� ���۵Ǿ����� �ȵǾ����� Ȯ���ϱ� ���� ���� ���� �´�. Y�� ������, N�� �����
			String startFlag = battleplay.updateBattleRoomState(br_num);

			// ���ӹ��� �����ϰ� ���� ���� ����
			if (startFlag.equals("N")) {
				String question = "";
				String answer = "";
				String wa1 = "";
				String wa2 = "";
				String wa3 = "";
				String code = "";

				// ���������� ������ �Ѱ��ְ� ���� ������ ���� ��� ���������� ���´�.
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
			if (value.equals("Ű�е�1") || value.equals("Ű�е�2") || value.equals("Ű�е�3") || value.equals("Ű�е�4")
					|| value.equals("undefined")) {
				return;
			}

			BattlePlay battleplay = new BattlePlay();
			Battle_Play roomdto = new Battle_Play();
			// �� �� Ʋ�� ��� Ȯ�� �ϴ� �� Bp_state
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
					// ���� ���� ������ �´�.
					List playinfo = battleplay.playInfo(br_num);
					Battle_Play result = (Battle_Play) playinfo.get(0);
					int bp_01cnt = result.getBp_01cnt();
					int bp_02cnt = result.getBp_02cnt();
					int bp_count = result.getBp_count();

					
					if (bp_01cnt == bp_count || bp_02cnt == bp_count) {
						message = "exit:" + br_num + ":";
						synchronized (clients) {
							for (Session client : clients) {
								client.getBasicRemote().sendText(message);
							}
						}
						return;
					}

					message = "next:" + br_num + ":";
					synchronized (clients) {
						for (Session client : clients) {
							client.getBasicRemote().sendText(message);
						}
					}
					return;
				}
			}
			// ������ �ʰ� Ǭ ���
			else {
				// ���� Ǭ ������ ���� Ǫ�°� ����
				if (!value.equals("����������")) {
					// ������ ��
					if (value.equals(checkFlag)) {
						battleplay.updatePlayCnt(br_num, me);

						// ���� ���� ������ �´�.
						List playinfo = battleplay.playInfo(br_num);
						Battle_Play result = (Battle_Play) playinfo.get(0);
						int bp_01cnt = result.getBp_01cnt();
						int bp_02cnt = result.getBp_02cnt();
						int bp_count = result.getBp_count();
						
						if (bp_01cnt == bp_count || bp_02cnt == bp_count) {
							message = "exit:" + br_num + ":";
							synchronized (clients) {
								for (Session client : clients) {
									client.getBasicRemote().sendText(message);
								}
							}
							return;
						}
						message = "next:" + br_num + ":";
						synchronized (clients) {
							for (Session client : clients) {
								client.getBasicRemote().sendText(message);
							}
						}
						return;
					}
					// ������ ��
					else {
						battleplay.updatePlayCnt(br_num);
						message = "next:" + br_num + ":";
						synchronized (clients) {
							for (Session client : clients) {
								client.getBasicRemote().sendText(message);
							}
						}
						return;
					}
				}
			}
		}

	}

	/**
	 * ������ ���� �����Ͽ� ������ �� ������ �ο��ϴ� �޼���
	 * @param session
	 * 			���ǰ��� �޴´�. ���ǰ��� ������ ���������� �ο��Ѵ�.
	 */
	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		clients.add(session);
	}

	/**
	 * ���� �ݱ�
	 * @param session
	 */
	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
}
