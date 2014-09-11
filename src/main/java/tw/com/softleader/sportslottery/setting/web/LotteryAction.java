package tw.com.softleader.sportslottery.setting.web;

import java.io.*;
import java.lang.reflect.*;
import java.nio.charset.*;
import java.util.*;

import javax.servlet.http.*;

import org.apache.struts2.*;
import org.apache.struts2.interceptor.*;
import org.joda.time.*;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;

import tw.com.softleader.sportslottery.setting.entity.*;
import tw.com.softleader.sportslottery.setting.service.*;
import tw.com.softleader.sportslottery.setting.util.*;

import com.google.gson.*;
import com.opensymphony.xwork2.*;
/**
@Author:Billy 
 */
public class LotteryAction extends ActionSupport implements ServletRequestAware {
	private static final long serialVersionUID = 2014L;
	
	@Autowired
	private LotteryService service;
	@Autowired
	private UserService userService;
	@Autowired
	private OddsService oddsService;
	@Autowired
	private LotteryOddsService lotteryOddsService;
	
	
	private LotteryEntity model;
	private List<LotteryEntity> models;
	private Logger log = LoggerFactory.getLogger(LotteryAction.class);
	private InputStream inputStream;
	private String json;
	private HttpSession session;
	private OddsIdList oddsIdList;
	private LocalDate timeFrom, timeTo;
	private Long winOpen;
	@Override
	public void setServletRequest(HttpServletRequest request) {
		log.debug("get Session...");
		session = request.getSession();
	}
		

	public OddsIdList getOddsIdList() {
		return oddsIdList;
	}
	public void setOddsIdList(OddsIdList oddsIdList) {
		this.oddsIdList = oddsIdList;
	}

	public InputStream getInputStream() {
		return inputStream;
	}
	public String getJson() {
		return json;
	}
	
	public LotteryEntity getModel() {
		return model;
	}

	public void setModel(LotteryEntity model) {
		this.model = model;
	}

	public List<LotteryEntity> getModels() {
		return models;
	}
	
	
	public LocalDate getTimeFrom() {
		return timeFrom;
	}


	public void setTimeFrom(LocalDate timeFrom) {
		this.timeFrom = timeFrom;
	}


	public LocalDate getTimeTo() {
		return timeTo;
	}


	public void setTimeTo(LocalDate timeTo) {
		this.timeTo = timeTo;
	}
	

	public Long getWinOpen() {
		return winOpen;
	}


	public void setWinOpen(Long winOpen) {
		this.winOpen = winOpen;
	}


	@Override
	public void validate() {
				
	}
	@Override
	public String execute() throws Exception {
		log.debug("execute LotteryAction");

		json = new Gson().toJson(service.getAll());
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		
		return SUCCESS;
	}

