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
		
//		������connctionDao��������Ҫnew������ʵ������ſ���ʹ�����еķ���
		connectionDao cd = new connectionDao();
//		��ѯ������ÿ����¼��������һ��ʵ�����У�����һ���������������е�ʵ�����Թ�ʹ��
		List<productSteel> array = new ArrayList<productSteel>();
//		���find������connectionDao���涨��Ĳ�ѯsql���ķ���������һ������
		array = cd.find();
//		ѭ�����������ÿ���ڵ�Ԫ�������Ԫ�ض����б�������ݵ�����˵�console
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
        //����JSONArray.fromObject������array�еĶ���ת��ΪJSON��ʽ������
        JSONArray json=JSONArray.fromObject(array);
        System.out.println("i got btn event");
        
        //�ڷ�����conlose���json   !!!!�ǵ�ע�͵� ��������̫��Ῠ
//      System.out.println(json);
        
        //���ظ�ǰ��ҳ��
        PrintWriter out = response.getWriter();  
        //��ǰ��ҳ����ʾ��ʵ����ת�����json����
        out.println(json);  
        out.flush();  
        out.close();   
		doGet(request, response);
		
	}

}
