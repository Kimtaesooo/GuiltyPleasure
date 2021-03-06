package controller.daon;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.shopmodule.ShopManager;
import dto.Shop;


@WebServlet(urlPatterns="/shopBuy")
public class ShopBuyCommand extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		req.setCharacterEncoding("euc-kr");
		ShopManager sDao = ShopManager.getInstance();
		String code=req.getParameter("code");
		String id=req.getParameter("id");
		
		int userPoint=Integer.parseInt(req.getParameter("userPoint"));
		Shop dto=sDao.selectOneItemByCode(code); //아이템 코드값으로 아이템 dto구성
		sDao.minusOneItem(code, dto.getS_limit_num()); //아이템 수량 하나 감소
		sDao.setUserPoint(id, userPoint); //유저 포인트 감소
		sDao.addPurchaseList(id,dto); //구매리스트에추가
		sDao.addItemFunction(id, dto); //아이템 기능 추가
		
		String nickname=req.getParameter("nickname");
		if(nickname!=null){
		sDao.editNickname(id, nickname);
		}
		resp.sendRedirect("/GuiltyPleasure/CORDING/shop/outline/shop.jsp?cmd=SHOPLIST");
	}
}