	public String lottery() throws Exception {
		
		//System.out.println("oddsIdList="+oddsIdList);
		//start insert
		//測試用：設定UserId為2
		model.setUserId(2L);
		model.setConfirmTime(new LocalDateTime());
		
        Long capital = model.getCapital();
        System.out.println("capital:"+capital);
        model=service.insert(model);
        
        Set<LotteryOddsEntity> lotteryOdds=new HashSet<LotteryOddsEntity>();
        LotteryOddsEntity lotteryOdd = new LotteryOddsEntity();
        
        //紀錄投注
        int oddsCount1=0;
        StringBuilder oddsArray1=new StringBuilder(); 
        Method[] methods = oddsIdList.getClass().getMethods();
        for (Method method : methods){
            String methodStr = method.toString();
            if (methodStr.indexOf("getOddId") >= 0){
                if(method.invoke(oddsIdList, null)!=null){
                    oddsArray1.append(","+method.invoke(oddsIdList, null));
                    Long oddId= (Long)method.invoke(oddsIdList, null);
                    OddsEntity odd=new OddsEntity();
                    odd=oddsService.getById(oddId);
                    lotteryOdd = new LotteryOddsEntity();
                    lotteryOdd.setLotteryId(model.getId());
                    lotteryOdd.setOddsId(odd);
                    lotteryOdds.add(lotteryOdd);
                    oddsCount1++;
                }            
            }      
        }
        System.out.println("lotteryOdds:"+lotteryOdds);
        
        String temp1=oddsArray1.toString().substring(1);
        System.out.println("oddsCount:"+oddsCount1);
        System.out.println("oddsArray1:"+temp1);
        model.setLotteryOdds(lotteryOdds);
        service.update(model);
        
		//紀錄投注
		/*
        StringBuilder oddsArray=new StringBuilder(); 
        int oddsCount=0;
        
        if(oddsIdList.getOddId1()!=null){
            oddsCount++;
            oddsArray.append(","+oddsIdList.getOddId1());
        }
        if(oddsIdList.getOddId2()!=null){
            oddsCount++;
            oddsArray.append(","+oddsIdList.getOddId2());          
        }
        if(oddsIdList.getOddId3()!=null){
            oddsCount++;
            oddsArray.append(","+oddsIdList.getOddId3());
        }
        if(oddsIdList.getOddId4()!=null){
            oddsCount++;
            oddsArray.append(","+oddsIdList.getOddId4());
        }
        if(oddsIdList.getOddId5()!=null){
            oddsCount++;
            oddsArray.append(","+oddsIdList.getOddId5());
        }
        if(oddsIdList.getOddId6()!=null){
            oddsCount++;
            oddsArray.append(","+oddsIdList.getOddId6());
        }
        if(oddsIdList.getOddId7()!=null){
            oddsCount++;
            oddsArray.append(","+oddsIdList.getOddId7());
        }
        if(oddsIdList.getOddId8()!=null){
            oddsCount++;
            oddsArray.append(","+oddsIdList.getOddId8());
        }

        String temp=oddsArray.toString().substring(1);
        System.out.println("oddsCount:"+oddsCount);
        System.out.println("oddsArray:"+temp);
        */
	
		return Action.SUCCESS;
	}
	

	public String delete(){
		log.debug("LotteryAction delete");
		log.debug("Model = {}", model);
		
		try {
			service.delete(model);
		} catch (Exception e) {
			log.debug("!!LotteryAction deleteFail!!");
			addFieldError("QueryFail", "Delete Fail : has already been deleted");
		}

		json = new Gson().toJson(service.getAll());
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		
		return SUCCESS;
	}
	
	public String update() {
		log.debug("LotteryAction update");
		log.debug("Model = {}", model);
		try {
			service.update(model);
		} catch (Exception e) {
			log.debug("!!LotteryAction updateFail!!");
			addFieldError("QueryFail","Update Fail : update failed");
		}

		json = new Gson().toJson(service.getAll());
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		
		return SUCCESS;
	}
	
	public String insert() {
		log.debug("LotteryAction insert");
		
		log.debug("Model = {}", model);
		try {
			service.insert(model);
		} catch (Exception e) {
			log.debug("!!LotteryAction insert Failed!!");
			addFieldError("QueryFail","Insert Fail : no target");
		}

		json = new Gson().toJson(service.getAll());
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		
		return SUCCESS;
	}
	
	public String selectByUser() {
		log.debug("Lottery by User...");
		
		try {
			Map<String, UserEntity> session2 = (Map) ServletActionContext.getContext().getSession();
			UserEntity entity = (UserEntity) session2.get("user");
			
//			UserEntity entity = (UserEntity)session.getAttribute("user");
			
			Long id = entity.getId();
			log.debug("id..." + id);
			json = new Gson().toJson(service.getComplex(id, timeFrom, timeTo, winOpen));
		} catch (Exception e) {
			log.debug("!!LotteryAction selectByUser Failed!!");
			addFieldError("QueryFail","selectByUser Fail");
			e.printStackTrace();
		}
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		return "selectByUser";
	}
	
	public String userOddsComplex() {
		log.debug("userOdds...");
		
		return SUCCESS;
	}
//    private void getCombination(int[] source, int number, int begin, int[] tempArray, int index) {  
//        
//        if(number == 0){//如果抓取達到目標，輸出該陣列  
//        	String str = "";
//        	for(int i = 0; i < index; i++){  
//        		str += tempArray[i]+" ";
//        		System.out.print(tempArray[i] + " ");  
//            }  
//              
//            return;  
//        }  
//              
//        for(int i = begin; i < source.length; i++){  
//              
//        	tempArray[index] = source[i];  
//            getCombination(source, number-1, i+1, tempArray, index+1);  
//        }  
//          
//    } 
	
	
}
