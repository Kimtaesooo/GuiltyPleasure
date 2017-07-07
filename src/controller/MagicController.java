package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.quiz.CommandFactory;

/**
 * �������� ������ �����ϴ� ����
 * @author ������
 * */
@WebServlet(urlPatterns="/magic")
public class MagicController extends HttpServlet {
	
	/**
	 * @param HttpServletRequest ��û�� �������� request����
	 * @param HttpServletResponse ��û�� �������� response����
	 * @see doGet GET����� ó���� �ϴ� �޼���
	 * @see RequestDispatcher cmd�� ���� ���� url�� �޾ƿ� url�ּҷ� ������ Ŭ����
	 * */		
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	
	/**
	 * @see doPost POST������� �� ����� ó���ϴ� �޼���
	 * */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cmd = req.getParameter("cmd");
		System.out.println(cmd);
		CommandFactory factory = CommandFactory.newInstance();
		Command command = factory.createCommand(cmd);
		
		String url = command.processCommand(req, resp).toString();
		
		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}

}
