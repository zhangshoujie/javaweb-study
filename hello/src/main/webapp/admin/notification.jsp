<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>通知中心</title>
</head>
<body>
    <table class="layui-hide" id="annTable" lay-filter="formFilter"></table></table>
    <script type="text/html" id="headBar">
        <button class="layui-btn layui-btn-sm" lay-event=""add><i class="layui-icon layui-icon-release" style="font-size:20px;color:yellow;">&nbsp;发布新通知 </i></button>
    </script>
    <script type="text/html" id="rightBar">
        <a class="layui-btn lay-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <script>
        layui.use(['table','jquery'],function () {
            $ = layui.jquery;
            var table = layui.table;
            var tableIns = table.render({
                elem: '#annTable',
                url:'./announcement',
                toolbar:'#headBar',
                height:600,
                cols:[[
                    {field:'id',width:80,title:'ID',sort:true},
                    {field:'title',width: 230,title:'标题'},
                    {field: 'detail',width: 580,title: '通知'},
                    {field: 'publish_date',title: '发布日期',minWith:100,sort:true},
                    {fixed:'right',title: '操作',toolbar:'#rightBar',align:'center',width: 150}
                ]]
            });
            table.on(('tool(formFilter)'),function () {
                var checkStatus = table.checkStatus(obj.config.id);
                switch (obj.event) {
                    case'add':
                        var addCardLayer = layer.open({
                            type:2,
                            title:'发布通知',
                            area:['800px','500px'],
                            maxmin:true,
                            shadeClose:true,
                            content:'08ad.jsp',
                        });

                };
            });
            table.on(('tool(formFilter)'),function () {
                var data = obj.date();
                var layEvent = obj.event;
                var id = data.id;
                var tr = obj.tr;
                switch (obj.event) {
                    case 'edit':
                        layer.open({
                            type:2,
                            title:'更改信息',
                            area:['800px','600px'],
                            maxmin:true,
                            shadeClose:true,
                            content:'08edit.jsp?id=' + id,
                        })
                      break;
                    case 'del':
                        layer.confirm('确定要删除么?',function () {
                        $.ajax({
                            url:'./announcementDel',
                            data:'id=' + id,
                            type: 'get',
                            dataType:'json',
                            timeout:3000,
                            success:function (data) {
                                if(data.code == 0){
                                    layer.msg(data.msg,{
                                        icon:6,
                                        cnim:5,
                                        time:500
                                    });
                                    setTimeout(function () {
                                        parent.location.reload();
                                    },1000);
                                }else {
                                    layer.msg(data.code);
                                }
                            },
                            error:function (){
                                layer.msg("连接超时");
                            }
                        })
                        })
                }

            });

        });
    </script>
</body>
</html>