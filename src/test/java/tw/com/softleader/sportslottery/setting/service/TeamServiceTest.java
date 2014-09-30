package tw.com.softleader.sportslottery.setting.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.dao.TeamDao;
import tw.com.softleader.sportslottery.setting.entity.TeamEntity;

public class TeamServiceTest extends BaseTest{
	@Autowired
	private TeamService service;

	@Test
	public void testGetTeamDao() {
		TeamDao dao =service.getTeamDao();
		System.out.println(dao);
	}

	@Test
	public void testGetTeamsByLeagueName() {
		String leagueName="韓國職棒";
		List<TeamEntity> teams =service.getTeamsByLeagueName(leagueName);
		System.out.println("getTeamsByLeagueName: ");
		for(TeamEntity team: teams){
			System.out.println(team);
		}
		System.out.println("the size of teams by league name: "+ teams.size());
//				TeamEntity [teamName=斗山熊, teamNameEn=Doosan Bears, teamCode=DB, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=46]
//				TeamEntity [teamName=LG雙子, teamNameEn=LG Twins, teamCode=LGT, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=47]
//				TeamEntity [teamName=首爾英雄, teamNameEn=Nexen Heroes, teamCode=NH, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=48]
//				TeamEntity [teamName=SK飛龍, teamNameEn=SK Wyverns, teamCode=SKW, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=49]
//				TeamEntity [teamName=NC恐龍, teamNameEn=NC Dinos, teamCode=NCD, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=50]
//				TeamEntity [teamName=三星獅, teamNameEn=Samsung Lions, teamCode=SL, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=51]
//				TeamEntity [teamName=樂天巨人, teamNameEn=Lotte Giants, teamCode=LG, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=52]
//				TeamEntity [teamName=韓華老鷹, teamNameEn=Hanwha Eagles, teamCode=HE, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=53]
//				TeamEntity [teamName=起亞老虎, teamNameEn=Kia Tigers, teamCode=KT, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=54]
//				the size of teams by league name: 9
	}

	@Test
	public void testLeagueNames() {
		List<String> leagues=service.leagueNames();
		System.out.println(leagues);//[太平洋聯盟, 中央聯盟, 中華職棒, 美國職棒, 全美籃球協會, 韓國職棒]
	}

	@Test
	public void testGetTeamsByLeagueNameEn() {
		String leagueNameEn="Central League";
		List<TeamEntity> teams =service.getTeamsByLeagueNameEn(leagueNameEn);
		System.out.println("getTeamsByLeagueNameEn:");
		for(TeamEntity team: teams){
			System.out.println(team);
		}
		System.out.println("the size of team by league Name in English: "+ teams.size());
//			getTeamsByLeagueNameEn:
//			TeamEntity [teamName=讀賣巨人, teamNameEn=Yomiuri Giants, teamCode=YG, leagueName=中央聯盟, leagueNameEn=Central League, leagueCode=CL, ballType=Baseball, id=35]
//			TeamEntity [teamName=阪神虎, teamNameEn=Hanshin Tigers, teamCode=HT, leagueName=中央聯盟, leagueNameEn=Central League, leagueCode=CL, ballType=Baseball, id=36]
//			TeamEntity [teamName=中日龍, teamNameEn=Chunichi Dragons, teamCode=CD, leagueName=中央聯盟, leagueNameEn=Central League, leagueCode=CL, ballType=Baseball, id=37]
//			TeamEntity [teamName=廣島東洋鯉魚, teamNameEn=Hiroshima Toyo Carp, teamCode=HTC, leagueName=中央聯盟, leagueNameEn=Central League, leagueCode=CL, ballType=Baseball, id=38]
//			TeamEntity [teamName=橫濱海灣之星, teamNameEn=Yokohama DeNA BayStars, teamCode=YDB, leagueName=中央聯盟, leagueNameEn=Central League, leagueCode=CL, ballType=Baseball, id=39]
//			TeamEntity [teamName=養樂多燕子, teamNameEn=Tokyo Yakult Swallows, teamCode=TYS, leagueName=中央聯盟, leagueNameEn=Central League, leagueCode=CL, ballType=Baseball, id=40]
//			the size of team by league Name in English: 6
	}

