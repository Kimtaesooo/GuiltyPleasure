package command.login;


import controller.Command;

public class CommandFactory {
	private static CommandFactory instance = new CommandFactory();
	
	private CommandFactory(){
		
	}
	
	public static CommandFactory getInstance(){
		return instance;
	}
	public Command createCommand(String cmd){
		
		// �α���
		if(cmd.equals("login")){
			return new LoginCommand();
		}
		// �α׾ƿ�
		else if(cmd.equals("logout")){
			return new LogoutCommand();
		}
		// ȸ������
		else if(cmd.equals("logreg")){
			return new LogResistCommand();
		}
		// ���̵� ã��
		else if(cmd.equals("logidfind")){
			return new IdFindCommand();
		}
		// �н����� ã��
		else if(cmd.equals("logpwfind")){
			return new PwFindCommand();
		}
		return null;
	}
}
