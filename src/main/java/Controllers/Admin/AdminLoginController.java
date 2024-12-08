package Controllers.Admin;


import java.io.IOException;

import Models.Account;
import Services.AccountServiceImp;
import Services.IAccountService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Admin/Login")
public class AdminLoginController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	IAccountService service = new AccountServiceImp();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Views/Admin/Login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        boolean isRememberMe = false;
		String remember = req.getParameter("remember");
		
		String alertMsg = "";
		
		if ("on".equals(remember)) {
			isRememberMe = true;
		}
		
        Account account = service.Login(username, password, "admin");

        if (account != null) {
            HttpSession session = req.getSession();
            session.setAttribute("account", account);

            if (isRememberMe) {
                Cookie cookie = new Cookie("username", username);
                cookie.setMaxAge(60 * 60 * 24 * 30); 
                resp.addCookie(cookie);
            }
            resp.sendRedirect(req.getContextPath() + "/Admin/Home");
            
        } else {
        	alertMsg = "Tài khoản hoặc mật khẩu không đúng";
			req.setAttribute("alert", alertMsg);
            req.getRequestDispatcher("/Views/Admin/Login.jsp").forward(req, resp);
        }
	}
}

