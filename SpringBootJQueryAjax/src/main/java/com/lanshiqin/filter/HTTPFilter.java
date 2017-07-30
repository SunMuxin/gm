package com.lanshiqin.filter;

import java.io.IOException;

import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.FilterConfig;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
  
public class HTTPFilter implements Filter{  
        
  
    @Override  
    public void destroy() {  
        // TODO Auto-generated method stub  
          
    }
  
    @Override  
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)  
            throws IOException, ServletException {  
        // TODO Auto-generated method stub  
    	((HttpServletResponse) response).setHeader("Access-Control-Allow-Origin", "*");
    	((HttpServletResponse) response).setHeader("Access-Control-Allow-Methods","GET");
    	((HttpServletResponse) response).setHeader("Access-Control-Allow-Headers","x-requested-with,content-type");
        chain.doFilter(request, response);
    }  
  
    @Override  
    public void init(FilterConfig arg0) throws ServletException {  
        // TODO Auto-generated method stub
    }
}  