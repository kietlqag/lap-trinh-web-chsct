package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.Book;
import Models.Review;
import Configs.DBConnect;

public class BookDaoImp implements IBookDao{

	@Override
	public List<Book> listBook() {
	    List<Book> books = new ArrayList<>();
	    String query = "SELECT * FROM book";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query);
	         ResultSet rs = ps.executeQuery()) {
	        
	        while (rs.next()) {
	            Book book = new Book(
	            		rs.getInt("id"),
	                    rs.getString("title"),
	                    rs.getString("author"),
	                    rs.getString("image_url"),
	                    rs.getInt("discount_percentage"),
	                    rs.getInt("rating"),
	                    rs.getInt("stock"),
	                    rs.getString("category"),
	                    rs.getDouble("price"),
	                    rs.getString("long_description")
	            );
	            books.add(book); 
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); 
	    }

	    return books; 
	}

	@Override
	public Book findById(int id) {
		Book book = null;
	    String query = "SELECT * FROM book WHERE id = ?";
	    try (Connection conn = DBConnect.getConnection(); 
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            book = new Book(
	                rs.getInt("id"),
	                rs.getString("title"),
	                rs.getString("author"),
	                rs.getString("image_url"),
	                rs.getInt("discount_percentage"),
	                rs.getInt("rating"),
	                rs.getInt("stock"),
	                rs.getString("category"),
	                rs.getDouble("price"),
	                rs.getString("long_description")
	            );
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return book;
	}

	@Override
	public List<Review> findByBookId(int bookid) {
		List<Review> reviews = new ArrayList<>();
	    String query = "SELECT a.username, r.date, r.description_review, r.stars " +
	                   "FROM account a INNER JOIN review r ON a.username = r.username " +
	                   "WHERE r.bookid = ?";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {

	        
	        ps.setInt(1, bookid);

	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                Review review = new Review(
	                	rs.getString("username"),
	                    rs.getDate("date"),
	                    rs.getString("description_review"),
	                    rs.getInt("stars")
	                );
	                reviews.add(review);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); 
	    }

	    return reviews;
	}

}
