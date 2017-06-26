package ts_playmodule;

import java.util.ArrayList;
import java.util.List;

public class GameRoom {
	List<GameUser> userList;
	GameUser roomOwner; // ����
	String roomName; // �� �̸�

	public GameRoom() { // �ƹ��� ���� ���� ������ ��
		userList = new ArrayList<GameUser>();
	}

	public GameRoom(GameUser _user) { // ������ ���� ���鶧
		userList = new ArrayList<GameUser>();
		userList.add(_user); // ������ �߰���Ų ��
		this.roomOwner = _user; // ������ ������ �����.
	}

	public GameRoom(List<GameUser> _userList) { // ���� ����Ʈ�� ���� ������
		this.userList = _userList; // ��������Ʈ ����
		this.roomOwner = userList.get(0); // ù��° ������ �������� ����
	}

	public void EnterRoom(GameUser _user) {
		userList.add(_user);
	}

	public void ExitRoom(GameUser _user) {
		userList.remove(_user);

		if (userList.size() < 1) { // ��� �ο��� �� ���� �����ٸ�
			RoomManager.RemoveRoom(this); // �� ���� �����Ѵ�.
			return;
		}

		if (userList.size() < 2) { // �濡 ���� �ο��� 1�� ���϶�
			this.roomOwner = userList.get(0); // ����Ʈ�� ù��° ������ ������ �ȴ�.
			return;
		}

	}

	// ���� ����

	@SuppressWarnings("unused")
	public void Broadcast(byte[] data) {
		for (GameUser user : userList) { // �濡 ���� ������ ����ŭ �ݺ�
			// �� �������� �����͸� �����ϴ� �޼��� ȣ��~
			// ex) user.SendData(data);
			
//			try {
//				user.sock.getOutputStream().write(data); // �̷������� ����Ʈ�迭�� ������.
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
		}
	}

	public void SetOwner(GameUser _user) {
		this.roomOwner = _user; // Ư�� ����ڸ� �������� �����Ѵ�.
	}

	public void SetRoomName(String _name) { // �� �̸��� ����
		this.roomName = _name;
	}
	
	public GameUser GetUserByNickName(String _nickName){ // �г����� ���ؼ� �濡 ���� ������ ������
		
		for(GameUser user : userList){
			if(user.nickName.equals(_nickName)){
				return user; // ������ ã�Ҵٸ�
			}
		}
		return null; // ã�� ������ ���ٸ�
	}

	public String GetRoomName() { // �� �̸��� ������
		return roomName;
	}

	public int GetUserSize() { // ������ ���� ����
		return userList.size();
	}

	public GameUser GetOwner() { // ������ ����
		return roomOwner;
	}

}
