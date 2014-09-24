package tw.com.softleader.sportslottery.filter;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
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
	private UserEntity loginToken;
	
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
		System.out.println("login filter");
		try {
			System.out.println("diFilter...");
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			servletPath = req.getServletPath();  
			contextPath = req.getContextPath();
			requestURI  = req.getRequestURI();
			boolean isRequestedSessionIdValid = req.isRequestedSessionIdValid();
			
			if(checkLogin(req)) {
				if(loginToken.getUserState().isEmpty() || !loginToken.getUserState().equals("0")) {
					req.setAttribute("locking", "true");
					req.getRequestDispatcher("/index.jsp").forward(req, resp);
				}else {
					chain.doFilter(request, response);
				}
			} else {				//  需要登入，尚未登入
				HttpSession session = req.getSession();
				if (!isRequestedSessionIdValid ) {
					session.setAttribute("timeOut", "使用逾時，請重新登入");
				}
				System.out.println(contextPath);
				//resp.getOutputStream().println("<script>callMyModal();</script>");
				req.setAttribute("mustBeLogin", "true");
				System.out.println(req.getRequestURI());
				if(req.getRequestURI().indexOf("/lottery")>0){
					req.setAttribute("errorMsg", "請登入後在進行投注!");
				} else if(req.getRequestURI().indexOf("/userOddsSearch")>0){
					req.setAttribute("errorMsg", "登入後才能觀看使用者投注資訊!");
				}
				req.getRequestDispatcher("/index.jsp").forward(req, resp);
				//resp.sendRedirect(contextPath + "/goIndex");
				//chain.doFilter(request, response);
				return;
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException("Request / Response 型態錯誤");
		}
	}

	private boolean checkLogin(HttpServletRequest req) {
		//System.out.println("checkLogin...");
		HttpSession session = req.getSession();
		loginToken = (UserEntity) session.getAttribute("user");
		if (loginToken == null) {
			System.out.println("checkLogin !!FAIL!!");
			return false;
		} else {
			System.out.println("checkLogin success");
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
