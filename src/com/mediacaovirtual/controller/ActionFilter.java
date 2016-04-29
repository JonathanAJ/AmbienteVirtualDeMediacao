package com.mediacaovirtual.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActionFilter implements Filter {
	
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest requestServ = (HttpServletRequest) request;
		HttpServletResponse responseServ = (HttpServletResponse) response;
        if (requestServ.getSession().getAttribute("usuario") != null) {
            System.out.println("Está logado!");
            chain.doFilter(request, response);
        } else {
            System.out.println("Não está logado!");
            responseServ.sendRedirect(requestServ.getContextPath() + "/login.jsp");
        }
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
