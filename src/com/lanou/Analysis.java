package com.lanou;

import net.sf.json.JSONArray;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by dllo on 17/9/27.
 */
public class Analysis {

    public static void main(String[] args) {

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

            Analysis analysis = new Analysis();

            analysis.forCitysJSON(proList);


        } catch (DocumentException e) {

            e.printStackTrace();

        }

    }

    private void forCitys(List<City> proList){

        for (City city : proList) {

            System.out.println("地区:" + city.getProvince());

            List<String> list = city.getCity();

            for (String string : list) {

                System.out.println("区:" + string);

            }

            System.out.println("-----------------------");

        }

    }

    private void forCitysJSON(List<City> proList){

        JSONArray jsonArray = JSONArray.fromObject(proList);

        System.out.println(jsonArray);

    }


}
