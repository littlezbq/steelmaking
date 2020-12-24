package controller;

//import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;


public class dateToTime {
	public static String dateToTime1(String GMTdate) {
		SimpleDateFormat sf = new SimpleDateFormat("EEE MMM dd hh:mm:ss z yyyy", Locale.ENGLISH);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = null;
		String dateTime="";
//		Timestamp stampdate = null;
		try {
			dt = sf.parse(GMTdate);
			dateTime = sdf.format(dt);
//			stampdate = new Timestamp(dt.getTime());
			
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
		
//		return stampdate;
		return dateTime;
	}
	
//	GMT时间转Date类型
	public static Date dateToTime2(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd hh:mm:ss z yyyy",Locale.US);
//		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = null;
//		String dt_middle = "";
		try {
//			dt_middle = sdf.format(date);
			dt = sdf.parse(date);
		}
		catch (java.text.ParseException e) {
			e.printStackTrace();
		}
		return dt;
	}
	
	public static Date StringToDate(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = null;
//		String dt_middle = "";
		try {
//			dt_middle = sdf.format(date);
			dt = sdf.parse(date);
		}
		catch (java.text.ParseException e) {
			e.printStackTrace();
		}
		return dt;
	}
}
