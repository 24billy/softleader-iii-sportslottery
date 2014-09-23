package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

@Entity
@Table(name = "TEAM")
public class TeamEntity extends GenericEntity {
	private static final long serialVersionUID = 2014L;
	
	@Column(name = "TEAM_NAME", length = 50, nullable = false, unique = true)
	private String teamName;
	
	@Column(name = "TEAM_NAME_EN", length = 50, nullable = false, unique = true)
	private String teamNameEn;
	
	@Column(name="LEAGUE_NAME", length=50, nullable = false)
	private String leagueName;
	
	@Column(name="LEAGUE_NAME_EN", length=50, nullable = false)
	private String leagueNameEn;

	@Column(name="BALL_TYPE", length=10, nullable = false)
	private String ballType;

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getTeamNameEn() {
		return teamNameEn;
	}

	public void setTeamNameEn(String teamNameEn) {
		this.teamNameEn = teamNameEn;
	}

	public String getLeagueName() {
		return leagueName;
	}

	public void setLeagueName(String leagueName) {
		this.leagueName = leagueName;
	}

	public String getLeagueNameEn() {
		return leagueNameEn;
	}

	public void setLeagueNameEn(String leagueNameEn) {
		this.leagueNameEn = leagueNameEn;
	}

	public String getBallType() {
		return ballType;
	}

	public void setBallType(String ballType) {
		this.ballType = ballType;
	}

	@Override
	public String toString() {
		return "TeamEntity [teamName=" + teamName + ", teamNameEn="
				+ teamNameEn + ", leagueName=" + leagueName + ", leagueNameEn="
				+ leagueNameEn + ", ballType=" + ballType + ", id=" + id + "]";
	}
	
}
