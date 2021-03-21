<%@ page import="java.sql.Connection" %>
<%@ page import="com.mysql.cj.jdbc.Driver" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    //1.加载驱动
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    //2.获得连接实例
    try(Connection connection =
                DriverManager.getConnection("jdbc:mysql://localhost:3306/library?serverTimezone=UTC&characterEncoding=utf8", "root", "root");
    ) {
        //3.预编译sql语句
        String sql = "select * from borrow_card where username=?";
        try(PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1,username);
            //4.执行查询
            try(ResultSet resultSet = statement.executeQuery()) {
                //5.遍历ResultSet
                while (resultSet.next()) {
                    if(password.equals(resultSet.getString("password"))){
                        //执行跳转
                        response.sendRedirect("./main.jsp");
                    }else{
                        //返回首页
                        response.sendRedirect("./index.jsp");
                    }
                }
            }
        }

    }catch (Exception e){

    }
%>
</body>
</html>
