package command.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.loginmodule.idpw;

public class PwFindCommand implements Command{
	// ��й�ȣ ã��
	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		idpw search = new idpw();
		String rightPw = "success";
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String select = request.getParameter("select");
		String answer = request.getParameter("answer");
		String pw = search.searchPw(id, email, select, answer);
		
		if(pw.length()==0){
			request.setAttribute("rightPw", "failed");
			request.setAttribute("pw", "�߸� �Է��ϼ̰ų� ���� �����Դϴ�..");
		}
		else{
			request.setAttribute("rightPw", rightPw);
			request.setAttribute("pw", pw);
		}
		
		return "/CORDING/login/pw_proc.jsp";
	}

}
