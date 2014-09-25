package tw.com.softleader.sportslottery.setting.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.entity.LotteryEntity;
import tw.com.softleader.sportslottery.setting.entity.LotteryOddsEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;
import tw.com.softleader.sportslottery.setting.service.GameService;
import tw.com.softleader.sportslottery.setting.service.LotteryOddsService;
import tw.com.softleader.sportslottery.setting.service.LotteryService;
import tw.com.softleader.sportslottery.setting.service.OddsService;
import tw.com.softleader.sportslottery.setting.service.UserService;
import tw.com.softleader.sportslottery.setting.util.OddsIdList;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
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
    private GameService gameService;
	@Autowired
	private LotteryOddsService lotteryOddsService;
	
	
	private LotteryEntity model;
	private List<LotteryEntity> models;
	private Logger log = LoggerFactory.getLogger(LotteryAction.class);
	private InputStream inputStream;
	private String json;
	private String jsonLottery;
	private String jsonGame;
	private HttpSession session;
	private OddsIdList oddsIdList;
	private LocalDate timeFrom, timeTo;
	private Long winOpen;
	private String errorMsg;
	private String lotteryToken;
	
	public String getLotteryToken() {
		return lotteryToken;
	}

	public void setLotteryToken(String lotteryToken) {
		this.lotteryToken = lotteryToken;
	}

	private Locale locale = ActionContext.getContext().getLocale();
	
	public Locale getLocale() {
		return locale;
	}
	
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
	
	public void setJson(String json)
    {
        this.json = json;
    }


    public String getJsonLottery()
    {
        return jsonLottery;
    }


    public void setJsonLottery(String jsonLottery)
    {
        this.jsonLottery = jsonLottery;
    }
    

    public String getJsonGame()
    {
        return jsonGame;
    }


    public void setJsonGame(String jsonGame)
    {
        this.jsonGame = jsonGame;
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
	
	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
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
		//model.setUserId(2L);		
	    //從session中取出userId
	    Map session = ActionContext.getContext().getSession();
	        UserEntity user = (UserEntity)session.get("user");
	    
	    String lastToken = null;
		try {
			lastToken = (String)session.get("lotteryToken");
		} catch (Exception e) {
			e.printStackTrace();
		}
	    session.put("lotteryToken", lotteryToken);
	    if (lastToken != null && lastToken.equals(lotteryToken)) {
	    	log.debug("使用者重複送出請求!");
	    	errorMsg = "按重新整理也沒用!!";
	    	return ERROR;
	    }
	    
	    
	    model.setUserId(user.getId());  
	    model.setConfirmTime(new LocalDateTime());  
	    model=service.insert(model);
	    
	    //將form的資料提取
        Long capital = model.getCapital();
        model.setWin(-1L);
        System.out.println("capital:"+capital);
        
        Set<LotteryOddsEntity> lotteryOdds=new HashSet<LotteryOddsEntity>();
        LotteryOddsEntity lotteryOdd = new LotteryOddsEntity();
        List<OddsEntity> odds=new ArrayList<OddsEntity>();
        List<GameEntity> games=new ArrayList<GameEntity>();
        //紀錄投注
        int oddsCount=0;
        StringBuilder oddsArray=new StringBuilder(); 
        Method[] methods = oddsIdList.getClass().getMethods();
        for (Method method : methods){
            String methodStr = method.toString();
            if (methodStr.indexOf("getOddId") >= 0){
                if(method.invoke(oddsIdList, null)!=null){
                    oddsArray.append(","+method.invoke(oddsIdList, null));
                    Long oddId= (Long)method.invoke(oddsIdList, null);
                    OddsEntity odd=new OddsEntity();
                    odd=oddsService.getById(oddId);
                    odds.add(odd);
                    lotteryOdd = new LotteryOddsEntity();
                    lotteryOdd.setLotteryId(model.getId());
                    lotteryOdd.setOddsId(odd);
                    lotteryOdds.add(lotteryOdd);
                    
                    GameEntity game=new GameEntity();                    
                    game=gameService.getById(odd.getGameId());
                    games.add(game);
                    oddsCount++;
                }            
            }      
        }
        System.out.println("lotteryOdds:"+lotteryOdds);
        System.out.println("oddsCount:"+oddsCount);
        
        //更新coins
        if(capital <= user.getCoins()) {
        	user.setCoins(user.getCoins() - capital*oddsCount);
        	userService.update(user);
        	log.debug("更新成功");
        } else {
        	service.delete(model);
        	log.debug("更新失敗");
        	errorMsg = "虛擬幣不足 請加值!!!";
        	return ERROR;
        }
        
        String temp=oddsArray.toString().substring(1);
        
        System.out.println("oddsArray1:"+temp);
        model.setLotteryOdds(lotteryOdds);
        service.update(model);
        
        if(odds!=null && odds.size()!=0){
            json = new Gson().toJson(odds);
            jsonLottery = new Gson().toJson(model);
            jsonGame = new Gson().toJson(games);
        }
	
		return Action.SUCCESS;
	}
	public String virtualLottery() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException{
        System.out.println("去吧，虛擬投注!!");

        model.setConfirmTime(new LocalDateTime());
        model.setWin(-1L);

        
        //紀錄投注
        int oddsCount=0;
        List<OddsEntity> odds=new ArrayList<OddsEntity>();
        List<GameEntity> games=new ArrayList<GameEntity>();
        StringBuilder oddsArray=new StringBuilder(); 
        Method[] methods = oddsIdList.getClass().getMethods();
        for (Method method : methods){
            String methodStr = method.toString();
            if (methodStr.indexOf("getOddId") >= 0){
                if(method.invoke(oddsIdList, null)!=null){
                    oddsArray.append(","+method.invoke(oddsIdList, null));
                    Long oddId= (Long)method.invoke(oddsIdList, null);
                    OddsEntity odd=new OddsEntity();                    
                    odd=oddsService.getById(oddId);
                    odds.add(odd);
                    GameEntity game=new GameEntity();                    
                    game=gameService.getById(odd.getGameId());
                    games.add(game);
                    oddsCount++;
                }            
            }      
        }

        if(odds!=null && odds.size()!=0){
            json = new Gson().toJson(odds);
            jsonLottery = new Gson().toJson(model);
            jsonGame = new Gson().toJson(games);
        }
      
	    return "successtoo";
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
			if(entity!=null){
				Long id = entity.getId();
				log.debug("id..." + id);
				json = new Gson().toJson(service.getComplex(id, timeFrom, timeTo, winOpen));
			}
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
	
	public String updateWin() {
		log.debug("----------------"+model.getId());
		String message;
		Map session = ActionContext.getContext().getSession();
		UserEntity user = (UserEntity)session.get("user");
		log.debug("{}",model.getId());
	    LotteryEntity entity = service.getById(model.getId());
	    log.debug("dsfasdf"+entity);
		Long status = entity.getLotteryStatus();
		try {
			if(status==0) {
				user.setCoins(user.getCoins() + entity.getWin());
				userService.update(user);
//				Long win = user.getCoins() + entity.getWin();
//				log.debug("111111111111111"+win);
//				userService.updateUserCoin(user.getId(), win);
				entity.setLotteryStatus(1l);
				service.update(entity);
				message = SUCCESS;
				log.debug("獎金更新成功");
			} else {
				log.debug("獎金更新失敗");
				message = ERROR;
			}
		} catch (Exception e) {
			log.debug("獎金更新異常");
			message = ERROR;
			e.printStackTrace();
		}
		inputStream = new ByteArrayInputStream(message.getBytes(StandardCharsets.UTF_8));
		return "message";
		
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
