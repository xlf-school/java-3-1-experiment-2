package com.xlf.school.experiment2.controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xlf.school.experiment2.model.BaseResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.util.HashMap;
import java.util.logging.Logger;

/**
 * 用户登录控制器
 * <p>
 * 用于处理用户登录请求, 并返回登录结果
 *
 * @author xiao_lfeng
 * @since v1.0-SNAPSHOT
 * @since v1.1-SNAPSHOT
 */
@WebServlet("/api/v1/login")
public class UserLoginController extends HttpServlet {
    private final Logger log = Logger.getLogger(UserLoginController.class.getName());
    private final Gson gson = new Gson();

    @Override
    protected void doPost(@NotNull HttpServletRequest req, @NotNull HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json;charset=utf-8");
        String getBody = req.getReader().readLine();
        HashMap<String, String> getData = gson.fromJson(getBody, new TypeToken<>() {
        });
        System.out.println("username: " + getData.get("username") + ", password: " + getData.get("password"));
        // 模拟数据库部分数据，支持用户 xiao_lfeng 以及 debug
        if ("xiao_lfeng".equals(getData.get("username"))) {
            if ("20040227".equals(getData.get("password"))) {
                // 设置 Cookie
                resp.getWriter().print(
                        new Gson().toJson(
                                new BaseResponse()
                                        .setOutput("Success")
                                        .setCode(200)
                                        .setMessage("登录成功")
                        ));
            } else {
                resp.getWriter().print(
                        new Gson().toJson(
                                new BaseResponse()
                                        .setOutput("Fail")
                                        .setCode(400)
                                        .setMessage("密码错误")
                        ));
            }
        } else if ("debug".equals(getData.get("username"))) {
            if ("123456".equals(getData.get("password"))) {
                // 设置 Cookie
                resp.getWriter().print(
                        new Gson().toJson(
                                new BaseResponse()
                                        .setOutput("Success")
                                        .setCode(200)
                                        .setMessage("登录成功")
                        ));
            } else {
                resp.getWriter().print(
                        new Gson().toJson(
                                new BaseResponse()
                                        .setOutput("Fail")
                                        .setCode(400)
                                        .setMessage("密码错误")
                        ));
            }
        } else {
            resp.getWriter().print(
                    new Gson().toJson(
                            new BaseResponse()
                                    .setOutput("Fail")
                                    .setCode(404)
                                    .setMessage("用户不存在")
                    ));
        }
    }
}
