package controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.core.JsonParser;
import com.mysql.cj.xdevapi.JsonArray;

import daoMappersImpl.ProductParameterMapperImpl;
import model.ProductParameter;
import net.sf.json.JSONArray;

@Controller

public class excipient {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8") 
	
//	������������ҳ��
	@RequestMapping("/manageProducePara")
	public String manageProducePara() {
		
		return "/productParameter/manageProducePara";
	}
	
//	��ת�����ҳ��
	@RequestMapping("/addProduceParaPage")
	public String addProduceParaPage() {
		
		return "/productParameter/addProduceParaPage";
	}
	
	
	@RequestMapping("/showmaterial")
	public String showmaterial() {
		
		return "material";
	}
	
	@RequestMapping("/manageSteelPara")
	public String manageSteelPara() {
		return "/standardSteel/manageSteelPara";
	}

	@RequestMapping("/addSteelParaPage")
	public String addSteelParaPage() {
		return "/standardSteel/addSteelParaPage";
	}
	
	@RequestMapping("/test2")
	public String test2() {
		return "/standardSteel/test2";
	}
	
	//����������ݲ���
	@RequestMapping(value="/addProducePara", method=RequestMethod.POST)
	@ResponseBody
	public String addProducePara(ProductParameter product){
		System.out.println(product.toString());
//		System.out.println(product.getProduceDate());
		int result = -1;
		
		Date produceDate = product.getProduceDate();
		String furnaceNum = product.getFurnaceNum();
		
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		if (productImpl.selectByPrimaryKey(produceDate, furnaceNum) == null) {
			result = productImpl.insertSingleRecord(product);
			return " success";
		}
		return "failed";
		
//		System.out.println(product.toString());
		
	}
	
	
//	��ѯ���и�������
	@RequestMapping("/searchAllSteelName")
	@ResponseBody
	public List<String> searchAllSteelName(){
		List<String> steelName_list = null;
		
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		steelName_list = productImpl.selectAllSteelName();
		
		return steelName_list;
	}
	
//	�����ֲ�ѯ
	@RequestMapping("/searchProduceParaBySteelName")
	public ModelAndView searchProduceParaBySteelName(HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView modelAndView = new ModelAndView();
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		
//		�½���ҳ�����
		pageInfo page = pageInfo.getPageInfo();
		request.setCharacterEncoding("UTF-8");
		String steelName = request.getParameter("selectAllSteelName");
		
//		��steelName����session��
		HttpSession session = request.getSession();
		if (steelName != null) {
			session.setAttribute("steelName",steelName);
			
//			���ܼ�¼������pageInfo��
			page.setTotalRecord(productImpl.getTotalRecordBySteelName(steelName));
//			System.out.println(page.getTotalRecord());
			
			session.setAttribute("totalRecord", page.getTotalRecord());
		}
		else {
			steelName = session.getAttribute("steelName").toString();
		}
		
		List<ProductParameter> product_list = null;
		
		int totalRecord = Integer.parseInt(session.getAttribute("totalRecord").toString());
		
//		��ȡ��ǰҳ��
		page.setCurrentPage(Integer.parseInt(request.getParameter("pageNum")));
		
//		��ȡÿһҳ����ʼ����
		int begin = (page.getCurrentPage() - 1) * page.getMaxRecord();
		
//		��ȡ��һҳ����һҳ,����Ҫ����У��
//		�����ǰҳ���Ѿ�Ϊ��ҳ�ˣ�����ô����һҳ������ҳ�����򷵻���һҳ
		if (page.getCurrentPage() > 1) {
			page.setPrePage(page.getCurrentPage() - 1);
		}
		else {
			page.setPrePage(page.getCurrentPage());
		}
		
//		��ȡβҳ
		if (totalRecord % page.getMaxRecord() == 0) {
			page.setFinalPage(totalRecord / page.getMaxRecord());
		}
		else {
			page.setFinalPage(totalRecord / page.getMaxRecord() + 1);
		}
		
//		�����ǰҳ���Ѿ���βҳ�ˣ�����ô�㶼��βҳ�����򷵻���һҳ
		if (page.getCurrentPage() < page.getFinalPage()) {
			page.setNextPage(page.getCurrentPage() + 1);
		}
		else {
			page.setNextPage(page.getCurrentPage());
		}
		
		product_list = productImpl.selectBySteelName(steelName,begin,page.getMaxRecord());
		
		modelAndView.addObject("firstlist", product_list);
		modelAndView.addObject("firstlist", product_list);
		modelAndView.addObject("prePage", page.getPrePage());
		modelAndView.addObject("nextPage", page.getNextPage());
		modelAndView.addObject("finalPage", page.getFinalPage());
		modelAndView.addObject("sum", totalRecord);
		modelAndView.addObject("pageNum", page.getCurrentPage());
		
//		����ҳ��ʱ��������һ�������������Ĳ���
		modelAndView.addObject("selectType","searchProduceParaBySteelName");
		
		modelAndView.setViewName("/productParameter/searchresult");
		return modelAndView;
	}
	
	
	//���������ڲ�ѯ�������ݼ�¼����-ModelAndView
	@RequestMapping("/searchProduceParaByTime")
	public ModelAndView searchProduceParaByTime(HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView modelAndView = new ModelAndView();
//		�½���ҳ�����
		pageInfo page = pageInfo.getPageInfo();
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		request.setCharacterEncoding("UTF-8");
		
		String producedate1 = request.getParameter("produceDate1");
		String producedate2 = request.getParameter("produceDate2");
		Date produceDate1 = null;
		Date produceDate2 = null;
//		�����β�ѯ���������ڲ�������Session��
		HttpSession session = request.getSession();
		if (producedate1 != null && producedate2 != null) {
			session.setAttribute("produceDate1", producedate1);
			session.setAttribute("produceDate2", producedate2);
			
			produceDate1 = dateToTime.StringToDate(producedate1);
			produceDate2 = dateToTime.StringToDate(producedate2);
			
//			���ܼ�¼������pageInfo��
			page.setTotalRecord(productImpl.getTotalRecord(produceDate1, produceDate2));
//			System.out.println(page.getTotalRecord());
			
			session.setAttribute("totalRecord", page.getTotalRecord());
		}
		else {
			producedate1 = session.getAttribute("produceDate1").toString();
			producedate2 = session.getAttribute("produceDate2").toString();
			
			produceDate1 = dateToTime.StringToDate(producedate1);
			produceDate2 = dateToTime.StringToDate(producedate2);
		}
		
		List<ProductParameter> product_list = null;
		int totalRecord = Integer.parseInt(session.getAttribute("totalRecord").toString());
		
//		��ȡ��ǰҳ��
		page.setCurrentPage(Integer.parseInt(request.getParameter("pageNum")));
		
//		��ȡÿһҳ����ʼ����
		int begin = (page.getCurrentPage() - 1) * page.getMaxRecord();
		
//		��ȡ��һҳ����һҳ,����Ҫ����У��
//		�����ǰҳ���Ѿ�Ϊ��ҳ�ˣ�����ô����һҳ������ҳ�����򷵻���һҳ
		if (page.getCurrentPage() > 1) {
			page.setPrePage(page.getCurrentPage() - 1);
		}
		else {
			page.setPrePage(page.getCurrentPage());
		}
		
//		��ȡβҳ
		if (totalRecord % page.getMaxRecord() == 0) {
			page.setFinalPage(totalRecord / page.getMaxRecord());
		}
		else {
			page.setFinalPage(totalRecord / page.getMaxRecord() + 1);
		}
		
//		�����ǰҳ���Ѿ���βҳ�ˣ�����ô�㶼��βҳ�����򷵻���һҳ
		if (page.getCurrentPage() < page.getFinalPage()) {
			page.setNextPage(page.getCurrentPage() + 1);
		}
		else {
			page.setNextPage(page.getCurrentPage());
		}
		

		
		product_list = productImpl.selectByTime(produceDate1, produceDate2,begin,page.getMaxRecord());
		
		modelAndView.addObject("firstlist", product_list);
		modelAndView.addObject("prePage", page.getPrePage());
		modelAndView.addObject("nextPage", page.getNextPage());
		modelAndView.addObject("finalPage", page.getFinalPage());
		modelAndView.addObject("sum", totalRecord);
		modelAndView.addObject("pageNum", page.getCurrentPage());

//		����ҳ��ʱ��������һ�������������Ĳ���
		modelAndView.addObject("selectType","searchProduceParaByTime");
		
		System.out.println();
		
		modelAndView.setViewName("/productParameter/searchresult");
		return modelAndView;
	}
	
	
	  @RequestMapping("/searchresult") 
	  public String searchresult() { 
		  return "/productParameter/searchresult"; 
	  }
	 
		
	//ɾ�����ݲ���
	@RequestMapping(value="/deleteProduceParaPage/{produceDate}&{furnaceNum}",method=RequestMethod.GET)
	public String deleteProduceParaPage(@PathVariable("produceDate")String producedate,@PathVariable("furnaceNum")String furnaceNum, HttpServletResponse response) throws IOException {
		int result = -1;
		Date produceDate = dateToTime.dateToTime2(producedate);
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		result = productImpl.deleteByPrimaryKey(produceDate, furnaceNum);
		
		System.out.println(producedate);
		System.out.println(furnaceNum);
		
		if (result > 0) {
			return "redirect:/manageProducePara";
//			response.sendRedirect("/steelmakingSYS/searchResult");
			
		}
		else {
			System.out.print("error");
		}
		return null;
	}
	
	
	
//��ת������ҳ��
	@RequestMapping(value="/updateProduceParaPage/{produceDate}&{furnaceNum}",method=RequestMethod.GET)
	public ModelAndView updateProduceParaPage(@PathVariable("produceDate")String produceDate, @PathVariable("furnaceNum")String furnaceNum ) {
//			 System.out.println(produceDate);
//			 System.out.println(furnaceNum);
	     ProductParameter product = null;
		 Date produceDate2=dateToTime.dateToTime2(produceDate);
//			 System.out.println(produceDate2);
		 ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();	
		 ProductParameter productParameter = productImpl.selectByPrimaryKey(produceDate2, furnaceNum);
//			 System.out.println(productParameter);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("old_productPara", productParameter);
		modelAndView.setViewName("/productParameter/updateProduceParaPage");
		return modelAndView;
	}
	
	
	//�������ݲ���
	@RequestMapping("/updateProducePara")
	public String updateProducePara(ProductParameter product) {
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		productImpl.updateSingleRecord(product);
		System.out.println(product.toString());
		return "/productParameter/manageProducePara";
	}
	
