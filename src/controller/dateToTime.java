package controller;

//import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;


public class dateToTime {
	public static Date dateToTime(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = null;
//		Timestamp stampdate = null;
		try {
			dt = sdf.parse(date);
//			stampdate = new Timestamp(dt.getTime());
			
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
		
//		return stampdate;
		return dt;
	}
}
