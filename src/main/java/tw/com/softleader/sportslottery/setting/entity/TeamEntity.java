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
	
	@Column(name = "COUNTRY", length = 50, nullable = false)
	private String country;

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	@Override
	public String toString() {
		return "TeamEntity [teamName=" + teamName + ", country=" + country
				+ ", id=" + id + "]";
	}

}