	@Test
	public void testLeagueNamesEn() {
		List<String> leagueNames= service.leagueNamesEn();
		System.out.println(leagueNames);
					//[Central League, National Basketball Association, Major League Baseball, Korea Baseball Organization, Pacific League, Chinese Professional Baseball League]

	}

	@Test
	public void testGetLeagueNamesByBallType() {
		String ballType = "Baseball";
		List<String> leagueNames=service.getLeagueNamesByBallType(ballType);
		System.out.println(leagueNames);//[中央聯盟, 太平洋聯盟, 美國職棒, 韓國職棒, 中華職棒]
	}

	@Test
	public void testGetLeagueNamesByBallTypeEn() {
		String ballType = "Baseball";
		List<String> leagueNames =service.getLeagueNamesByBallTypeEn(ballType);
		System.out.println(leagueNames);//[Major League Baseball, Chinese Professional Baseball League, Korea Baseball Organization, Central League, Pacific League]
	}
//
	@Test
	public void testGetBallTypes() {
		List<String>ballTypes = service.getBallTypes();
		System.out.println(ballTypes);//[Basketball, Baseball]
	}

	@Test
	public void testGetByLeagueCode() {
		String leagueCode = "NBA";
		List<TeamEntity> teams = service.getByLeagueCode(leagueCode);
		System.out.println("getByLeagueCode:");
		for(TeamEntity team: teams){
			System.out.println(team);
		}
		System.out.println("size of teams by league code "+leagueCode+" is " + teams.size());
//			getByLeagueCode:
//			TeamEntity [teamName=波士頓塞爾提克, teamNameEn=Boston Celtics, teamCode=BC, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=55]
//			TeamEntity [teamName=布魯克林籃網, teamNameEn=Brooklyn Nets, teamCode=BN, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=56]
//			TeamEntity [teamName=紐約尼克, teamNameEn=New York Knicks, teamCode=NYK, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=57]
//			TeamEntity [teamName=費城76人, teamNameEn=Philadelphia 76ers, teamCode=P76, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=58]
//			TeamEntity [teamName=多倫多暴龍, teamNameEn=Toronto Raptors, teamCode=TR, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=59]
//			TeamEntity [teamName=芝加哥公牛, teamNameEn=Chicago Bulls, teamCode=CB, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=60]
//			TeamEntity [teamName=克里夫蘭騎士, teamNameEn=Cleveland Cavaliers, teamCode=CC, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=61]
//			TeamEntity [teamName=底特律活塞, teamNameEn=Detroit Pistons, teamCode=DP, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=62]
//			TeamEntity [teamName=印第安納溜馬, teamNameEn=Indiana Pacers, teamCode=IP, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=63]
//			TeamEntity [teamName=密爾瓦基公鹿, teamNameEn=Milwaukee Bucks, teamCode=MB, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=64]
//			TeamEntity [teamName=亞特蘭大老鷹, teamNameEn=Atlanta Hawks, teamCode=AH, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=65]
//			TeamEntity [teamName=夏洛特黃蜂, teamNameEn=Charlotte Hornets, teamCode=CH, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=66]
//			TeamEntity [teamName=邁阿密熱火, teamNameEn=Miami Heat, teamCode=MH, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=67]
//			TeamEntity [teamName=奧蘭多魔術, teamNameEn=Orlando Magic, teamCode=OM, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=68]
//			TeamEntity [teamName=華盛頓巫師, teamNameEn=Washington Wizards, teamCode=WW, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=69]
//			TeamEntity [teamName=達拉斯小牛, teamNameEn=Dallas Mavericks, teamCode=DM, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=70]
//			TeamEntity [teamName=休士頓火箭, teamNameEn=Houston Rockets, teamCode=HR, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=71]
//			TeamEntity [teamName=孟菲斯灰熊, teamNameEn=Memphis Grizzlies, teamCode=MG, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=72]
//			TeamEntity [teamName=紐奧良鵜鶘, teamNameEn=New Orleans Pelicans, teamCode=MOP, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=73]
//			TeamEntity [teamName=聖安東尼奧馬刺, teamNameEn=San Antonio Spurs, teamCode=SAS, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=74]
//			TeamEntity [teamName=丹佛掘金, teamNameEn=Denver Nuggets, teamCode=DN, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=75]
//			TeamEntity [teamName=明尼蘇達灰狼, teamNameEn=Minnesota Timberwolves, teamCode=MT, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=76]
//			TeamEntity [teamName=俄克拉何馬城雷霆, teamNameEn=Oklahoma City Thunder, teamCode=OCT, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=77]
//			TeamEntity [teamName=波特蘭拓荒者, teamNameEn=Portland Trail Blazers, teamCode=RTB, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=78]
//			TeamEntity [teamName=猶他爵士, teamNameEn=Utah Jazz, teamCode=UJ, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=79]
//			TeamEntity [teamName=金州勇士, teamNameEn=Golden State Warriors, teamCode=GSW, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=80]
//			TeamEntity [teamName=洛杉磯快船, teamNameEn=Los Angeles Clippers, teamCode=LAC, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=81]
//			TeamEntity [teamName=洛杉磯湖人, teamNameEn=Los Angeles Lakers, teamCode=LAL, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=82]
//			TeamEntity [teamName=菲尼克斯太陽, teamNameEn=Phoenix Suns, teamCode=PS, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=83]
//			TeamEntity [teamName=沙加緬度國王, teamNameEn=Sacramento Kings, teamCode=SK, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=84]
//			size of teams by league code NBA is 30
	}

