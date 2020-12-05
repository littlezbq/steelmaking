package bean;
//实体类
public class productSteel {
	private String steel_name;
	private String class_no;
	private	String produce_date;
	private String furnace_num;
	private double steel_c;
	private double steel_si;
	private double steel_mn;
	private double steel_p;
	private double steel_s;
	private double steel_als;
	private double steel_ti;
	private double steel_nb;
	public String getSteel_name() {
		if(steel_name==null) {
			return "";
		}
		return steel_name;
	}
	public void setSteel_name(String steel_name) {
		this.steel_name = steel_name;
	}
	public String getProduce_date() {
		return produce_date;
	}
	public void setProduce_date(String produce_date) {
		this.produce_date = produce_date;
	}
	public String getFurnace_num() {
		if(furnace_num==null) {
			return "";
		}
		return furnace_num;
	}
	public void setFurnace_num(String furnace_num) {
		this.furnace_num = furnace_num;
	}
	public double getSteel_c() {
//		因为浮点型或者其他数字不能直接和null进行比较，所以先转为string在和null对应的空字符串进行比较，把数据中为null的部分返回0
		String x = steel_c+"";
		if("".equals(x)) {
			return 0;
		}
		return steel_c;
	}
	public void setSteel_c(double steel_c) {
		this.steel_c = steel_c;
	}
	public double getSteel_si() {
		String x = steel_si+"";
		if("".equals(x)) {
			return 0;
		}
		return steel_si;
	}
	public void setSteel_si(double steel_si) {
		this.steel_si = steel_si;
	}
	public double getSteel_mn() {
		String x = steel_mn+"";
		if("".equals(x)) {
			return 0;
		}
		return steel_mn;
	}
	public void setSteel_mn(double steel_mn) {
		this.steel_mn = steel_mn;
	}
	public double getSteel_p() {
		String x = steel_p+"";
		if("".equals(x)) {
			return 0;
		}
		return steel_p;
	}
	public void setSteel_p(double steel_p) {
		this.steel_p = steel_p;
	}
	public double getSteel_s() {
		String x = steel_s+"";
		if("".equals(x)) {
			return 0;
		}
		return steel_s;
	}
	public void setSteel_s(double steel_s) {
		this.steel_s = steel_s;
	}
	public double getSteel_als() {
		String x = steel_als+"";
		if("".equals(x)) {
			return 0;
		}
		return steel_als;
	}
	public void setSteel_als(double steel_als) {
		this.steel_als = steel_als;
	}
	public double getSteel_ti() {
		String x = steel_ti+"";
		if("".equals(x)) {
			return 0;
		}
		return steel_ti;
	}
	public void setSteel_ti(double steel_ti) {
		this.steel_ti = steel_ti;
	}
	public double getSteel_nb() {
		String x = steel_nb+"";
		if("".equals(x)) {
			return 0;
		}
		return steel_nb;
	}
	public void setSteel_nb(double steel_nb) {
		this.steel_nb = steel_nb;
	}
	public String getClass_no() {
		if(class_no==null) {
			return "";
		}
		return class_no;
	}
	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}
	
	
}
