package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Configs.DBConnect;
import Models.Cart;
import Models.Order;

@SuppressWarnings("serial")
public class OrderDaoImp extends DBConnect implements IOrderDao{

	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	IBookDao bookDao = new BookDaoImp();
	
	@Override
	public void insertcart(String username, String bookid, int quantity) {
		String sql = "INSERT INTO cart(username, idbook, quantity) VALUES(?, ?, ?)";

		try {
			conn = super.getConnection();

			ps = conn.prepareStatement(sql);

			ps.setString(1, username);
	        ps.setString(2, bookid);
	        ps.setInt(3, quantity);

	        ps.executeUpdate();


		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Cart> getListCartByUsername(String username) {
		 List<Cart> carts = new ArrayList<>();
		    String query = "SELECT id, title, price, discount_percentage, image_url, quantity " +
		                   "FROM cart c INNER JOIN book b ON c.idbook = b.id WHERE username = ?";

		    try (Connection conn = DBConnect.getConnection();
		         PreparedStatement ps = conn.prepareStatement(query)) {
		         
		        ps.setString(1, username);

		        try (ResultSet rs = ps.executeQuery()) {
		            while (rs.next()) {
		                Cart cart = new Cart(
		                    rs.getInt("id"),
		                    rs.getString("title"),
		                    rs.getString("image_url"),
		                    rs.getInt("price"),
		                    rs.getInt("discount_percentage"),
		                    rs.getInt("quantity")
		                );
		                carts.add(cart); 
		            }
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return carts; 
	}

	@Override
	public void removeCart(String username, int bookid) {
		String query = "DELETE FROM cart WHERE username = ? AND idbook = ?";
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        
	        ps.setString(1, username);
	        ps.setInt(2, bookid);
	        ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
	}

	public void checkoutCart(String username, List<Cart> cartItems, int orderId) {
	    String getBookPriceQuery = "SELECT price FROM book WHERE id = ?";
	    String updateStockQuery = "UPDATE book SET stock = stock - ? WHERE id = ?";
	    String insertOrderDetailsQuery = "INSERT INTO detailorder (idorder, idbook, quantity, total) VALUES (?, ?, ?, ?)";
	    String deleteCartQuery = "DELETE FROM cart WHERE username = ?";

	    try {
			if (conn == null || conn.isClosed()) {
			    try {
			        // Nếu kết nối đã đóng hoặc chưa mở, mở lại kết nối
			        conn = super.getConnection();
			    } catch (SQLException e) {
			        e.printStackTrace();
			        System.err.println("Unable to get a new connection.");
			        return;
			    }
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	    try (
	        PreparedStatement getBookPriceStmt = conn.prepareStatement(getBookPriceQuery);
	        PreparedStatement updateStockStmt = conn.prepareStatement(updateStockQuery);
	        PreparedStatement insertOrderDetailsStmt = conn.prepareStatement(insertOrderDetailsQuery);
	        PreparedStatement deleteCartStmt = conn.prepareStatement(deleteCartQuery)
	    ) {
	        for (Cart item : cartItems) {
	            // 1. Lấy giá sách từ bảng `book`
	            int price = 0;
	            getBookPriceStmt.setInt(1, item.getBookid());
	            try (ResultSet rs = getBookPriceStmt.executeQuery()) {
	                if (rs.next()) {
	                    price = rs.getInt("price");
	                } else {
	                    System.err.println("Không tìm thấy sách với ID: " + item.getBookid());
	                    continue;
	                }
	            }

	            // 2. Tính tổng tiền cho chi tiết đơn hàng
	            int total = price * item.getQuantity();

	            // 3. Cập nhật số lượng tồn kho
	            updateStockStmt.setInt(1, item.getQuantity());
	            updateStockStmt.setInt(2, item.getBookid());
	            updateStockStmt.executeUpdate();

	            // 4. Thêm chi tiết đơn hàng vào bảng `detailorder`
	            insertOrderDetailsStmt.setInt(1, orderId); // Sử dụng orderId được tạo trước đó
	            insertOrderDetailsStmt.setInt(2, item.getBookid());
	            insertOrderDetailsStmt.setInt(3, item.getQuantity());
	            insertOrderDetailsStmt.setInt(4, total);
	            insertOrderDetailsStmt.executeUpdate();
	        }

	        // 5. Xóa giỏ hàng của người dùng
	        deleteCartStmt.setString(1, username);
	        deleteCartStmt.executeUpdate();

	        System.out.println("Checkout completed successfully.");
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.err.println("Checkout failed.");
	    } finally {
	        try {
	            // Đảm bảo đóng kết nối nếu không còn sử dụng (nếu không dùng connection pool)
	            if (conn != null && !conn.isClosed()) {
	                conn.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}


	@Override
	public int insert(Order order) {
		String sql = "INSERT INTO `order` (namecustomer, address, phone, email, notes, subtotal, ship, methodship, methodpay, status, date) "
	               + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	    int orderId = -1;

	    try {
	        conn = super.getConnection(); 
	        ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS); // Chuẩn bị truy vấn với tùy chọn trả về khóa sinh tự động

	        
	        ps.setString(1, order.getNamecustomer());
	        ps.setString(2, order.getAddress());
	        ps.setString(3, order.getPhone());
	        ps.setString(4, order.getEmail());
	        ps.setString(5, order.getNotes());
	        ps.setInt(6, order.getSubtotal());
	        ps.setInt(7, order.getShip());
	        ps.setString(8, order.getMethodship());
	        ps.setString(9, order.getMethodpay());
	        ps.setString(10, order.getStatus());
	        ps.setString(11, order.getDate());

	        int result = ps.executeUpdate();
	        if (result > 0) {
	            System.out.println("Dữ liệu đã được chèn vào cơ sở dữ liệu.");

	            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
	                if (generatedKeys.next()) {
	                    orderId = generatedKeys.getInt(1);
	                }
	            }
	        } else {
	            System.out.println("Không có bản ghi nào được thêm.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return orderId;
	}

}
