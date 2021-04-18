package cn.edu.niit.javabean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName Book
 * @Description TODO
 * @Author zhangshoujie
 * @Date 2021/4/12
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Book {
    private String name;
    private String author;
    private String sort;
    private String description;
}
