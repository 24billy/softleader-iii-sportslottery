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

	@Column(name = "TEAM_NAME", length = 50)
	private String teamNmae;

	public String getTeamNmae() {
		return teamNmae;
	}

	public void setTeamNmae(String teamNmae) {
		this.teamNmae = teamNmae;
	}

	@Override
	public String toString() {
		return "teamEntity [teamNmae=" + teamNmae + ", id=" + id
				+ ", createTime=" + createTime + ", creator=" + creator
				+ ", modifiedTime=" + modifiedTime + ", modifier=" + modifier
				+ "]";
	}
	
}
