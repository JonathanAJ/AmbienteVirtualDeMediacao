package com.mediacaovirtual.controller.filtros;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mediacaovirtual.dao.PostDAO;

public class FiltroPostagem implements Filter {

	private PostDAO postDAO = new PostDAO();
	
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest requestServ = (HttpServletRequest) request;
		HttpServletResponse responseServ = (HttpServletResponse) response;
		
		int id;
		try {
			id = Integer.parseInt(requestServ.getParameter("id"));
			if(postDAO.getPost(id) != null){
	            chain.doFilter(request, response);
				
			}else{
	            responseServ.sendRedirect("index.jsp");
				
			}
			
		} catch (NumberFormatException e) {
            responseServ.sendRedirect("index.jsp");
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
