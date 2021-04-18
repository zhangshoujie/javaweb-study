package cn.edu.niit.dao;

import cn.edu.niit.db.JDBCUtil;
import cn.edu.niit.javabean.Book;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName BookDao
 * @Description TODO
 * @Author zhangshoujie
 * @Date 2021/4/12
 **/
public class BookDao {
    public List<Book> selectAll(int pageNum, int pageSize) {
        String sql = "select books.*, book_sort.name as sort from " +
                "books, " +
                "book_sort where books.sort_id=book_sort.id limit " +
                "?,?";
        List<Book> books = new ArrayList<>();
        try (ResultSet rs = JDBCUtil.getInstance().executeQueryRS(sql,
                new Object[]{(pageNum - 1) * pageSize, pageSize})) {
            while (rs.next()) {
                Book book = new Book(rs.getString("name"),
                        rs.getString("author"),
                        rs.getString("sort"),
                        rs.getString("description"));
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    public int selectAllCount() {
        String sql = "select count(*) as num from books";
        try (final ResultSet rs =
                     JDBCUtil.getInstance().executeQueryRS(sql,
                             new Object[]{})) {
            while (rs.next()) {
                return rs.getInt("num");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        return 0;
    }
}
