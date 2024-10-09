<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>学生信息管理系统注册</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<section class="bg-white">
    <div class="lg:grid lg:min-h-screen lg:grid-cols-12">
        <aside class="relative block h-16 lg:order-last lg:col-span-5 lg:h-full xl:col-span-6">
            <img
                    alt=""
                    src="https://images.unsplash.com/photo-1605106702734-205df224ecce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
                    class="absolute inset-0 h-full w-full object-cover"
            />
        </aside>

        <main
                class="flex items-center justify-center px-8 py-8 sm:px-12 lg:col-span-7 lg:px-16 lg:py-12 xl:col-span-6"
        >
            <div class="max-w-xl lg:max-w-3xl">
                <h1 class="mt-6 text-2xl font-bold text-gray-900 sm:text-3xl md:text-4xl">
                    学生信息管理系统 🦑
                </h1>

                <p class="mt-4 leading-relaxed text-gray-500">
                    筱锋的 Java 课程作业，学生信息管理系统，2024-10-09 实验作业 22344233。
                </p>

                <form action="#" class="mt-8 grid grid-cols-6 gap-6">
                    <div class="col-span-6 sm:col-span-3">
                        <label for="username" class="block text-sm font-medium text-gray-700">
                            用户名
                        </label>
                        <input
                                type="text"
                                id="username"
                                name="username"
                                class="p-2 border w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                        />
                    </div>
                    <div class="col-span-6 sm:col-span-3">
                        <label for="realname" class="block text-sm font-medium text-gray-700">
                            真实姓名
                        </label>

                        <input
                                type="text"
                                id="realname"
                                name="realname"
                                class="p-2 border w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                        />
                    </div>
                    <div class="col-span-6">
                        <label for="email" class="block text-sm font-medium text-gray-700">
                            邮箱
                        </label>
                        <input
                                type="email"
                                id="email"
                                name="email"
                                class="p-2 border w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                        />
                    </div>

                    <div class="col-span-6 sm:col-span-3">
                        <label for="password" class="block text-sm font-medium text-gray-700">
                            密码
                        </label>
                        <input
                                type="password"
                                id="password"
                                name="password"
                                class="p-2 border w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                        />
                    </div>

                    <div class="col-span-6 sm:col-span-3">
                        <label for="password_confirm" class="block text-sm font-medium text-gray-700">
                            确认密码
                        </label>
                        <input
                                type="password"
                                id="password_confirm"
                                name="password_confirm"
                                class="p-2 border w-full rounded-md border-gray-200 bg-white text-sm text-gray-700 shadow-sm"
                        />
                    </div>
                    <div class="col-span-6 sm:flex sm:items-center sm:gap-4">
                        <button
                                class="inline-block shrink-0 rounded-md border border-blue-600 bg-blue-600 px-12 py-3 text-sm font-medium text-white transition hover:bg-transparent hover:text-blue-600 focus:outline-none focus:ring active:text-blue-500"
                        >
                            创建账户
                        </button>

                        <p class="mt-4 text-sm text-gray-500 sm:mt-0">
                            已有账户?
                            <a href="login.jsp" class="text-gray-700 underline">登录</a>.
                        </p>
                    </div>
                </form>
            </div>
        </main>
    </div>
</section>
</body>
<script type="application/javascript">
    document.querySelector('form').addEventListener('submit', function (event) {
        event.preventDefault();
        const username = document.getElementById('username').value;
        const realname = document.getElementById('realname').value;
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        const password_confirm = document.getElementById('password_confirm').value;
        if (username == null || username === '') {
            alert('用户名不能为空');
            return;
        }
        if (realname == null || realname === '') {
            alert('真实姓名不能为空');
            return;
        }
        if (email == null || email === '') {
            alert('邮箱不能为空');
            return;
        }
        if (password == null || password === '') {
            alert('密码不能为空');
            return;
        }
        if (password_confirm == null || password_confirm === '') {
            alert('确认密码不能为空');
            return;
        }
        if (password !== password_confirm) {
            alert('两次密码输入不一致');
            return;
        }
        // 发送数据
        fetch('api/v1/register', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                username: username,
                realname: realname,
                email: email,
                password: password
            })
        }).then(response => {
            return response.json();
        }).then(data => {
            alert('注册成功');
        }).catch(error => {
            alert('注册失败');
        });
    });
</script>
</html>
