package tw.com.softleader.sportslottery.setting.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.entity.LotteryEntity;
import tw.com.softleader.sportslottery.setting.entity.LotteryOddsEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;
import tw.com.softleader.sportslottery.setting.service.LotteryOddsService;
import tw.com.softleader.sportslottery.setting.service.LotteryService;
import tw.com.softleader.sportslottery.setting.service.OddsService;
import tw.com.softleader.sportslottery.setting.service.UserService;
import tw.com.softleader.sportslottery.setting.util.Combination;
import tw.com.softleader.sportslottery.setting.util.OddsIdList;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
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
	private OddsEntity oddsEntity;
	private Logger log = LoggerFactory.getLogger(LotteryAction.class);
	private InputStream inputStream;
	private String json;
	private HttpSession session;
	private OddsIdList oddsIdList;
	private LocalDate timeFrom, timeTo;
	private Long winOpen;
	private Combination combination;
	@Override
	public void setServletRequest(HttpServletRequest request) {
		log.debug("get Session...");
		session = request.getSession();
	}
	
	
	public Combination getCombination() {
		return combination;
	}


	public void setCombination(Combination combination) {
		this.combination = combination;
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
		System.out.println("com:"+combination.getCom0());
		//如果是過關投注
		if(combination.getCom0()!=null){
			try {
				model=service.insert(model);
			} catch (Exception e) {
				log.debug("!!Lottery insertFail!!");
				e.printStackTrace();
			}
			
			StringBuilder oddsArray=new StringBuilder(); 
			int oddsCount=0;
			if(oddsIdList.getOddId1()!=null){
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId1());
				oddsEntity = oddsService.getById(oddsIdList.getOddId1());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			if(oddsIdList.getOddId2()!=null){
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId2());
				oddsEntity = oddsService.getById(oddsIdList.getOddId2());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			if(oddsIdList.getOddId3()!=null){
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId3());
				oddsEntity = oddsService.getById(oddsIdList.getOddId3());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			if(oddsIdList.getOddId4()!=null){
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId4());
				oddsEntity = oddsService.getById(oddsIdList.getOddId4());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			if(oddsIdList.getOddId5()!=null){
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId5());
				oddsEntity = oddsService.getById(oddsIdList.getOddId5());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			if(oddsIdList.getOddId6()!=null){
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId6());
				oddsEntity = oddsService.getById(oddsIdList.getOddId6());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			if(oddsIdList.getOddId7()!=null){
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId7());
				oddsEntity = oddsService.getById(oddsIdList.getOddId7());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			if(oddsIdList.getOddId8()!=null){
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId8());
				oddsEntity = oddsService.getById(oddsIdList.getOddId8());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			String temp=oddsArray.toString().substring(1);
			System.out.println("oddsCount:"+oddsCount);
			System.out.println("oddsArray:"+temp);
			System.out.println("combination="+combination);
			Long capital = model.getCapital();
			System.out.println("capital:"+capital);
		}
		else{
			//單場投注

			
			StringBuilder oddsArray=new StringBuilder(); 
			int oddsCount=0;
			if(oddsIdList.getOddId1()!=null){
				try {
					model=service.insert(model);
				} catch (Exception e) {
					log.debug("!!Lottery insertFail!!");
					e.printStackTrace();
				}
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId1());
				oddsEntity = oddsService.getById(oddsIdList.getOddId1());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			if(oddsIdList.getOddId2()!=null){
				try {
					model=service.insert(model);
				} catch (Exception e) {
					log.debug("!!Lottery insertFail!!");
					e.printStackTrace();
				}
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId2());
				oddsEntity = oddsService.getById(oddsIdList.getOddId2());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			if(oddsIdList.getOddId3()!=null){
				try {
					model=service.insert(model);
				} catch (Exception e) {
					log.debug("!!Lottery insertFail!!");
					e.printStackTrace();
				}
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId3());
				oddsEntity = oddsService.getById(oddsIdList.getOddId3());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			if(oddsIdList.getOddId4()!=null){
				try {
					model=service.insert(model);
				} catch (Exception e) {
					log.debug("!!Lottery insertFail!!");
					e.printStackTrace();
				}
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId4());
				oddsEntity = oddsService.getById(oddsIdList.getOddId4());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			if(oddsIdList.getOddId5()!=null){
				try {
					model=service.insert(model);
				} catch (Exception e) {
					log.debug("!!Lottery insertFail!!");
					e.printStackTrace();
				}
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId5());
				oddsEntity = oddsService.getById(oddsIdList.getOddId5());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			if(oddsIdList.getOddId6()!=null){
				try {
					model=service.insert(model);
				} catch (Exception e) {
					log.debug("!!Lottery insertFail!!");
					e.printStackTrace();
				}
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId6());
				oddsEntity = oddsService.getById(oddsIdList.getOddId6());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			if(oddsIdList.getOddId7()!=null){
				try {
					model=service.insert(model);
				} catch (Exception e) {
					log.debug("!!Lottery insertFail!!");
					e.printStackTrace();
				}
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId7());
				oddsEntity = oddsService.getById(oddsIdList.getOddId7());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			if(oddsIdList.getOddId8()!=null){
				try {
					model=service.insert(model);
				} catch (Exception e) {
					log.debug("!!Lottery insertFail!!");
					e.printStackTrace();
				}
				oddsCount++;
				oddsArray.append(","+oddsIdList.getOddId8());
				oddsEntity = oddsService.getById(oddsIdList.getOddId8());
				LotteryOddsEntity lotteryOddsEntity = new LotteryOddsEntity();
				lotteryOddsEntity.setLotteryId(model.getId());
				lotteryOddsEntity.setOddsId(oddsEntity);
				try {
					lotteryOddsService.insert(lotteryOddsEntity);
				} catch (Exception e) {
					log.debug("!!LotteryOdds insertFail!!");
					e.printStackTrace();
				}
			}
			String temp=oddsArray.toString().substring(1);
			System.out.println("oddsCount:"+oddsCount);
			System.out.println("oddsArray:"+temp);
			System.out.println("combination="+combination);
			Long capital = model.getCapital();
			System.out.println("capital:"+capital);
			
		}

		
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
