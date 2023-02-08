package com.hb;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.dao.memberDao;
import com.hb.dto.memberDto;

public class signupInsert implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String InputId = request.getParameter("id");
		String InputPw = request.getParameter("pw");
		String InputName = request.getParameter("name");
		memberDao dao = new memberDao();
		dao.setMemberDB(InputId,InputPw,InputName);
		response.sendRedirect("loginPage.jsp");
	}

}
