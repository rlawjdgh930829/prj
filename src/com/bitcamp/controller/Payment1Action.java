package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.SponDTO;
import com.bitcamp.service.SponService;

public class Payment1Action implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		SponService service = SponService.getService();
		SponDTO spondto = service.getDetail(boardno);
		request.setAttribute("spondto", spondto);
		ForwardAction forward = new ForwardAction();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/templete.jsp?page=payment1.jsp");
		return forward;
	}

}
