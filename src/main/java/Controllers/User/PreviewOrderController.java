package Controllers.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import Models.Account;
import Models.Order;
import Models.User;
import Services.AccountServiceImp;
import Services.IAccountService;
import Services.IOrderService;
import Services.OrderServiceImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/User/ListOrder")
public class PreviewOrderController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    IOrderService orderService = new OrderServiceImp();
    IAccountService accountService = new AccountServiceImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy session, nếu không có session thì tạo mới
        HttpSession session = req.getSession(false);
        
        // Kiểm tra nếu session là null
        if (session == null) {
            resp.sendRedirect("login.jsp");  // Nếu session không tồn tại, chuyển hướng đến trang đăng nhập
            return;
        }

        // Lấy đối tượng account từ session
        Account account = (Account) session.getAttribute("account");
        
        // Kiểm tra nếu account là null
        if (account == null) {
            resp.sendRedirect("login.jsp");  // Nếu không có account trong session, chuyển hướng đến trang đăng nhập
            return;
        }

        // Lấy thông tin user từ username trong account
        User user = accountService.getUserByUsername(account.getUsername());
        
        // Kiểm tra nếu user là null
        if (user == null) {
            resp.sendRedirect("login.jsp");  // Nếu không tìm thấy user, chuyển hướng đến trang đăng nhập
            return;
        }

        // Lấy danh sách đơn hàng của user
        List<Order> orders = orderService.listOrderByUsername(user.getFullname());
        
        // Đưa danh sách đơn hàng vào request
        req.setAttribute("orders", orders);
        
        // Chuyển hướng đến view previeworder.jsp
        req.getRequestDispatcher("/bootstrap5/previeworder.jsp").forward(req, resp);
    }
}
