<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cn.edu.niit.javabean.Book" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>查询图书</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="/layui/css/layui.css" media="all">
	<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
	<style>
		.wrap-div {
			display: -webkit-box;
			-webkit-box-orient: vertical;
			-webkit-line-clamp: 3;
			overflow: hidden;
			float: left;
			width: 100%;
			word-break: break-all;
			text-overflow: ellipsis;
		}
	</style>
</head>
<body>
<div>
	<button class="layui-btn" data-type="getCheckLength"
			style="margin-left: 20px;" id="addBooks">新增图书</button>
</div>
<div class="layui-nav-item demoTable"
	 style="display: flex;justify-content: flex-end;">
	<input type="text" class="layui-input"
		   style="padding: 0;display: inline;width: 300px;"
		   placeholder="请输入搜索信息..."/>
	<button class="layui-btn" data-type="getCheckLength" style="margin-left: 20px;">搜索</button>
</div>
<div class="layui-form" id="content">
	<table class="layui-table" style="table-layout:fixed">
		<colgroup>
			<col width="150">
			<col width="150">
			<col width="200">
			<col width="100">
			<col width="180">
		</colgroup>
		<thead>
		<tr>
			<th>书名</th>
			<th>作者</th>
			<th>分类</th>
			<th>描述</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="books" items="${sessionScope.books}" varStatus="status">
			<tr>
				<td>${books.name}</td>
				<td>${books.author}</td>
				<td>${books.sort}</td>
				<td class="wrap-td">
					<div class="wrap-div">${books.description}</div>
				</td>
				<td>
					<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
					<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" id="update">修改</a>
					<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" id="delete1">删除</a>

				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<div id="page" style="display: flex;justify-content: center;"  ></div>

<script src="/layui/layui.js" charset="UTF-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
<script>
	layui.use(['laypage', 'layer'], function () {
				var laypage = layui.laypage
						, layer = layui.layer;
				var $ = layui.$;
				var count = 0, page = 1, limit = 5;

				//添加图书绑定事件
				$(addBooks).click(function () {
					layer.open({
						type: 2,
						title:'添加图书',
						content:'addBooks.jsp',
						area:['600px','500px']
						// end: function () {
						//     table.reload(addBook);
						// }
					});

				})


				//
				$(document).ready(function () {
					//进入页面先加载数据
					getContent(1, limit);
					//得到数量count后，渲染表格

					laypage.render({
						elem: 'page',
						count: count,
						curr: page,
						limits: [5, 10, 15, 20],
						limit: limit,
						theme: '#1E9FFF',
						layout: ['count', 'prev', 'page', 'next', 'limit'],
						jump: function (obj, first) {
							if (!first) {
								getContent(obj.curr, obj.limit);
								//更新当前页码和当前每页显示条数
								page = obj.curr;
								limit = obj.limit;
							}
						}
					});
				});

				function getContent(page, size) {
					$.ajax({
						type: 'POST',
						url: "/book/search",
						async: false, //开启同步请求，为了保证先得到count再渲染表格
						data: JSON.stringify({
							pageNum: page,
							pageSize: size
						}),
						contentType: "application/json;charset=UTF-8",
						success: function (data) {
							$('#content').load(location.href + " #content");
							//count从Servlet中得到
							count = data;
						}
					});
				}
			}
	);
</script>

</body>
</html>