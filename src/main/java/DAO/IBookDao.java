package DAO;

import java.util.List;

import Models.Book;
import Models.Review;

public interface IBookDao {

	List<Book> listBook();
	Book findById(int id);
	List<Review> findByBookId(int id);
	List<Book> searchBook(String searchname);
	List<Book> searchBookByCategory(String catename);
	List<Book> Pagination(int offset, int limit);
	int countBooks();
}
