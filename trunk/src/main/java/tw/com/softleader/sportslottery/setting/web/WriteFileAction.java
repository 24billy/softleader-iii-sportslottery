package tw.com.softleader.sportslottery.setting.web;



import java.io.FileOutputStream;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.opensymphony.xwork2.ActionSupport;

public class WriteFileAction extends ActionSupport{

	private static final long serialVersionUID = 2014L;
	public static String outputFile="E:\\test.xls";
	private Logger log = LoggerFactory.getLogger(WriteFileAction.class);
	private String id;
	private String date;
	private String datas;
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
	
	public String getDatas() {
		return datas;
	}

	public void setDatas(String datas) {
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
		
		Gson gson = new Gson();
		Type listType = new TypeToken<List>() {}.getType();
		List<Map> tempList = gson.fromJson(datas, listType);
		int rows=0;
		
		try {
			HSSFWorkbook workBook = new HSSFWorkbook();
			HSSFSheet sheet = workBook.createSheet();
			sheet.setColumnWidth(0, 2500);
			sheet.setColumnWidth(1, 4000);
			sheet.setColumnWidth(2, 6200);
			sheet.setColumnWidth(3, 3500);
			sheet.setColumnWidth(4, 3500);
			sheet.setColumnWidth(5, 4000);
			sheet.setColumnWidth(6, 2000);
			sheet.setColumnWidth(7, 3000);
			
			for(int lotterySize=0;lotterySize<tempList.size();lotterySize++) {
				Map lottery = tempList.get(lotterySize);
				Double templotteryId = (Double)lottery.get("id");
				String lotteryId = String.valueOf(templotteryId);
				lotteryId = lotteryId.substring(0, lotteryId.length()-2);
				String lotteryDate = (String)lottery.get("date");
				Double templotteryCapital = (Double)lottery.get("capital");
				String lotteryCapital = String.valueOf(templotteryCapital);
				Double templotteryWin = (Double)lottery.get("win");
				String lotteryWin = null;
				if(templotteryWin<0) {
					lotteryWin = "尚未派彩";
				}else {
					lotteryWin = String.valueOf(templotteryWin);
				}
				
				String lotteryPlay = (String)lottery.get("play");
				List lotteryOdds = (List)lottery.get("odds");
				log.debug(lotteryOdds.toString());
				//欄位
				Row headerRow = sheet.createRow(rows);
				rows++;
				Cell titleCell = headerRow.createCell(0);
				titleCell.setCellValue("彩卷編號");
				Cell dateCell = headerRow.createCell(1);
				dateCell.setCellValue("下注日期");
				Cell capitalCell = headerRow.createCell(2);
				capitalCell.setCellValue("下注金額");
				Cell winCell = headerRow.createCell(3);
				winCell.setCellValue("獲得獎金");
				Cell playCell = headerRow.createCell(4);
				playCell.setCellValue("玩法");
				
				//值
				HSSFRow row = sheet.createRow(rows);
				rows++;
				HSSFCell cell = row.createCell(0);
				//cell.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell.setCellValue(lotteryId);
				cell = row.createCell(1);
				cell.setCellValue(lotteryDate);
				cell = row.createCell(2);
				cell.setCellValue(lotteryCapital);
				cell = row.createCell(3);
				cell.setCellValue(lotteryWin);
				cell = row.createCell(4);
				cell.setCellValue(lotteryPlay);
				Row oddsHeaderRow = sheet.createRow(rows);
				rows++;
				Cell oddsId = oddsHeaderRow.createCell(0);
				oddsId.setCellValue("注別");
				Cell oddsBall = oddsHeaderRow.createCell(1);
				oddsBall.setCellValue("球種");
				Cell oddsGameTime = oddsHeaderRow.createCell(2);
				oddsGameTime.setCellValue("比賽時間");
				Cell oddsHome = oddsHeaderRow.createCell(3);
				oddsHome.setCellValue("主隊");
				Cell oddsAway = oddsHeaderRow.createCell(4);
				oddsAway.setCellValue("客隊");
				Cell oddsType = oddsHeaderRow.createCell(5);
				oddsType.setCellValue("下注類型");
				Cell oddsOddsValue = oddsHeaderRow.createCell(6);
				oddsOddsValue.setCellValue("賠率");
				Cell oddsPass = oddsHeaderRow.createCell(7);
				oddsPass.setCellValue("是否過關");
				for(int oddsSize=0;oddsSize<lotteryOdds.size();oddsSize++) {
					Map odd = (Map)lotteryOdds.get(oddsSize);
					String oddGameTime = (String)odd.get("gameTime");
					String oddBall = (String)odd.get("ballType");
					String oddHome = (String)odd.get("teamHomeName");
					String oddAway = (String)odd.get("teamAwayName");
					String oddType = (String)odd.get("labelText");
					Double tempoddValue = (Double)odd.get("value");
					String oddValue = String.valueOf(tempoddValue);
					String oddPass = (String)odd.get("isPass");
					
					HSSFRow oddsRow = sheet.createRow(rows);
					rows++;
					HSSFCell oddCell = oddsRow.createCell(0);
					oddCell.setCellValue(String.valueOf(oddsSize+1));
					oddCell = oddsRow.createCell(1);
					oddCell.setCellValue(oddBall);
					oddCell = oddsRow.createCell(2);
					oddCell.setCellValue(oddGameTime);
					oddCell = oddsRow.createCell(3);
					oddCell.setCellValue(oddHome);
					oddCell = oddsRow.createCell(4);
					oddCell.setCellValue(oddAway);
					oddCell = oddsRow.createCell(5);
					oddCell.setCellValue(oddType);
					oddCell = oddsRow.createCell(6);
					oddCell.setCellValue(oddValue);
					oddCell = oddsRow.createCell(7);
					oddCell.setCellValue(oddPass);
				}
				rows+=2;
			}
			FileOutputStream file = new FileOutputStream(outputFile);
			workBook.write(file);
			file.flush();
			workBook.close();
			log.debug("檔案生成...");
				
		} catch (Exception e) {
			e.printStackTrace();
			log.debug("檔案生成失敗...");
		}
		
		
//		System.out.println("123132132");
//		System.out.println(id);
//		System.out.println(date);
//		System.out.println(gameTime);
		return SUCCESS;
	}
}
