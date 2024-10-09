package com.xlf.school.experiment2.controller;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.util.logging.Logger;

/**
 * 用户注册控制器
 * <p>
 * 用于处理用户注册请求, 并返回注册结果
 *
 * @since v1.0-SNAPSHOT
 * @version v1.0-SNAPSHOT
 * @author xiao_lfeng
 */
@WebServlet("/api/v1/register")
public class UserRegisterController extends HttpServlet {
    private final Logger log = Logger.getLogger(UserRegisterController.class.getName());

    @Override
    protected void doPost(@NotNull HttpServletRequest req, @NotNull HttpServletResponse resp) throws IOException {
        // 接收消息体
        String getBody = req.getReader().readLine();
        log.info("RequestBody: " + getBody);
        // 输出消息体
        resp.setContentType("application/json;charset=utf-8");
        resp.getWriter().print(getBody);
    }
}
