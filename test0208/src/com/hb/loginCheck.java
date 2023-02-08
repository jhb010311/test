package com.hb;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.dao.memberDao;
import com.hb.dto.memberDto;

public class loginCheck implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String InputId = request.getParameter("id");
		String InputPw = request.getParameter("pw");
		memberDao dao = new memberDao();
		memberDto dto = dao.getMemberDto(InputId);
		if(InputPw.equals(dto.getPw())) {
			//response.sendRedirect("mainPage.jsp");
			if(InputId.equals("admin")) {
				response.sendRedirect("adminPage.jsp");
			}else {
				request.getRequestDispatcher("mainPage.jsp").forward(request, response);
			}
		} else {
			response.sendRedirect("loginPage.jsp");
		}
		
	}

}