	@Test
	public void testLeagueCodes() {
		List<String> leagueCodes =service.leagueCodes();
		System.out.println(leagueCodes);//[KBO, CPBL, MLB, NBA, CL, PL]
	}


	@Test
	public void testGetTeamList() {
		String leagueName = "全美籃球協會";
		List<TeamEntity> teams = service.getTeamList(leagueName);
		System.out.println("getTeamList");
		for(TeamEntity team: teams){
			System.out.println(team);
		}
		System.out.println("the sizd of teams list by leagueName"+ teams.size());
	}

	@Test
	public void testGetTeamListEn() {
		String leagueName = "National Basketball Association";
		List<TeamEntity> teams = service.getTeamListEn(leagueName);
		System.out.println("getTeamListEn:");
		for(TeamEntity team: teams){
			System.out.println(team);
		}
		System.out.println("the size of team list in English: "+ teams.size());
	}
	@Test
	public void testGetAll() {
		List<TeamEntity> teams =service.getAll();
		System.out.println("get all:");
		for(TeamEntity team: teams){
			System.out.println(team);
		}
		System.out.println("the size of all: "+ teams.size());
//		get all:
//			TeamEntity [teamName=巴爾地摩金鶯, teamNameEn=Baltimore Orioles, teamCode=BO, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=1]
//			TeamEntity [teamName=波士頓紅襪, teamNameEn=Boston Red Sox, teamCode=BRS, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=2]
//			TeamEntity [teamName=芝加哥白襪, teamNameEn=Chicago White Sox, teamCode=CWS, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=3]
//			TeamEntity [teamName=克里夫蘭印地安人, teamNameEn=Cleveland Indians, teamCode=CI, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=4]
//			TeamEntity [teamName=底特律老虎, teamNameEn=Detroit Tigers, teamCode=DT, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=5]
//			TeamEntity [teamName=休士頓太空人, teamNameEn=Houston Astros, teamCode=HA, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=6]
//			TeamEntity [teamName=堪薩斯皇家, teamNameEn=Kansas City Royals, teamCode=KCR, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=7]
//			TeamEntity [teamName=洛杉磯天使, teamNameEn=Los Angeles Angels of Anaheim, teamCode=LAAA, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=8]
//			TeamEntity [teamName=明尼蘇達雙城, teamNameEn=Minnesota Twins, teamCode=MT, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=9]
//			TeamEntity [teamName=紐約洋基, teamNameEn=New York Yankees, teamCode=NYY, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=10]
//			TeamEntity [teamName=奧克蘭運動家, teamNameEn=Oakland Athletics, teamCode=OA, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=11]
//			TeamEntity [teamName=西雅圖水手, teamNameEn=Seattle Mariners, teamCode=SM, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=12]
//			TeamEntity [teamName=坦帕灣光芒, teamNameEn=Tampa Bay Rays, teamCode=TBR, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=13]
//			TeamEntity [teamName=德州遊騎兵, teamNameEn=Texas Rangers, teamCode=TR, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=14]
//			TeamEntity [teamName=多倫多藍鳥, teamNameEn=Toronto Blue Jays, teamCode=TBJ, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=15]
//			TeamEntity [teamName=亞歷桑那響尾蛇, teamNameEn=Arizona Diamondbacks, teamCode=AD, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=16]
//			TeamEntity [teamName=亞特蘭大勇士, teamNameEn=Atlanta Braves, teamCode=AB, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=17]
//			TeamEntity [teamName=芝加哥小熊, teamNameEn=Chicago Cubs, teamCode=CC, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=18]
//			TeamEntity [teamName=辛辛那堤紅人, teamNameEn=Cincinnati Reds, teamCode=CRE, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=19]
//			TeamEntity [teamName=科羅拉多落磯, teamNameEn=Colorado Rockies, teamCode=CRO, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=20]
//			TeamEntity [teamName=洛杉磯道奇, teamNameEn=Los Angeles Dodgers, teamCode=LAD, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=21]
//			TeamEntity [teamName=邁阿密馬林魚, teamNameEn=Miami Marlins, teamCode=MM, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=22]
//			TeamEntity [teamName=密爾瓦基釀酒人, teamNameEn=Milwaukee Brewers, teamCode=MB, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=23]
//			TeamEntity [teamName=紐約大都會, teamNameEn=New York Mets, teamCode=NYM, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=24]
//			TeamEntity [teamName=費城費城人, teamNameEn=Philadelphia Phillies, teamCode=PPH, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=25]
//			TeamEntity [teamName=匹茲堡海盜, teamNameEn=Pittsburgh Pirates, teamCode=PPI, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=26]
//			TeamEntity [teamName=聖地牙哥教士, teamNameEn=San Diego Padres, teamCode=SDP, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=27]
//			TeamEntity [teamName=舊金山巨人, teamNameEn=San Francisco Giants, teamCode=SFG, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=28]
//			TeamEntity [teamName=聖路易紅雀, teamNameEn=St. Louis Cardinals, teamCode=SLC, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=29]
//			TeamEntity [teamName=華盛頓國民, teamNameEn=Washington Nationals, teamCode=WN, leagueName=美國職棒, leagueNameEn=Major League Baseball, leagueCode=MLB, ballType=Baseball, id=30]
//			TeamEntity [teamName=中信兄弟, teamNameEn=Brother Elephants, teamCode=BE, leagueName=中華職棒, leagueNameEn=Chinese Professional Baseball League, leagueCode=CPBL, ballType=Baseball, id=31]
//			TeamEntity [teamName=統一獅, teamNameEn=Uni-President 7-Eleven Lions, teamCode=UP7L, leagueName=中華職棒, leagueNameEn=Chinese Professional Baseball League, leagueCode=CPBL, ballType=Baseball, id=32]
//			TeamEntity [teamName=Lamigo桃猿, teamNameEn=Lamigo Monkeys, teamCode=LM, leagueName=中華職棒, leagueNameEn=Chinese Professional Baseball League, leagueCode=CPBL, ballType=Baseball, id=33]
//			TeamEntity [teamName=義大犀牛, teamNameEn=EDA Rhinos, teamCode=EDAR, leagueName=中華職棒, leagueNameEn=Chinese Professional Baseball League, leagueCode=CPBL, ballType=Baseball, id=34]
//			TeamEntity [teamName=讀賣巨人, teamNameEn=Yomiuri Giants, teamCode=YG, leagueName=中央聯盟, leagueNameEn=Central League, leagueCode=CL, ballType=Baseball, id=35]
//			TeamEntity [teamName=阪神虎, teamNameEn=Hanshin Tigers, teamCode=HT, leagueName=中央聯盟, leagueNameEn=Central League, leagueCode=CL, ballType=Baseball, id=36]
//			TeamEntity [teamName=中日龍, teamNameEn=Chunichi Dragons, teamCode=CD, leagueName=中央聯盟, leagueNameEn=Central League, leagueCode=CL, ballType=Baseball, id=37]
//			TeamEntity [teamName=廣島東洋鯉魚, teamNameEn=Hiroshima Toyo Carp, teamCode=HTC, leagueName=中央聯盟, leagueNameEn=Central League, leagueCode=CL, ballType=Baseball, id=38]
//			TeamEntity [teamName=橫濱海灣之星, teamNameEn=Yokohama DeNA BayStars, teamCode=YDB, leagueName=中央聯盟, leagueNameEn=Central League, leagueCode=CL, ballType=Baseball, id=39]
//			TeamEntity [teamName=養樂多燕子, teamNameEn=Tokyo Yakult Swallows, teamCode=TYS, leagueName=中央聯盟, leagueNameEn=Central League, leagueCode=CL, ballType=Baseball, id=40]
//			TeamEntity [teamName=埼玉西武獅, teamNameEn=Saitama Seibu Lions, teamCode=SSL, leagueName=太平洋聯盟, leagueNameEn=Pacific League, leagueCode=PL, ballType=Baseball, id=41]
//			TeamEntity [teamName=北海道日本火腿鬥士, teamNameEn=Hokkaido Nippon-ham Fighters, teamCode=HNF, leagueName=太平洋聯盟, leagueNameEn=Pacific League, leagueCode=PL, ballType=Baseball, id=42]
//			TeamEntity [teamName=東北樂天金鷲, teamNameEn=Tohoku Rakuten Golden Eagles, teamCode=TRGE, leagueName=太平洋聯盟, leagueNameEn=Pacific League, leagueCode=PL, ballType=Baseball, id=43]
//			TeamEntity [teamName=福岡軟體銀行鷹, teamNameEn=Fukuoka SoftBank Hawks, teamCode=FSH, leagueName=太平洋聯盟, leagueNameEn=Pacific League, leagueCode=PL, ballType=Baseball, id=44]
//			TeamEntity [teamName=千葉羅德海洋, teamNameEn=Chiba Lotte Marines, teamCode=CLM, leagueName=太平洋聯盟, leagueNameEn=Pacific League, leagueCode=PL, ballType=Baseball, id=45]
//			TeamEntity [teamName=斗山熊, teamNameEn=Doosan Bears, teamCode=DB, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=46]
//			TeamEntity [teamName=LG雙子, teamNameEn=LG Twins, teamCode=LGT, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=47]
//			TeamEntity [teamName=首爾英雄, teamNameEn=Nexen Heroes, teamCode=NH, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=48]
//			TeamEntity [teamName=SK飛龍, teamNameEn=SK Wyverns, teamCode=SKW, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=49]
//			TeamEntity [teamName=NC恐龍, teamNameEn=NC Dinos, teamCode=NCD, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=50]
//			TeamEntity [teamName=三星獅, teamNameEn=Samsung Lions, teamCode=SL, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=51]
//			TeamEntity [teamName=樂天巨人, teamNameEn=Lotte Giants, teamCode=LG, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=52]
//			TeamEntity [teamName=韓華老鷹, teamNameEn=Hanwha Eagles, teamCode=HE, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=53]
//			TeamEntity [teamName=起亞老虎, teamNameEn=Kia Tigers, teamCode=KT, leagueName=韓國職棒, leagueNameEn=Korea Baseball Organization, leagueCode=KBO, ballType=Baseball, id=54]
//			TeamEntity [teamName=波士頓塞爾提克, teamNameEn=Boston Celtics, teamCode=BC, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=55]
//			TeamEntity [teamName=布魯克林籃網, teamNameEn=Brooklyn Nets, teamCode=BN, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=56]
//			TeamEntity [teamName=紐約尼克, teamNameEn=New York Knicks, teamCode=NYK, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=57]
//			TeamEntity [teamName=費城76人, teamNameEn=Philadelphia 76ers, teamCode=P76, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=58]
//			TeamEntity [teamName=多倫多暴龍, teamNameEn=Toronto Raptors, teamCode=TR, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=59]
//			TeamEntity [teamName=芝加哥公牛, teamNameEn=Chicago Bulls, teamCode=CB, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=60]
//			TeamEntity [teamName=克里夫蘭騎士, teamNameEn=Cleveland Cavaliers, teamCode=CC, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=61]
//			TeamEntity [teamName=底特律活塞, teamNameEn=Detroit Pistons, teamCode=DP, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=62]
//			TeamEntity [teamName=印第安納溜馬, teamNameEn=Indiana Pacers, teamCode=IP, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=63]
//			TeamEntity [teamName=密爾瓦基公鹿, teamNameEn=Milwaukee Bucks, teamCode=MB, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=64]
//			TeamEntity [teamName=亞特蘭大老鷹, teamNameEn=Atlanta Hawks, teamCode=AH, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=65]
//			TeamEntity [teamName=夏洛特黃蜂, teamNameEn=Charlotte Hornets, teamCode=CH, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=66]
//			TeamEntity [teamName=邁阿密熱火, teamNameEn=Miami Heat, teamCode=MH, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=67]
//			TeamEntity [teamName=奧蘭多魔術, teamNameEn=Orlando Magic, teamCode=OM, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=68]
//			TeamEntity [teamName=華盛頓巫師, teamNameEn=Washington Wizards, teamCode=WW, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=69]
//			TeamEntity [teamName=達拉斯小牛, teamNameEn=Dallas Mavericks, teamCode=DM, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=70]
//			TeamEntity [teamName=休士頓火箭, teamNameEn=Houston Rockets, teamCode=HR, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=71]
//			TeamEntity [teamName=孟菲斯灰熊, teamNameEn=Memphis Grizzlies, teamCode=MG, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=72]
//			TeamEntity [teamName=紐奧良鵜鶘, teamNameEn=New Orleans Pelicans, teamCode=MOP, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=73]
//			TeamEntity [teamName=聖安東尼奧馬刺, teamNameEn=San Antonio Spurs, teamCode=SAS, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=74]
//			TeamEntity [teamName=丹佛掘金, teamNameEn=Denver Nuggets, teamCode=DN, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=75]
//			TeamEntity [teamName=明尼蘇達灰狼, teamNameEn=Minnesota Timberwolves, teamCode=MT, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=76]
//			TeamEntity [teamName=俄克拉何馬城雷霆, teamNameEn=Oklahoma City Thunder, teamCode=OCT, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=77]
//			TeamEntity [teamName=波特蘭拓荒者, teamNameEn=Portland Trail Blazers, teamCode=RTB, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=78]
//			TeamEntity [teamName=猶他爵士, teamNameEn=Utah Jazz, teamCode=UJ, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=79]
//			TeamEntity [teamName=金州勇士, teamNameEn=Golden State Warriors, teamCode=GSW, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=80]
//			TeamEntity [teamName=洛杉磯快船, teamNameEn=Los Angeles Clippers, teamCode=LAC, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=81]
//			TeamEntity [teamName=洛杉磯湖人, teamNameEn=Los Angeles Lakers, teamCode=LAL, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=82]
//			TeamEntity [teamName=菲尼克斯太陽, teamNameEn=Phoenix Suns, teamCode=PS, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=83]
//			TeamEntity [teamName=沙加緬度國王, teamNameEn=Sacramento Kings, teamCode=SK, leagueName=全美籃球協會, leagueNameEn=National Basketball Association, leagueCode=NBA, ballType=Basketball, id=84]
//			the size of all: 84
	}


}
