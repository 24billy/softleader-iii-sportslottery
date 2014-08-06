package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDateTime;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;
/**
 * 
 * @author nick
 *
 */
@Entity
@Table(name="GAME")
public class GameEntity extends GenericEntity{

	@Column(name="GAME_TIME")
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	private LocalDateTime gameTime;
	
	@Column(name="GAME_NUM")
	private Long gameNum;
	
	@ManyToOne
	@JoinColumn(name="TEAM_HOME")
	private TeamEntity teamHome;
	
	@ManyToOne	
	@JoinColumn(name="TEAM_AWAY")
	private TeamEntity teamAway;
	
	@Column(name="GAME_SCORE_HOME")
	private Long gameScoreHome;
	
	@Column(name="GAME_SCORE_AWAY")
	private Long gameScoreAway;
	
	@Column(name="LEAGUE_NAME", length=50)
	private String leagueName;
	
	@Column(name="BALL_TYPE", length=10)
	private String ballType;

	@Override
	public String toString() {
		return "GameEntity [gameTime=" + gameTime + ", gameNum=" + gameNum
				+ ", teamHome=" + teamHome + ", teamAway=" + teamAway
				+ ", gameScoreHome=" + gameScoreHome + ", gameScoreAway="
				+ gameScoreAway + ", leagueName=" + leagueName + ", ballType="
				+ ballType + ", id=" + id + ", createTime=" + createTime
				+ ", creator=" + creator + ", modifiedTime=" + modifiedTime
				+ ", modifier=" + modifier + "]";
	}

	public LocalDateTime getGameTime() {
		return gameTime;
	}

	public void setGameTime(LocalDateTime gameTime) {
		this.gameTime = gameTime;
	}

	public Long getGameNum() {
		return gameNum;
	}

	public void setGameNum(Long gameNum) {
		this.gameNum = gameNum;
	}

	public TeamEntity getTeamHome() {
		return teamHome;
	}

	public void setTeamHome(TeamEntity teamHome) {
		this.teamHome = teamHome;
	}

	public TeamEntity getTeamAway() {
		return teamAway;
	}

	public void setTeamAway(TeamEntity teamAway) {
		this.teamAway = teamAway;
	}

	public Long getGameScoreHome() {
		return gameScoreHome;
	}

	public void setGameScoreHome(Long gameScoreHome) {
		this.gameScoreHome = gameScoreHome;
	}

	public Long getGameScoreAway() {
		return gameScoreAway;
	}

	public void setGameScoreAway(Long gameScoreAway) {
		this.gameScoreAway = gameScoreAway;
	}

	public String getLeagueName() {
		return leagueName;
	}

	public void setLeagueName(String leagueName) {
		this.leagueName = leagueName;
	}

	public String getBallType() {
		return ballType;
	}

	public void setBallType(String ballType) {
		this.ballType = ballType;
	}

}
