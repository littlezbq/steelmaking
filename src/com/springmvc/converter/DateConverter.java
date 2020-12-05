package com.springmvc.converter;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class DateConverter implements Converter<String, Date> {

	@Override
	public Timestamp convert(String date) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd");
		Date dt = null;
		Timestamp stampdate = null;
		try {
			sdf.setLenient(false);//ÊÇ·ñ¿íËÉ½âÎö£¬Ä¬ÈÏtrue
			dt = sdf.parse(date);
			stampdate = new Timestamp(dt.getTime());
			return stampdate;
		} catch (ParseException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

}
