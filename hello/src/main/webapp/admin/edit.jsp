<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>编辑</title>
</head>
<body>
    <form class="layui-form layhui-form-pane" action="" lay-filter="formFilter">
        <input type="text" name="id" value=27 lay-verify="required" required autocomplete="off" placeholder="请输入姓名" class="layui-input layui-hide">
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block">
                <input type="text" name="title" value=edwe lay-verify="required" required autocomplete="off" placeholder="请输入标题" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">通知</label>
            <div class="layui-input-block">
                <input type="text" name="detail" value=weiguixinxi lay-verify="required" required autocomplete="off" placeholder="请输入通知" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-verify="required" layui-submit="" lay-filter="submitButton">立即提交</button>
            </div>
        </div>
    </form>
<script>
    layui.use(['form',jquery], function (data) {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer
        form.on('submit(submitButton)',function (data) {
            $.ajax({
                url:'./announcementEdit',
                method:'post',
                data:data.field,
                dataType:'json',
                success:function (data) {
                    if (data.code == "0") {
                        parent.layer.msg("添加成功",{
                            icon:6,
                            time:500
                        });
                        setTimeout(function () {
                            parent.location.reload();
                        },1000);
                    }else {
                        layer.msg(data.msg);
                    }
                }
            })
            return false;
        });

    });
</script>
</body>
</html>