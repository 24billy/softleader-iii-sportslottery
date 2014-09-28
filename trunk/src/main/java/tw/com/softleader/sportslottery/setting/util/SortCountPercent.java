package tw.com.softleader.sportslottery.setting.util;

import java.util.Comparator;

//compare count percentage 
public class SortCountPercent implements Comparator<CountBean> {

	@Override
	public int compare(CountBean o1, CountBean o2) {
		// compare count percentage
		return o1.compareTo(o2);
	}

}
