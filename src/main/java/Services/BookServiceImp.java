package Services;

import java.util.List;
import DAO.BookDaoImp;
import DAO.IBookDao;
import Models.Book;
import Models.Review;

@SuppressWarnings("serial")
public class BookServiceImp implements IBookService{

	IBookDao bookDao = new BookDaoImp();
	
	@Override
	public List<Book> listBook() {
		return bookDao.listBook();
	}

	@Override
	public Book findById(int id) {
		return bookDao.findById(id);
    }

	@Override
	public List<Review> listReviewByBookid(int id) {
		return bookDao.findByBookId(id);
	}

	@Override
	public List<Book> searchBook(String searchname) {
		return bookDao.searchBook(searchname);
	}

	@Override
	public List<Book> searchBookByCategory(String catename) {
		return bookDao.searchBookByCategory(catename);
	}

	@Override
	public List<Book> Pagination(int offset, int limit) {
		return bookDao.Pagination(offset, limit);
	}

	@Override
	public int countBooks() {
		return bookDao.countBooks();
	}
}
