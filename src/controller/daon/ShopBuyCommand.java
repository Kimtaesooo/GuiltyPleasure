package controller.daon;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.shopmodule.ShopManager;
import dto.Shop;

public class ShopBuyCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ShopManager sDao = ShopManager.getInstance();
		String code=req.getParameter("code");
		String id=req.getParameter("id");
		
		int userPoint=Integer.parseInt(req.getParameter("userPoint"));
		Shop dto=sDao.selectOneItemByCode(code); //������ �ڵ尪���� ������ dto����
		sDao.minusOneItem(code, dto.getS_limit_num()); //������ ���� �ϳ� ����
		sDao.setUserPoint(id, userPoint); //���� ����Ʈ ����
		sDao.addPurchaseList(id,dto); //���Ÿ���Ʈ���߰�
		sDao.addItemFunction(id, dto); //������ ��� �߰�
		
		String nickname=req.getParameter("nickname");
		if(nickname!=null){
		sDao.editNickname(id, nickname);
		}
		
		return "/CORDING/shop/outline/shop.jsp";
	}

}
