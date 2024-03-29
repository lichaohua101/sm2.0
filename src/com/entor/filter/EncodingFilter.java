package com.entor.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class EncodingFilter implements Filter {

    public EncodingFilter() {
    	
    }

	public void destroy() {
		
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req =(HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse)response;
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		chain.doFilter(req, resp);
		System.out.println("过滤开始");
	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("过滤结束");
	}

}
