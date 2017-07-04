package jaum_play;
import java.io.*;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import dao.shopmodule.ShopManager;
/**
 * 	�������� Ŭ���� �Դϴ�.
 *
 */

@ServerEndpoint("/main_chat")
public class main_chat {
	/**
	 * ��¿� �޼ҵ� �Դϴ�.
	 * @param String quiz ������ ���� ����
	 * @param String ans ������ ������ ���� ����
	 * @param String jang ������ ������ �帣 ����
	 * @param String quizList[] DB ��� ���� ��� ��Ƶ� ����Ʈ�Դϴ�.
	 * @param String ansList[] DB ��� ���� ������ ������ ��Ƶ� ����Ʈ�Դϴ�.
	 * @param String jangList[] DB ��� ���� ������ �帣�� ��Ƶ� ����Ʈ�Դϴ�.
	 * @param String str[] �޾ƿ� ���ڿ��� �и� �Ҷ� ���� ���� �Դϴ�.
	 * @param String login ���� ���ӵ� ����ڸ� ������ѵ� ���� �Դϴ�.
 	 */

	//������ ����, ����, �帣 ����
    static String quiz=null;
    static String ans=null;
    static String jang=null;
    //DB �� ��� ���� �ӽ� ����Ʈ
    static String quizList[]={"��������","������","������ ����","����","�� ����","����������","�� ��","����",
    							"������ ������","��������","��������","������ ���� ������","������"};
    static String ansList[]={"�ظ�����","���̶�","�г��� ����","�ǳ�","�� ��Ŭ","Ʈ��������","�� ŷ","����",
    							"¯���� ������","�Ƶ�����","�̴��߻�","������ �߻� �ɷη�","������"};
    static String jangList[]={"��ȭ","��ȭ","��ȭ","��ȭ","��ȭ","��ȭ","��ȭ","��ȭ",
    							"�ִ�","�ִ�","�ִ�","�ִ�","�ִ�"};
    //������ ���ڿ� �и��� ���� ����
    static String str[];
    //���ӵ� ����� ǥ�ø� ���� ����
    static String login;
    //���� ���� ������ ���� �޼ҵ�
    Random random = new Random();
    //����� ����ڿ��� ����Ʈ �ٶ� ���
    ShopManager point = new ShopManager();
    //���ǰ��� Ŭ���̾�Ʈ�� ����
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	@OnOpen
	//������ ���ӽ� Ŭ���̾�Ʈ�� �߰�
	public void onOpen(Session session) {
		clients.add(session);
	}
	
	@OnMessage
	//�޽��� ������ �߻��� �޼ҵ�
	public void onMessage(String message, Session session) throws IOException {
		/**
		 * �޽��� ������ �߻��Ǵ� �޼ҵ� �Դϴ�. 
		 * �޾ƿ� �޽��� �и��ؼ� �и��� ��ɾ if ���� �̿��Ͽ� ����ڿ��� ������ �޽����� �ٽ� ����
		 */
		// ���� ���ڿ��� �и�
		str = message.split("div");
		// �Ϲ� ä���� ��� send �� ���� ����
		sendAll(session, message,1);
		// ������ �Է½� �̹� ��� ���� ��� �ִ� ���� �ٽ� ���
		if(quiz!=null&&str[1].equals("������")){
			sendAll(session, "",0);
		}
		// ��� ���� ��� ���������� ����
		if(quiz==null&&str[1].equals("������")){
			int i = random.nextInt(13);
			quiz = quizList[i];
			ans = ansList[i];
			jang = jangList[i];
			sendAll(session, "",0);	
		}
		
		// �����
		if(ans!=null&&ans.equals(str[1])){
			//���� ���� ����
			quiz=null;
			ans=null;
			//���� ����ڿ��� ����Ʈ 
			point.jaumPoint(str[0]);
			//���� �޽��� ���
			sendAll(session, str[0]+"�� �����Դϴ�.",3);
		}
		// ��� ������ ���⸦ �Է½�
		if(quiz!=null&&str[1].equals("����")){
			//���� ���� �ʱ�ȭ
			quiz=null;
			ans=null;
			//���� ���� �޽��� ���
			sendAll(session, str[0]+"���� ������ �����ϼ̽��ϴ�.",3);
		}
		// ������ ó�� ���ӽ� 
		if(str[0].equals("firstlogin")){
			//�α��ο� �̹� ����ڰ� �߰����ִ°��
			if(login!=null&&login.contains(str[1])){
				//������ ��ω�� �� ����
				login = login.replaceFirst(str[1]+"<br>", "");
			}
			//����� ���̵� �α��ο� �߰�
			login += str[1]+"<br>";
			//�α��ο� null�� ����
			login = login.replace("null", "");
			sendAll(session, "list"+"div<h5>������~��������..</h5>"+login,2);
		}
		// ������ ��������
		else if(str[0].equals("sessionEnd")){
			//���� ��Ͽ��� ����� ����
			login = login.replace(str[1]+"<br>", "");
			sendAll(session, "list"+"div<h5>������~��������..</h5>"+login,2);
			sendAll(session, "out"+"div"+str[1],1);
		}
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
	
	public void sendAll(Session session, String message, int start) throws IOException{
	
		synchronized (clients) {
			for(Session client : clients){
				if(start==1){
					if(!client.equals(session)){
						client.getBasicRemote().sendText(message);
					}
				}
				//0 ���� ����
				else if(start==0){
					client.getBasicRemote().sendText("systemdiv"+"("
				+jang+") "+quiz+"div");
				}
				//2 ��ü��
				else if(start==2){
					client.getBasicRemote().sendText(message);
				}
				//3 ����
				else if(start==3){
					client.getBasicRemote().sendText("systemdiv"
							+ "<font color=blue size=5>"+message+"</font>div ");
				}

			}
		}
	}
}
