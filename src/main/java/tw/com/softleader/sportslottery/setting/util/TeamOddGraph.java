package tw.com.softleader.sportslottery.setting.util;

import java.util.HashMap;
import java.util.Map;

import org.joda.time.LocalDate;

public class TeamOddGraph {
	
	//取得隊伍在所選時間含之前所有的所有odds, 並將資訊放入OddCountBean Map
		public Map<String, OddCountBean> getOddBeanMapByTimeAndTeam (LocalDate gameTime, String teamName){
			Map<String,OddCountBean> map=new HashMap<String,OddCountBean>();
			OddCountBean bean= new OddCountBean();
			
			bean.setBeanByGameTimeAndTeamName(gameTime, teamName, "SU_H");
			map.put("SU_H", bean);
//			bean2.setBeanByGameTimeAndTeamName(gameTime, teamName, "SU_A");
//			map.put("SU_A", bean2);
//			bean.setBeanByGameTimeAndTeamName(gameTime, teamName, "ATS_A");
//			map.put("ATS_A", bean);
//			bean.setBeanByGameTimeAndTeamName(gameTime, teamName, "ATS_H");
//			map.put("ATS_H", bean);
//			bean.setBeanByGameTimeAndTeamName(gameTime, teamName, "SC_H");
//			map.put("SC_H", bean);
//			bean.setBeanByGameTimeAndTeamName(gameTime, teamName, "SC_L");
//			map.put("SC_L", bean);
//			bean.setBeanByGameTimeAndTeamName(gameTime, teamName, "ODD");
//			map.put("ODD", bean);
//			bean.setBeanByGameTimeAndTeamName(gameTime, teamName, "EVEN");
//			map.put("EVEN", bean);
			
			
			
			return map;
		}

}
