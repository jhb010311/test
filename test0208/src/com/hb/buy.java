package com.hb;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.dao.memberDao;

public class buy implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		int point = Integer.parseInt(request.getParameter("point"));
		memberDao dao = new memberDao();
		dao.buy(id,point);
		
		request.getRequestDispatcher("mainPage.jsp").forward(request, response);
	}

}
