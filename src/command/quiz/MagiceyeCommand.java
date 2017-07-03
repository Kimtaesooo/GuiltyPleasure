package command.quiz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Command;
import dao.QuizRegDAO;
import dao.quizmodule.GetPoint;

/**
 * �������̰����� �ϰ� ����Ʈ�� �����Ҷ� ���Ǵ� Ŭ����
 * @see GetPoint ����Ʈ�� �����ϴ� ����� �ִ� Ŭ����*/
public class MagiceyeCommand implements Command{
	GetPoint point = new GetPoint();
	
	/**
	 * @param HttpServletRequest ��û�� �������� request����
	 * @param HttpServletResponse ��û�� �������� response����
	 * 
	 * */
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		int i = point.SavePoint(id);
		if(i!=0){
			System.out.println("����");
			return "/CORDING/magic/magicEyePlay.jsp";
		}else{
			return "/CORDING/magic/magicEyePlay.jsp";
		}
	}
	
	
}
