package tw.com.softleader.sportslottery.setting.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDateTime;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

@Entity
@Table(name="GAME")
public class GameEntity extends GenericEntity {
	
	private static final long serialVersionUID = 2014L;

	@Column(name="GAME_TIME", nullable = false)
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	private LocalDateTime gameTime;
	
	@Column(name="GAME_NUM", unique = true)
	private Long gameNum;
	
	@ManyToOne
	@JoinColumn(name="TEAM_HOME", nullable = false)
	private TeamEntity teamHome;
	
	@ManyToOne	
	@JoinColumn(name="TEAM_AWAY", nullable = false)
	private TeamEntity teamAway;
	
	@Column(name="GAME_SCORE_HOME", columnDefinition="BIGINT default 0")
	private Long gameScoreHome;
	
	@Column(name="GAME_SCORE_AWAY", columnDefinition="BIGINT default 0")
	private Long gameScoreAway;
	
	@Column(name="LEAGUE_NAME", length=50, nullable = false)
	private String leagueName;
	
	@Column(name="BALL_TYPE", length=10, nullable = false)
	private String ballType;
	
	@Column(name="IS_END", columnDefinition="BOOLEAN default FALSE")
	private Boolean isEnd;
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy = "gameId", cascade = {CascadeType.ALL})
	private Set<OddsEntity> odds;

	public Set<OddsEntity> getOdds() {
		return odds;
	}

	public void setOdds(Set<OddsEntity> odds) {
		this.odds = odds;
	}

	public Boolean getIsEnd() {
		return isEnd;
	}

	public void setIsEnd(Boolean isEnd) {
		this.isEnd = isEnd;
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

	@Override
	public String toString() {
		return "GameEntity [gameTime=" + gameTime + ", gameNum=" + gameNum
				+ ", teamHome=" + teamHome + ", teamAway=" + teamAway
				+ ", gameScoreHome=" + gameScoreHome + ", gameScoreAway="
				+ gameScoreAway + ", leagueName=" + leagueName + ", ballType="
				+ ballType + ", isEnd=" + isEnd + ", odds=" + odds + ", id="
				+ id + "]";
	}

}