	//��ʾ����ͳ�Ʋ���
	@RequestMapping("/showstatistics")
	public String showstatistics() {
		return "/productParameter/statistics";
	}
	
	
//	��ת��Ԥ��ģ��
	@RequestMapping("/predictSteel")
	public String predictSteel() {
		return "/productParameter/predictSteel";
	}
	
//	��ȡѵ���õ�ģ��
	@RequestMapping(value="/getModel", method=RequestMethod.POST)
	@ResponseBody
	public List<String> getmodel(@RequestParam(value="steelType")String steelType,@RequestParam(value="stoveNum")String stoveNum) throws IOException {
		String path="F:/python/fePredict/model_data/" + steelType + '_' +stoveNum + '#' ;
		String folder="F:/python/fePredict/model_data/" + steelType + '_' +stoveNum + '#'+steelType + '_' +stoveNum+'#';
		File dir=new File(path);
		File file[]=dir.listFiles();//��file�����slistFiles()��������ָ��Ŀ¼�µ��ļ�	
		List<String> modelList=new ArrayList<String>();
		for(int i=0;i<file.length;i++)
		{
	    	if(file[i].isFile() && file[i].toString().substring(file[i].toString().length()-4,file[i].toString().length()).compareTo("json")!=0){
	    		String model=new String(file[i].toString().substring(folder.length()+1,file[i].toString().length()-4));
				/* out.print("<br>"+model); */
	           	/* Map<Integer,String> modelList=new HashMap<Integer,String>();
	            modelList.put(i,model);*/
	           
	            modelList.add(model);
				/* System.out.println(modelList.toString()); */      
	    	}
		}
//	    request.setAttribute("modelList",modelList);
		return modelList;
	}
	
	
//	Ԥ��ģ��
	  @RequestMapping("/train")
	    public String train(HttpServletRequest request, Model model) throws Exception {
	        String[] input_train;
	        String[] output_train;
	        input_train = request.getParameterValues("input_train");
	        output_train = request.getParameterValues("output_train");

	        Set<String> set_input = new HashSet<>(Arrays.asList(input_train));
	        Set<String> set_output = new HashSet<>(Arrays.asList(output_train));
	        String input_columns =  String.join(",", set_input);
	        String output_columns =  String.join(",", set_output);

	        String steelType_train = (String) request.getParameter("steelType_train");
	        String stoveNum_train = (String) request.getParameter("stoveNum_train");
	        String[] cmds = new String[] {"D:/Anacoda3/envs/tensorflow-gpu/python.exe", "F:/python/fePredict/train.py", "-t", steelType_train, "-n", stoveNum_train, input_columns, output_columns};
	        String str = getOutput(cmds);
	        model.addAttribute("text", str);
	        return "/productParameter/predictSteel";
	    }

