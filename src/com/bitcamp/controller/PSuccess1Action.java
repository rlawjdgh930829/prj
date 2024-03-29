package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.SponDTO;
import com.bitcamp.service.PaymentService;

public class PSuccess1Action implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		MemberDTO memberdto = (MemberDTO) session.getAttribute("member");
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		PaymentService service = PaymentService.getInstance();
		service.plusMoney(boardno, memberdto.getMno(), amount);
		ForwardAction forward = new ForwardAction();
		forward.setRedirect(true);
		forward.setPath("psuccess2.do");
		return forward;
	}

}
