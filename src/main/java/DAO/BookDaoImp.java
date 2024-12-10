package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

	@Override
	public List<Book> searchBook(String searchname) {
		List<Book> books = new ArrayList<>();
        String query = "SELECT * FROM book WHERE title LIKE ? OR author LIKE ?";
        try (PreparedStatement statement = DBConnect.getConnection().prepareStatement(query)) {
            statement.setString(1, "%" + searchname + "%");
            statement.setString(2, "%" + searchname + "%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Book book = new Book(
                    resultSet.getInt("id"),
                    resultSet.getString("title"),
                    resultSet.getString("author"),
                    resultSet.getString("image_url"),
                    resultSet.getInt("discount_percentage"),
                    resultSet.getInt("rating"),
                    resultSet.getInt("stock"),
                    resultSet.getString("category"),
                    resultSet.getDouble("price"),
                    resultSet.getString("long_description")
                );
                books.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return books;
	}

	@Override
	public List<Book> searchBookByCategory(String catename) {
		List<Book> books = new ArrayList<>();
        String query = "SELECT * FROM book WHERE category = ?";
        try (PreparedStatement statement = DBConnect.getConnection().prepareStatement(query)) {
            statement.setString(1, catename);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Book book = new Book(
                    resultSet.getInt("id"),
                    resultSet.getString("title"),
                    resultSet.getString("author"),
                    resultSet.getString("image_url"),
                    resultSet.getInt("discount_percentage"),
                    resultSet.getInt("rating"),
                    resultSet.getInt("stock"),
                    resultSet.getString("category"),
                    resultSet.getDouble("price"),
                    resultSet.getString("long_description")
                );
                books.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return books;
	}

	@Override
	public List<Book> Pagination(int offset, int limit) {
		List<Book> books = new ArrayList<>();
        String query = "SELECT * FROM book LIMIT ? OFFSET ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, limit); 
            stmt.setInt(2, offset);

            ResultSet rs = stmt.executeQuery();
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
	
    public int countBooks() {
    	String query = "SELECT COUNT(*) FROM book";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1); 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

}
