package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDateTime;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;
/**
 * 
 * @author nick
 *
 */
/*
GAME_TIME
TEAM_HOME
TEAM_AWAY
GAME_SCORE_HOME
GAME_SCORE_AWAY
LEAGUE_NAME
BALL_TYPE
*/

@Entity
@Table(name="GAME")
public class GameEntity extends GenericEntity{
//
//	@Column(name="GAME_TIME")
//	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDateTime")
//	private LocalDateTime gameTime;
//	
//	@Column(name="TEAM_HOME")
//	private Long teamHome;
//	
//	@Column(name="TEAM_AWAY")
//	private Long teamAway;
//	
//	@Column(name="GAME_SCORE_HOME")
//	private Long teamAway;
	
	
}
