package com.lanou;

import net.sf.json.JSONArray;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by dllo on 17/9/27.
 */
@WebServlet("/LinkServlet")
public class LinkServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        List<City> list = cityList();

        JSONArray jsonArray = JSONArray.fromObject(list);

        System.out.println(jsonArray.toString());

        response.getWriter().print(jsonArray.toString());

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");

    }

    private List<City> cityList(){

        String path = "/Users/dllo/Desktop/china.xml";

        SAXReader reader = new SAXReader();

        File file = new File(path);

        try {

            Document document = reader.read(file);

            Element rootElement = document.getRootElement();

            List<Element> elements = rootElement.elements();

            List<City> proList = new ArrayList<>();

            for (Element element : elements) {

                City procity = new City();

                procity.setProvince(element.attributeValue("name"));

                List<String> citys = new ArrayList<>();

                List<Element> city = element.elements();

                for (Element pCity : city) {

                    String pCityText = pCity.getText();

                    citys.add(pCityText);

                }

                procity.setCity(citys);

                proList.add(procity);

            }

            return proList;

        } catch (DocumentException e) {

            e.printStackTrace();

        }

        return null;

    }
}