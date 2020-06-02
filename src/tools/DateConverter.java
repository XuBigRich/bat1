package tools;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

public class DateConverter extends StrutsTypeConverter {

	private SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	private SimpleDateFormat sdf2=new SimpleDateFormat("yyyyƒÍMM‘¬dd»’");
	
	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		Date tim=null;
		try {
			tim=sdf.parse(arg1[0]);
		} catch (Exception e) {
			try {
				tim=sdf2.parse(arg1[0]);
			} catch (Exception e2) {
				
			}
		}
		return tim;
	}

	@Override
	public String convertToString(Map arg0, Object arg1) {
		Date tim=(Date)arg1;
		return sdf2.format(tim);
	}

}
