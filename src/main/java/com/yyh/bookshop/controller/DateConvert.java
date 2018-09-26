package com.yyh.bookshop.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
 * 
 * @author Administrator
 *
 */
public class DateConvert implements Converter<String,Date>{

	public Date convert(String dateStr) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
            if(!dateStr.equals("")){
				return sdf.parse(dateStr);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}



}
