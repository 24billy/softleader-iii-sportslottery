package tw.com.softleader.sportslottery.setting.web;

import java.io.InputStream;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.service.GameService;
import tw.com.softleader.sportslottery.setting.util.CountBean;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class StatisticAction extends ActionSupport{
	
	private static final long serialVersionUID = 2014L;
	@Autowired
	private GameService service;
	private String teamName;
	private String result;
	private InputStream inputStream;
	private String json;
	private int size;
	
	private Locale locale = ActionContext.getContext().getLocale();
	
	public Locale getLocale() {
		return locale;
	}
	

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	
	public String execute() throws Exception{
		result="hahahahahahaahahhahaaa";
		return "hello";
		
	}
	public String countAllHistoryByTeam(){
		
		List<Map<String, CountBean>> listMap = service.getAllCountHistoryByTeam(teamName);
//		result = listMap.toString();
		List<CountBean> listBean =service.getSortCountHistory(listMap);
		size = listBean.size();
		json = new Gson().toJson(listBean);//輸入teamName取得COUNT資訊
//		json = new Gson().toJson(service.trialGetCountInfoHistory());//使用預設值
//		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		
		return "countAllHistoryByTeam";
	}

}
