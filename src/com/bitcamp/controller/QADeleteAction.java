package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.service.BoardService;

public class QADeleteAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int qano=Integer.parseInt(request.getParameter("qano"));
		BoardService service=BoardService.getService();
		service.deleteService(qano);
		
		ForwardAction forward=new ForwardAction();
		forward.setRedirect(true);
		forward.setPath("qalist.do");
		
		return forward;
	}
}