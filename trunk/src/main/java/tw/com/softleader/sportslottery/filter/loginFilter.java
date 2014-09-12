package tw.com.softleader.sportslottery.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tw.com.softleader.sportslottery.setting.entity.UserEntity;

/**
 * Servlet Filter implementation class loginFilter
 */
public class loginFilter implements Filter {
	
	String servletPath;
	String contextPath;
	String requestURI;
	
    /**
     * Default constructor. 
     */
    public loginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		try {
			System.out.println("diFilter...");
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			servletPath = req.getServletPath();  
			contextPath = req.getContextPath();
			requestURI  = req.getRequestURI();
			boolean isRequestedSessionIdValid = req.isRequestedSessionIdValid();
			
			if(checkLogin(req)) {
				chain.doFilter(request, response);
			} else {				//  需要登入，尚未登入
				HttpSession session = req.getSession();
				if (!isRequestedSessionIdValid ) {
					session.setAttribute("timeOut", "使用逾時，請重新登入");
				}
				System.out.println(contextPath);
				resp.getOutputStream().println("<script>callMyModal();</script>");
				resp.sendRedirect(contextPath + "/goIndex");
				//chain.doFilter(request, response);
				return;
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException("Request / Response 型態錯誤");
		}
	}

	private boolean checkLogin(HttpServletRequest req) {
		System.out.println("checkLogin...");
		HttpSession session = req.getSession();
		UserEntity loginToken = (UserEntity) session.getAttribute("user");
		if (loginToken == null) {
			return false;
		} else {
			return true;
		}
	}
	
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("Login Filter...");
	}

}
