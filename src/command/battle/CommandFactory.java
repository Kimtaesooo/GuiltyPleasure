package command.battle;

import controller.Command;

public class CommandFactory {
	private static CommandFactory instance = new CommandFactory();
	
	private CommandFactory(){
		
	}
	
	public static CommandFactory getInstance(){
		return instance;
	}
	public Command createCommand(String cmd){
		
		// �� �����
		if(cmd.equals("MAKEROOM")){
			return new MakeRoomCommand();
		}
		// ��Ʋ ���â �̵�
		else if(cmd.equals("EXIT")){
			return new ExitCommand();
		}
		// ��Ʋ �����ϱ�
		else if(cmd.equals("GIVEUP")){
			return new GiveUpCommand();
		}
		return null;
	}
}
