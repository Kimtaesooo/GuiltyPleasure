package dao.quizmodule;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.quiz.CommandFactory;
import controller.Command;
import dto.Quiz;

/**
 * @author ������
 * �̱��÷��� ���� Ŭ����
 * */
@WebServlet(urlPatterns = "/quiz")
public class SinglePlay extends HttpServlet {
	Quiz q;
	
	/**
	 * @param HttpServletRequest ��û�� �������� request����
	 * @param HttpServletResponse ��û�� �������� response����
	 * 
	 * @see doPost post������� ó���ϰԲ� ���ִ� Ŭ����
	 * */
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	/**
	 * @param HttpServletRequest ��û�� �������� request����
	 * @param HttpServletResponse ��û�� �������� response����
	 * 
	 * @see QuizRegDAO ���� ��Ͽ� �ʿ��� db����� �۾��� ���ִ� Ŭ����
	 * @see Quiz ��� ��ϵǴ� ��ü Ŭ����
	 * */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		HttpSession session = req.getSession();
		String cmd = req.getParameter("cmd");
		ArrayList resultList = null;
		int counter = 0;
		String method= req.getParameter("method");
		if(req.getParameter("counter")!=null){
			counter = Integer.parseInt(req.getParameter("counter"));
			counter--;
			req.setAttribute("counter", counter);
		}
		
		//�̱� ���� ����� �� ����Ʈ
		if(method.equals("SINGLE")){
			//������
			if(session.getAttribute("SingleResultlist") != null){
				resultList = (ArrayList) session.getAttribute("SingleResultlist");
			}else{
				resultList = new ArrayList();
			}
			
			if(cmd.equals("QUIZ_RESULT")){
				String[] result = req.getParameterValues("result");
				System.out.println("ī��Ʈ "+counter +"����:"+result);
				resultList.add(result);
				session.setAttribute("SingleResultlist", resultList);
			}
		}else{
			//�ְ���
			if(session.getAttribute("ShortResultlist") != null){
				resultList = (ArrayList) session.getAttribute("ShortResultlist");
			}else{
				resultList = new ArrayList();
			}
			
			if(cmd.equals("QUIZ_RESULT")){
				String[] result = req.getParameterValues("result");
				resultList.add(result);
				session.setAttribute("ShortResultlist", resultList);
			}
		}
		
		
		CommandFactory factory = CommandFactory.newInstance();
		Command command = factory.createCommand(cmd);
	
		String url = (String) command.processCommand(req, resp);
		Quiz q = (Quiz) req.getAttribute("quiz");
		
		req.setAttribute("quiz", q);
		
		RequestDispatcher dis = req.getRequestDispatcher(url);
		dis.forward(req, resp);
	}

}
