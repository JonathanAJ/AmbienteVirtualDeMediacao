package com.mediacaovirtual.controller.filtros;

//import java.io.IOException;
//import java.text.Normalizer;
//import java.util.Collections;
//import java.util.Enumeration;
//import java.util.HashMap;
//import java.util.Map;
//import java.util.Set;
//import java.util.regex.Pattern;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletRequestWrapper;
//
///**
// * Filters Http requests and removes malicious characters/strings
// * (i.e. XSS) from the Query String
// */
//public class FiltroXSS implements Filter {
//	class XSSRequestWrapper extends HttpServletRequestWrapper {
//		
//	}
//
//	@Override
//	public void destroy() {
//		System.out.println("XSSPreventionFilter: destroy()");
//	}
//
//	@Override
//	public void doFilter(ServletRequest request, ServletResponse response, 
//			FilterChain chain) throws IOException, ServletException {
//		XSSRequestWrapper wrapper = new XSSRequestWrapper((HttpServletRequest)request);
//		chain.doFilter(wrapper, response);
//	}
//
//	@Override
//	public void init(FilterConfig filterConfig) throws ServletException {
//		System.out.println("XSSPreventionFilter: init()");
//	}
//}

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.mediacaovirtual.controller.XSSController;

public class FiltroXSS implements Filter {

    @Override
	public void destroy() {
		
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("Entrou no FiltroXSS");
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		chain.doFilter(new XSSController(httpRequest), response);
	}
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
	
	}

}
