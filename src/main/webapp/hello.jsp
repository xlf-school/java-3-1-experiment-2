<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>欢迎您</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="grid gap-3 min-h-dvh bg-gray-100">
    <div class="m-8">
        <div class="grid gap-3 bg-white rounded-lg shadow-lg p-4">
            <div>欢迎您：</div>
            <div class="font-bold text-2xl" id="dom-user">[USER]</div>
        </div>
    </div>
</div>
</body>
<script type="application/javascript">
    // 页面加载完毕后执行
    window.onload = function () {
        const user = localStorage.getItem('X-USER-TOKEN');
        console.log('user:', user);
        if (user == null || user === '') {
            alert('请先登录');
            window.location.href = 'login.jsp';
        } else {
            document.getElementById('dom-user').innerText = user;
        }
    };
</script>
</html>
