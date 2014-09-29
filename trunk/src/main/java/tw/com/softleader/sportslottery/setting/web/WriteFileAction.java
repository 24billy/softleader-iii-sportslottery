package tw.com.softleader.sportslottery.setting.web;



import java.util.List;
import java.util.Map;

import org.codehaus.jettison.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

public class WriteFileAction extends ActionSupport{

	private static final long serialVersionUID = 2014L;
	public static String outputFile="E:\\test.xls";
	
	private Logger log = LoggerFactory.getLogger(LotteryAction.class);
	private String id;
	private String date;
	private List datas;
	private String gameTime;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	public List getDatas() {
		return datas;
	}

	public void setDatas(List datas) {
		this.datas = datas;
	}

	public String getGameTime() {
		return gameTime;
	}

	public void setGameTime(String gameTime) {
		this.gameTime = gameTime;
	}

	
	@Override
	public void validate() {
		
	}
	
//	public String Lotterys() {
//		List<String> myList = new ArrayList<String>();
//		myList.add(id);
//		myList.add(date);
//		myList.add(gameTime);
//		System.out.println(myList);
//		System.out.println("1111111111");
//		System.out.println(myList.size());
//		return "message";
//	}
	
	public String exportLotterysDetails() {
		System.out.println("11111");
		System.out.println(datas);
		
		
		
		JSONObject json = new JSONObject();
		
		////Lotterys();
//		Map session = ActionContext.getContext().getSession();
//		UserEntity user = (UserEntity)session.get("user");
//		System.out.println(user.getLotterys());
//		lottery = (LotteryEntity) user.getLotterys();
//		log.debug("lottery"+lottery);
//		lottery.getLotteryOdds();
//		System.out.println(lottery.getLotteryOdds());
//		System.out.println("11111");

//		try {
//			HSSFWorkbook workBook = new HSSFWorkbook();
//			HSSFSheet sheet = workBook.createSheet();
//			//欄位
//			Row headerRow = sheet.createRow(0);
//			Cell titleCell = headerRow.createCell(0);
//			titleCell.setCellValue("彩卷編號");
//			
//			//值
//			HSSFRow row = sheet.createRow(1);
//			HSSFCell cell = row.createCell(0);
//			cell.setCellType(HSSFCell.CELL_TYPE_STRING);
//			cell.setCellValue(id);
//			FileOutputStream file = new FileOutputStream(outputFile);
//			workBook.write(file);
//			file.flush();
//			System.out.println("檔生成...");
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("Error...");
//		}
		
		
//		System.out.println("123132132");
//		System.out.println(id);
//		System.out.println(date);
//		System.out.println(gameTime);
		return SUCCESS;
	}
}
