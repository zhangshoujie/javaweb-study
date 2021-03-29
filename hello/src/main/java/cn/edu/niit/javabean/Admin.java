package cn.edu.niit.javabean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName Admin
 * @Description TODO
 * @Author zhangshoujie
 * @Date 2021/3/29
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Admin {
    private String username;
    private String password;
}
