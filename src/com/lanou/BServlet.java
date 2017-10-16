package com.lanou;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by dllo on 17/9/27.
 */
@WebServlet("/BServlet")
public class BServlet extends HttpServlet {

//    jar呢
//    还有为什么巧克力, 香子兰 之后就变成威尔士新王了

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        Person per1 = new Person("巧克力",16,"英短猫");

        Person per2 = new Person("香兰子",15,"布偶猫");

        Person per3 = new Person("威尔士",20,"战列舰");

        List<Person> personList = new ArrayList<>();

        personList.add(per1);
        personList.add(per2);
        personList.add(per3);

        JSONArray jsonArray = JSONArray.fromObject(personList);

        System.out.println(jsonArray.toString());

        response.getWriter().print(jsonArray.toString());

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");

        Person per = new Person("小白",6,"猫");

        JSONObject jsonObject = JSONObject.fromObject(per);

        System.out.println(jsonObject.toString());

        response.getWriter().print(jsonObject.toString());

    }
}