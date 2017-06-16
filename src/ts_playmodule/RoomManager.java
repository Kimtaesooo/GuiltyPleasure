package ts_playmodule;

import java.util.ArrayList;
import java.util.List;

public class RoomManager {
static List<GameRoom> roomList; // ���� ����Ʈ
	
	public RoomManager(){
		roomList = new ArrayList<GameRoom>();
	}
	
	public GameRoom CreateRoom(){ // ���� ���� ����(�� ��)
		GameRoom room = new GameRoom();
		roomList.add(room);
		System.out.println("Room Created!");
		return room;
	}
	
	public GameRoom CreateRoom(GameUser _owner){ // ������ ���� ������ �� ���(������ �������� ��)
		GameRoom room = new GameRoom(_owner);
		roomList.add(room);
		System.out.println("Room Created!");
		return room;
	}
	
	public GameRoom CreateRoom(List<GameUser> _userList){
		GameRoom room = new GameRoom(_userList);
		roomList.add(room);
		System.out.println("Room Created!");
		return room;
	}
	
	public static void RemoveRoom(GameRoom _room){
		roomList.remove(_room); // ���޹��� ���� �����Ѵ�.
		System.out.println("Room Deleted!");
	}
	
	public static int RoomCount(){ return roomList.size();} // ���� ũ�⸦ ������
}
