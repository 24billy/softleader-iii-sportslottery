package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

/**
 * @Author:Rhys
 */

@Entity
@Table(name = "TEAM")
public class TeamEntity extends GenericEntity {
	//隊伍名稱唯一
	@Column(name = "TEAM_NAME", length = 50, nullable=false, unique = true)
	private String teamName;
	
	@Column(name = "COUNTRY", length = 50, nullable=false)
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
