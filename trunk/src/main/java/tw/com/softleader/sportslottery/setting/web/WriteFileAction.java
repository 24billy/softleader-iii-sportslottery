package tw.com.softleader.sportslottery.setting.web;



import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.opensymphony.xwork2.ActionSupport;

public class WriteFileAction extends ActionSupport implements ServletRequestAware, 
ServletResponseAware{

	private static final long serialVersionUID = 2014L;
	//public static String outputFile="E:\\test.xls";

	protected HttpServletRequest request = null;  
    protected HttpServletResponse response = null;
	private Logger log = LoggerFactory.getLogger(WriteFileAction.class);

	private String id;
	private String date;
	private String datas;
	private String gameTime;
	private InputStream inputStream;
	private String reportFile;
	
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

	public String getReportFile() {
		return reportFile;
	}

	public void setReportFile(String reportFile) {
		this.reportFile = reportFile;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	@Override
	public void validate() {
		
	}
	
	
	public String exportLotterysDetails() {

		reportFile = "Lottery" + "".concat(".xls");
		Gson gson = new Gson();
		Type listType = new TypeToken<List>() {}.getType();
		List<Map> tempList = gson.fromJson(datas, listType);
		System.out.println(tempList);
		log.debug("test"+tempList.toString());
		int rows=0;


		try {
			HSSFWorkbook workBook = new HSSFWorkbook();
			HSSFSheet sheet = workBook.createSheet();
			CellStyle style = workBook.createCellStyle();
			Font font = workBook.createFont();
	        font.setColor(HSSFColor.GREEN.index);
	        style.setFont(font);
	        
			CellStyle style2 = workBook.createCellStyle();
			Font font2 = workBook.createFont();
	        font2.setColor(HSSFColor.BLUE.index);
	        style2.setFont(font2);

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
				titleCell.setCellStyle(style);
				Cell dateCell = headerRow.createCell(1);
				dateCell.setCellValue("下注日期");
				dateCell.setCellStyle(style);
				Cell capitalCell = headerRow.createCell(2);
				capitalCell.setCellValue("下注金額");
				capitalCell.setCellStyle(style);
				Cell winCell = headerRow.createCell(3);
				winCell.setCellValue("獲得獎金");
				winCell.setCellStyle(style);
				Cell playCell = headerRow.createCell(4);
				playCell.setCellValue("玩法");
				playCell.setCellStyle(style);
				//值
				HSSFRow row = sheet.createRow(rows);
				rows++;
				HSSFCell cell = row.createCell(0);
				cell.setCellValue(lotteryId);
				cell.setCellStyle(style2);
				cell = row.createCell(1);
				cell.setCellValue(lotteryDate);
				cell.setCellStyle(style2);
				cell = row.createCell(2);
				cell.setCellValue(lotteryCapital);
				cell.setCellStyle(style2);
				cell = row.createCell(3);
				cell.setCellValue(lotteryWin);
				cell.setCellStyle(style2);
				cell = row.createCell(4);
				cell.setCellValue(lotteryPlay);
				cell.setCellStyle(style2);
				Row oddsHeaderRow = sheet.createRow(rows);
				rows++;
				Cell oddsId = oddsHeaderRow.createCell(0);
				oddsId.setCellValue("注別");
				oddsId.setCellStyle(style);
				Cell oddsBall = oddsHeaderRow.createCell(1);
				oddsBall.setCellValue("球種");
				oddsBall.setCellStyle(style);
				Cell oddsGameTime = oddsHeaderRow.createCell(2);
				oddsGameTime.setCellValue("比賽時間");
				oddsGameTime.setCellStyle(style);
				Cell oddsHome = oddsHeaderRow.createCell(3);
				oddsHome.setCellValue("主隊");
				oddsHome.setCellStyle(style);
				Cell oddsAway = oddsHeaderRow.createCell(4);
				oddsAway.setCellValue("客隊");
				oddsAway.setCellStyle(style);
				Cell oddsType = oddsHeaderRow.createCell(5);
				oddsType.setCellValue("下注類型");
				oddsType.setCellStyle(style);
				Cell oddsOddsValue = oddsHeaderRow.createCell(6);
				oddsOddsValue.setCellValue("賠率");
				oddsOddsValue.setCellStyle(style);
				Cell oddsPass = oddsHeaderRow.createCell(7);
				oddsPass.setCellValue("是否過關");
				oddsPass.setCellStyle(style);
				for(int oddsSize=0;oddsSize<lotteryOdds.size();oddsSize++) {
					Map odd = (Map)lotteryOdds.get(oddsSize);
					String oddGameTime = (String)odd.get("gameTime");
					String oddBall = (String)odd.get("ballType");
					if(oddBall.equals("<img src='images/baseball.gif'/>")) {
						oddBall = "棒球";
					} else if(oddBall.equals("<img src='images/basketball.png'/>")) {
						oddBall = "籃球";
					} else if(oddBall.equals("<img src='images/soccer.png'/>")) {
						oddBall = "足球";
					}
					System.out.println(oddBall);
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
					oddCell.setCellStyle(style2);
					oddCell = oddsRow.createCell(1);
					oddCell.setCellValue(oddBall);
					oddCell.setCellStyle(style2);
					oddCell = oddsRow.createCell(2);
					oddCell.setCellValue(oddGameTime);
					oddCell.setCellStyle(style2);
					oddCell = oddsRow.createCell(3);
					oddCell.setCellValue(oddHome);
					oddCell.setCellStyle(style2);
					oddCell = oddsRow.createCell(4);
					oddCell.setCellValue(oddAway);
					oddCell.setCellStyle(style2);
					oddCell = oddsRow.createCell(5);
					oddCell.setCellValue(oddType);
					oddCell.setCellStyle(style2);
					oddCell = oddsRow.createCell(6);
					oddCell.setCellValue(oddValue);
					oddCell.setCellStyle(style2);
					oddCell = oddsRow.createCell(7);
					oddCell.setCellValue(oddPass);
					oddCell.setCellStyle(style2);
				}
				rows+=2;
			}
			
			ByteArrayOutputStream out = new ByteArrayOutputStream();
		    workBook.write(out);
		    request.setAttribute("filename", "LotteryInfo");
		    setInputStream(new ByteArrayInputStream(out.toByteArray()));
			
//			FileOutputStream fOut = new FileOutputStream(outputFile);
//			workBook.write(fOut);
//			fOut.flush();
//			fOut.close();
			log.debug("檔案生成...");
				
		} catch (Exception e) {
			e.printStackTrace();
			log.debug("檔案生成失敗...");
		}


		return SUCCESS;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;	
	}
	
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}
}
