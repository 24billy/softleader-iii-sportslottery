package tw.com.softleader.sportslottery.setting.util;

import com.opensymphony.xwork2.ActionSupport;

public class PassToAction  extends ActionSupport {
	
	public String goIndex() throws Exception {
		return SUCCESS;
	}
	
	public String goDeposit() throws Exception {
		return INPUT;
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return super.execute();
	}

	@Override
	public void validate() {
		// TODO Auto-generated method stub
		super.validate();
	}

	
}
