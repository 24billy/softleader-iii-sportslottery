package tw.com.softleader.sportslottery.common.misc;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;
import org.joda.time.LocalDate;

import com.opensymphony.xwork2.conversion.TypeConversionException;

public class LocalDateConvertion extends StrutsTypeConverter {

	@Override
	public Object convertFromString(Map context, String[] values, Class toClass) {
		if (values[0]!=null && values[0].length()!=0) {
			try {
				return LocalDate.parse(values[0]);
			} catch (Exception e) {
				e.printStackTrace();
				throw new TypeConversionException("Invalid format.");
			}
		}
		return null;
	}

	@Override
	public String convertToString(Map context, Object output) {
		if (output!=null && output instanceof LocalDate) {
			LocalDate result = (LocalDate)output;
			return result.toString();
		}
		return null;
	}

}
