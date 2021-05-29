package cn.edu.niit.javabean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName Message
 * @Description TODO
 * @Author zhangshoujie
 * @Date 2021/5/29
 **/
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Message {
    private String id;
    private  String detail;
    private String cardId;
    private  String publicDate;

}