	    @RequestMapping("/test")
	    public String test(HttpServletRequest request, Model model) throws Exception {
	        String[] cmds;
	        String[] input_textedit;
	        String[] input_test;
	        List list = new ArrayList();
	        input_test = request.getParameterValues("input_test");
	        String flag = request.getParameter("test_flag");
	        input_textedit = request.getParameterValues("textedit_test");
	        System.out.println(input_textedit);
	        for(int i=0; i < input_textedit.length;i++){
	            if(input_textedit[i] != null){
	                list.add(input_textedit[i]);
	            }
	        }
	        String textedit_str = listToString(list);
//	        System.out.println(textedit_str);
	        String steelType_test = request.getParameter("steelType_test");
	        String stoveNum_test = request.getParameter("stoveNum_test");
	        String modelSelect_test = request.getParameter("modelSelect_test");
	        Set<String> set_input = new HashSet<>(Arrays.asList(input_test));
	        String input_columns =  String.join(",", set_input);
	        System.out.println(modelSelect_test);
	        if(flag!=null){
	            cmds = new String[] {"D:/Anacoda3/envs/tensorflow-gpu/python.exe", "F:/python/fePredict/test.py", "-t", steelType_test, "-n", stoveNum_test, modelSelect_test, input_columns, textedit_str};
	        
	        }
	        else{
	            cmds = new String[] {"D:/Anacoda3/envs/tensorflow-gpu/python.exe", "F:/python/fePredict/test.py", "-t", steelType_test, "-n", stoveNum_test, modelSelect_test};
	        }
	        String str = getOutput(cmds);
	        model.addAttribute("text", str);
	        return "/productParameter/predictSteel";
	    }

