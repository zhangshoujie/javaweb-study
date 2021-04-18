package cn.edu.niit.service;

import cn.edu.niit.dao.BookDao;
import cn.edu.niit.javabean.Book;

import java.util.List;

/**
 * @ClassName BookService
 * @Description TODO
 * @Author zhangshoujie
 * @Date 2021/4/12
 **/
public class BookService {
    private BookDao bookDao = new BookDao();

    public List<Book> searchAllBooks(int pageNum, int pageSize) {

        List<Book> books = bookDao.selectAll(pageNum, pageSize);

        return books;
    }

    public int countNum() {

        return bookDao.selectAllCount();
    }
}

