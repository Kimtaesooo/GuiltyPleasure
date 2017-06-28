package controller.hsy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.boardmodule.FreeBoard;

public class WriteCommand implements CommandBoard {
	FreeBoard dao = new FreeBoard();
	
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String u_id = req.getParameter("u_id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		dao.regBoard(u_id, title, content);
		
		return "/CORDING/board/BoardList.jsp";
	}
}