	    @RequestMapping("/regression")
	    public String regression(HttpServletRequest request, Model model) throws Exception {
	        String[] cmds;
	        String[] input_textedit;
	        List list = new ArrayList();
	        String[] input_train;
	        input_textedit = request.getParameterValues("textedit_regression");
	        for(int i=0; i < input_textedit.length;i++){
	            if(input_textedit[i] != null){
	                list.add(input_textedit[i]);
	            }
	        }
	        String textedit_str = listToString(list);
	        System.out.println(textedit_str);
	        input_train = request.getParameterValues("input_regression");
	        Set<String> set_input = new HashSet<>(Arrays.asList(input_train));
	        String input_columns =  String.join(",", set_input);
	        String steelType_regression = request.getParameter("steelType_regression");
	        String stoveNum_regression = request.getParameter("stoveNum_regression");
	        String flag = request.getParameter("regression_flag");
	        String outputSelect_regression = request.getParameter("outputSelect_regression");
	        if(flag!=null){
	            cmds = new String[] {"D:/Anacoda3/envs/tensorflow-gpu/python.exe", "F:/python/fePredict/regression.py", "-t", steelType_regression, "-n", stoveNum_regression, input_columns, outputSelect_regression, textedit_str};
	        }
	        else{
	            cmds = new String[] {"D:/Anacoda3/envs/tensorflow-gpu/python.exe", "F:/python/fePredict/regression.py", "-t", steelType_regression, "-n", stoveNum_regression, input_columns, outputSelect_regression};
	        }
	        String str = getOutput(cmds);
	        model.addAttribute("text", str);
	        return "/productParameter/predictSteel";
	    }

	    @RequestMapping("/clean")
	    public String clean(HttpServletRequest request, Model model) throws Exception {
	        String steelType_clean = request.getParameter("steelType_clean");
	        String stoveNum_clean = request.getParameter("stoveNum_clean");
	        String flag_file = request.getParameter("clean_table");
	        String flag_txt = request.getParameter("clean_txt");
	        String flag_module = request.getParameter("clean_module");

	        String moduleSelect_clean = request.getParameter("moduleSelect_clean");
	        String[] cmds = new String[] {"D:/Anacoda3/envs/tensorflow-gpu/python.exe", "F:/python/fePredict/clean.py", "-t", steelType_clean, "-n", stoveNum_clean, moduleSelect_clean};
	        String str = getOutput(cmds);
	        model.addAttribute("text", str);
	        return "/productParameter/predictSteel";
	    }

	    public static String convertArrayToString(String[] strArr) {
	        if (strArr == null || strArr.length == 0) {
	            return "";
	        }
	        String res = "";
	        for (int i = 0, len = strArr.length; i < len; i++) {
	            res += strArr[i];
	            if (i < len - 1) {
	                res += ",";
	            }
	        }
	        return res;
	    }

	    public static String getOutput(String[] cmds) throws Exception
	    {
	        Process pcs = Runtime.getRuntime().exec(cmds);
	        // ����Python�ű��ķ���ֵ
	        String result = null;
	        // ��ȡCMD�ķ�����
	        BufferedInputStream in = new BufferedInputStream(pcs.getInputStream());
	        // �ַ���ת���ֽ���
	        BufferedReader br = new BufferedReader(new InputStreamReader(in, "GBK"));
	        // ����Ҳ��������ı���־

	        String lineStr = null;
	        String result1="";
	        while ((lineStr = br.readLine()) != null) {
	            result = lineStr;
	            result1=result1.concat(result);
	        }
	        // �ر�������
	        br.close();
	        in.close();
	        return result1;

	    }
	    public static <T> String listToString(List<T> list) {
	        StringBuilder sb = new StringBuilder();
	        boolean b = false;
	        for (T o : list) {
	            if (b)
	                sb.append(',');
	            sb.append(o);
	            b = true;
	        }
	        return sb.toString();
	    }

	
}
