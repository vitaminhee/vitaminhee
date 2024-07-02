package com.webjjang.util.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class AuthorityFilter
 */
@WebFilter("/AuthorityFilter")
public class AuthorityFilter extends HttpFilter implements Filter {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
		HttpServletRequest req = (HttpServletRequest) request; // 캐스팅
		
		// 권한 처리
		// 기능 1개 당 1개의 필터를 만들쟈
		String uri = req.getRequestURI();
		System.out.println("AuthorityFilter.do.Filter()-----------------------");
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
