package ts_playmodule;

import java.net.Socket;

//������ ������ �÷����ϴ� ������ Ŭ�����̴�.
public class GameUser {
	GameRoom room; // ������ ���� ���̴�.
	Socket sock;
	String nickName;
	int uid;

	// ���ӿ� ���õ� ���� ����
	// ...
	//
	PlayerGameInfo.Location playerLocation; // ���� ����
	PlayerGameInfo.Status playerStatus; // ���� ����

	public GameUser() { // �ƹ��� ������ ���� ���� ������ ���� ��

	}

	public GameUser(String _nickName) { // �г��� ������ ������ ����
		this.nickName = _nickName;
	}

	public GameUser(int _uid, String _nickName) { // UID, �г��� ������ ������ ����
		this.uid = _uid;
		this.nickName = _nickName;
	}

	public void EnterRoom(GameRoom _room) {
		_room.EnterRoom(this); // �뿡 �����Ų ��
		this.room = _room; // ������ ���� ���� ������ �����Ѵ�.(�߿�)		
	}

	public void SetPlayerStatus(PlayerGameInfo.Status _status) { // ������ ���¸� ����
		this.playerStatus = _status;
	}

	public void SetPlayerLocation(PlayerGameInfo.Location _location) { // ������ ��ġ�� ����
		this.playerLocation = _location;
	}
}
