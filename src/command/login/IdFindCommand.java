package command.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.loginmodule.idpw;
//���̵� ã�� Ŀ�ǵ�
public class IdFindCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		//���̵� ���ã�� ��� ����
		idpw search = new idpw();
		//��� ����, ���� ��ȯ�� ���ڿ�
		String rightId = "";
		//�̸��� �ޱ�
		String name = request.getParameter("name");
		//�̸��� �ޱ�
		String email = request.getParameter("email");
		//ã�� ���̵� 
		String id = search.searchId(name, email);
		//���̵� ���̷� ���� ���̰� 0�ϰ��
		if(id.length()==0){
			rightId = "failed";
			id = "�߸� �Է��ϼ̰ų� ���� �����Դϴ�..";
			request.setAttribute("id", id);
			request.setAttribute("rightId", rightId);
		}
		//�׿ܿ� ó��
		else{
			rightId = "success";
			request.setAttribute("id", id);
			request.setAttribute("rightId", rightId);
			request.setAttribute("email", email);
		}
		
		return "/CORDING/login/id_proc.jsp";
	}

}
