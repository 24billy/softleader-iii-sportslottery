package tw.com.softleader.sportslottery.setting.web;

import java.util.List;

import org.joda.time.LocalDateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.entity.LotteryEntity;
import tw.com.softleader.sportslottery.setting.service.LotteryService;

import com.opensymphony.xwork2.ActionSupport;
/**
@Author:Billy 
 */
public class LotteryAction extends ActionSupport  {
	@Autowired
	private LotteryService service;
	
	private LotteryEntity model;
	
	private List<LotteryEntity> models;
	
	private Logger log = LoggerFactory.getLogger(LotteryAction.class);

	public LotteryEntity getModel() {
		return model;
	}

	public void setModel(LotteryEntity model) {
		this.model = model;
	}

	public List<LotteryEntity> getModels() {
		return models;
	}

	public void setModels(List<LotteryEntity> models) {
		this.models = models;
	}

	@Override
	public void validate() {
				
	}
	@Override
	public String execute() throws Exception {
		log.debug("execute LotteryAction");

		models = service.getAll();
		log.debug("Models = {}", models);
		
		return SUCCESS;
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

		models = service.getAll();
		
		return SUCCESS;
	}
	
	public String update() {
		log.debug("LotteryAction update");
		model.setModifier("guest");
		model.setModifiedTime(LocalDateTime.now());
		log.debug("Model = {}", model);
		try {
			service.update(model);
		} catch (Exception e) {
			log.debug("!!LotteryAction updateFail!!");
			addFieldError("QueryFail","Update Fail : update failed");
		}

		models = service.getAll();
		
		return SUCCESS;
	}
	
	public String insert() {
		log.debug("LotteryAction insert");
		
		model.setCreator("guest");
		model.setModifier("guest");
		model.setCreateTime(LocalDateTime.now());
		model.setModifiedTime(LocalDateTime.now());
		
		log.debug("Model = {}", model);
		try {
			service.insert(model);
		} catch (Exception e) {
			log.debug("!!LotteryAction insert Failed!!");
			addFieldError("QueryFail","Insert Fail : no target");
		}
		
		models = service.getAll();
		
		return SUCCESS;
	}
	
}
