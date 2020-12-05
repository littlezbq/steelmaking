package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.productSteel;
import dao.connectionDao;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class getData
 */
@WebServlet("/getData")
public class getData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		引入了connctionDao这个类必须要new这个类的实例对象才可以使用其中的方法
		connectionDao cd = new connectionDao();
//		查询出来的每条记录都保存在一个实体类中，再用一个链表来保存所有的实体类以供使用
		List<productSteel> array = new ArrayList<productSteel>();
//		这个find方法是connectionDao里面定义的查询sql语句的方法，返回一个链表
		array = cd.find();
//		循环遍历链表的每个节点元素来输出元素对象中保存的数据到服务端的console
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println("steelName "+list.get(i).getSteel_name());
//			System.out.println("class_no "+list.get(i).getClass_no());
//			System.out.println("produceDate "+list.get(i).getProduce_date());
//		    System.out.println("furnaceNum "+list.get(i).getFurnace_num());
//		    System.out.println("steel_c "+list.get(i).getSteel_c());
//			System.out.println("steel_si "+list.get(i).getSteel_si());
//			System.out.println("steel_mn "+list.get(i).getSteel_mn());
//			System.out.println("steel_p "+list.get(i).getSteel_p());
//			System.out.println("steel_s "+list.get(i).getSteel_s());
//			System.out.println("steel_als "+list.get(i).getSteel_als());
//			System.out.println("steel_ti "+list.get(i).getSteel_ti());
//			System.out.println("steel_nb "+list.get(i).getSteel_nb());
//		}
		response.setContentType("text/html; charset=utf-8");
        //调用JSONArray.fromObject方法把array中的对象转化为JSON格式的数组
        JSONArray json=JSONArray.fromObject(array);
        System.out.println("i got btn event");
        
        //在服务器conlose输出json   !!!!记得注释掉 否则数据太多会卡
//      System.out.println(json);
        
        //返回给前段页面
        PrintWriter out = response.getWriter();  
        //在前端页面显示由实体类转换后的json数据
        out.println(json);  
        out.flush();  
        out.close();   
		doGet(request, response);
		
	}

}
