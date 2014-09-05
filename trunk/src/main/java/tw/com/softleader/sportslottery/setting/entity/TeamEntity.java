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
	
	@Column(name="LEAGUE_NAME", length=50, nullable = false)
	private String leagueName;

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getLeagueName() {
		return leagueName;
	}

	public void setLeagueName(String leagueName) {
		this.leagueName = leagueName;
	}

	@Override
	public String toString() {
		return "TeamEntity [teamName=" + teamName + ", leagueName="
				+ leagueName + ", id=" + id + "]";
	}

}
