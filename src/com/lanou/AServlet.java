package com.lanou;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by dllo on 17/9/27.
 */
@WebServlet("/AServlet")
public class AServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        System.out.println("接收到 ajax 的请求! post!");

        response.getWriter().print(request.getParameter("username") +"决定放弃这个游戏");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");

        System.out.println("接收到 ajax 的请求! get!");

        // 向客户端响应数据

        response.getWriter().print("{\"name\":\"小黑\",\"message\":\"放弃Dota\"}");

    }
}