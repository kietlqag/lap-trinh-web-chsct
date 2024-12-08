package Services;

import java.io.Serializable;
import java.util.List;

import Models.Book;
import Models.Review;

public interface IBookService extends Serializable{

	List<Book> listBook();
	Book findById(int id);
	List<Review> listReviewByBookid(int id);
	List<Book> searchBook(String searchname);
	List<Book> searchBookByCategory(String catename);
	List<Book> Pagination(int offset, int limit);
	int countBooks();
}
