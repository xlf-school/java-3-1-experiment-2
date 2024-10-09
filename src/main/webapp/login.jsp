<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="mx-auto max-w-screen-xl px-4 py-16 sm:px-6 lg:px-8">
    <div class="mx-auto max-w-lg text-center">
        <h1 class="text-2xl font-bold sm:text-3xl">筱锋的登录</h1>

        <p class="mt-4 text-gray-500">
            Java 实验作业登录界面
        </p>
    </div>

    <form action="#" class="mx-auto mb-0 mt-8 max-w-md space-y-4">
        <div>
            <label for="username" class="sr-only relative">
                <input
                        id="username"
                        type="text"
                        class="w-full rounded-lg border border-gray-200 p-4 pe-12 text-sm shadow-sm"
                        placeholder="输入用户名"
                />
            </label>
        </div>
        <div>
            <label for="password" class="sr-only relative">
                <input
                        id="password"
                        type="password"
                        class="w-full rounded-lg border border-gray-200 p-4 pe-12 text-sm shadow-sm"
                        placeholder="输入密码"
                />
            </label>
        </div>

        <div class="flex items-center justify-between">
            <button type="submit"
                    class="inline-block rounded-lg bg-blue-500 px-5 py-3 text-sm font-medium text-white"
            >
                登录
            </button>
        </div>
    </form>
</div>
</body>
<script type="application/javascript">
    document.querySelector('form').addEventListener('submit', function (event) {
        event.preventDefault();
        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;
        if (username == null || username === '') {
            alert('用户名不能为空');
            return;
        }
        if (password == null || password === '') {
            alert('密码不能为空');
            return;
        }
        // 发送数据
        fetch('api/v1/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                username: username,
                password: password
            })
        }).then(response => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error('登录失败');
            }
        }).then(data => {
            console.log('data:', data);
            if (data.output === "Success") {
                localStorage.setItem('X-USER-TOKEN', username);
                alert('登录成功');
                window.location.href = 'hello.jsp';
            } else {
                alert(data.message);
            }
        }).catch(error => {
            console.error('error:', error);
            alert('登录失败');
        });
    });
</script>
</html>
