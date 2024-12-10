package Services;

import java.util.List;

import DAO.IOrderDao;
import DAO.OrderDaoImp;
import Models.Cart;
import Models.Order;

@SuppressWarnings("serial")
public class OrderServiceImp implements IOrderService{

	IOrderDao orderDao = new OrderDaoImp();
	@Override
	public int insert(Order order) {
		return orderDao.insert(order);
	}
	
	@Override
	public void insertcart(String username, String bookid, int quantity) {
		orderDao.insertcart(username, bookid, quantity);
	}

	@Override
	public List<Cart> getListCartByUsername(String username) {
		return orderDao.getListCartByUsername(username);
	}

	@Override
	public void removeCart(String username, int bookid) {
		orderDao.removeCart(username, bookid);
		
	}

	@Override
	public void checkoutCart(String username, List<Cart> cartItems, int orderId) {
		orderDao.checkoutCart(username, cartItems, orderId);
		
	}

}
