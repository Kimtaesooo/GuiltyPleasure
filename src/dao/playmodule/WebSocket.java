package dao.playmodule;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")
public class WebSocket {
	
	//�� ���� ����� ȣ��Ǵ� �̺�Ʈ
	@OnOpen
	public void handleOpen(){
		System.out.println("Ŭ���̾�Ʈ ����");
	}
	//���������� ���� �޽����� ���� ȣ��Ǵ� �̺�Ʈ
	
	@OnMessage
	public String handleMessage(String message){
		System.out.println("Ŭ���̾�Ʈ�� ���� ���� �޼��� :" + message);
		String replymessage = "����1" + message;
		System.out.println("Ŭ���̾�Ʈ���� ������ �޼���" + replymessage);
		return replymessage;
	}
	
	//�������� ������ ȣ��Ǵ� �̺�Ʈ
	@OnClose
	public void handleClose(){
		System.out.println("Ŭ���̾�Ʈ ���� ����");
	}
	
	//�� ������ ������ ���� ȣ��Ǵ� �̺�Ʈ
	@OnError
	public void handleError(Throwable t){
		t.printStackTrace();
	}
}
