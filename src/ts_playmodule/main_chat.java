package ts_playmodule;
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


//@ServerEndpoint�� Ŭ���̾�Ʈ���� ������ ���� �� �ּҷ� �����մϴ�.
//@OnMessage������ Ŭ���̾�Ʈ�� ���� �޽����� ���������� ó���Դϴ�.
//@OnOpen�� Ŭ���̾�Ʈ���� ������ ������ ���� ó���Դϴ�.
//@OnClose�� ������ �������� ó���Դϴ�.

// @ServerEndpoint ������̼��� ��������μ� WEB �������� ���� ������ URL 
// ������ ����Ͽ� ���� ������ �������ָ� ������Ƽ�� ���� decoder�� encoder�� ����� �� �ִ�.
// �̱��� �����̴�.
@ServerEndpoint("/main_chat")
public class main_chat {
    static int chk=0;
    static String quiz=null;
    static String ans=null;
    static String jang=null;
    static String quizList[]={"��������","������","������ ����","����","�� ����","����������","�� ��","����",
    							"������ ������","��������","��������","������ ���� ������","������"};
    static String ansList[]={"�ظ�����","���̶�","�г��� ����","�ǳ�","�� ��Ŭ","Ʈ��������","�� ŷ","����",
    							"¯���� ������","�Ƶ�����","�̴��߻�","������ �߻� �ɷη�","������"};
    static String jangList[]={"��ȭ","��ȭ","��ȭ","��ȭ","��ȭ","��ȭ","��ȭ","��ȭ",
    							"�ִ�","�ִ�","�ִ�","�ִ�","�ִ�"};
    static String str[];
    static String login;
    Random random = new Random();
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
	}
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		chk++;
		str = message.split("div");
		sendAll(session, message,1);
		System.out.println(str[1]);
		System.out.println(str[0]);
		
		if(quiz!=null&&str[1].equals("������")){
			sendAll(session, "",0);
		}
		if(quiz==null&&str[1].equals("������")){
			int i = random.nextInt(13);
			quiz = quizList[i];
			ans = ansList[i];
			jang = jangList[i];
			sendAll(session, "",0);	
		}
		
	
		if(ans!=null&&ans.equals(str[1])){
			quiz=null;
			ans=null;
			sendAll(session, str[0]+"�� �����Դϴ�.",3);
		}
		if(quiz!=null&&str[1].equals("����")){
			quiz=null;
			ans=null;
			sendAll(session, str[0]+"���� ������ �����ϼ̽��ϴ�.",3);
		}
		if(str[0].equals("firstlogin")){
			if(login!=null&&login.contains(str[1])){
				login = login.replaceFirst(str[1]+"<br>", "");
			}
			login += str[1]+"<br>";
			login = login.replace("null", "");
			sendAll(session, "list"+"div������~��������..<br>"+login,2);
		}
		else if(str[0].equals("sessionEnd")){
			login = login.replace(str[1]+"<br>", "");
			sendAll(session, "list"+"div������~��������..<br>"+login,2);
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
					client.getBasicRemote().sendText("("+jang+")div"+quiz+"div");
				}
				//2 ��ü��
				else if(start==2){
					client.getBasicRemote().sendText(message);
				}
				//3 ����
				else if(start==3){
					client.getBasicRemote().sendText("�ý���div"
							+ "<font color=blue size=2>"+message+"</font>div ");
				}

			}
		}
	}
}
