package tw.com.softleader.sportslottery.setting.util;

import java.math.BigDecimal;

import org.junit.Test;

import tw.com.softleader.sportslottery.common.test.BaseTest;

public class CountBeanTest extends BaseTest {

	@Test
	public void test() {
		CountBean bean1 = new CountBean();
		CountBean bean2 = new CountBean();
//		bean1.setPercentage(new BigDecimal(0.2));
//		bean2.setPercentage(new BigDecimal(0.2));
		
//		bean1.setPercentage(new BigDecimal(1.2));
//		bean2.setPercentage(new BigDecimal(0.2));
		bean1.setPercentage(new BigDecimal(0.2));
		bean2.setPercentage(new BigDecimal(1.2));
		log.debug("compareTo = {}",bean1.compareTo(bean2) );
		
		
	}

}
