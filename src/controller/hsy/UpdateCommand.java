package controller.hsy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateCommand  implements CommandBoard{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//�̵��� �� ó���� ����
		
		//�Է°� Ȯ��
		
		//����ó��
		
		return "/CORDING/board/BoardUpdate.jsp";
	}
}