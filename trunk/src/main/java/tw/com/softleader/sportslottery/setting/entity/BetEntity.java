package tw.com.softleader.sportslottery.setting.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

public class BetEntity extends GenericEntity {
	
	@OneToOne
	@JoinColumn(name = "GAME_ID")
	private GameEntity gameId;
	
	@Column(name = "SU_HOME_RATE", columnDefinition = "NUMERIC(8,3)")
	private BigDecimal suHomeRate;
	
	@Column(name = "SU_AWAY_RATE", columnDefinition = "NUMERIC(8,3)")
	private BigDecimal suAwayRate;
	
	@Column(name = "SU_DRAW_RATE", columnDefinition = "NUMERIC(8,3)")
	private BigDecimal suDrawRate;
	
	@Column(name = "SU_ATS_RATE", columnDefinition = "NUMERIC(8,3)")
	private BigDecimal suATSRate;
	
	@Column(name = "ATS", columnDefinition = "NUMERIC(8,3)")
	private BigDecimal ats;
	
	@Column(name = "ATS_HOME_RATE", columnDefinition = "NUMERIC(8,3)")
	private BigDecimal atsHomeRate;
	
	@Column(name = "ATS_AWAY_RATE", columnDefinition = "NUMERIC(8,3)")
	private BigDecimal atsAwayRate;
	
	@Column(name = "ATS_DRAW_RATE", columnDefinition = "NUMERIC(8,3)")
	private BigDecimal atsDrawRate;
	
	@Column(name = "SCORE", columnDefinition = "NUMERIC(8,3)")
	private BigDecimal score;
	
	@Column(name = "SCORE_HOME_RATE", columnDefinition = "NUMERIC(8,3)")
	private BigDecimal scoreHomeRate;
	
	@Column(name = "SCORE_AWAY_RATE", columnDefinition = "NUMERIC(8,3)")
	private BigDecimal scoreAwayRate;
	
	@Column(name = "SCORE_DRAW_RATE", columnDefinition = "NUMERIC(8,3)")
	private BigDecimal scoreDrawRate;
	
	@Column(name = "ODD_RATE", columnDefinition = "NUMERIC(8,3)")
	private BigDecimal oddRate;
	
	@Column(name = "EVEN_RATE", columnDefinition = "NUMERIC(8,3)")
	private BigDecimal evenRate;
	
	@Override
	public String toString() {
		return "BetEntity [suHomeRate=" + suHomeRate + ", suAwayRate="
				+ suAwayRate + ", suDrawRate=" + suDrawRate + ", suATSRate="
				+ suATSRate + ", ats=" + ats + ", atsHomeRate=" + atsHomeRate
				+ ", atsAwayRate=" + atsAwayRate + ", atsDrawRate="
				+ atsDrawRate + ", score=" + score + ", scoreHomeRate="
				+ scoreHomeRate + ", scoreAwayRate=" + scoreAwayRate
				+ ", scoreDrawRate=" + scoreDrawRate + ", oddRate=" + oddRate
				+ ", evenRate=" + evenRate + ", id=" + id + ", createTime="
				+ createTime + ", creator=" + creator + ", modifiedTime="
				+ modifiedTime + ", modifier=" + modifier + "]";
	}
	
	public BigDecimal getSuHomeRate() {
		return suHomeRate;
	}
	public void setSuHomeRate(BigDecimal suHomeRate) {
		this.suHomeRate = suHomeRate;
	}
	public BigDecimal getSuAwayRate() {
		return suAwayRate;
	}
	public void setSuAwayRate(BigDecimal suAwayRate) {
		this.suAwayRate = suAwayRate;
	}
	public BigDecimal getSuDrawRate() {
		return suDrawRate;
	}
	public void setSuDrawRate(BigDecimal suDrawRate) {
		this.suDrawRate = suDrawRate;
	}
	public BigDecimal getSuATSRate() {
		return suATSRate;
	}
	public void setSuATSRate(BigDecimal suATSRate) {
		this.suATSRate = suATSRate;
	}
	public BigDecimal getAts() {
		return ats;
	}
	public void setAts(BigDecimal ats) {
		this.ats = ats;
	}
	public BigDecimal getAtsHomeRate() {
		return atsHomeRate;
	}
	public void setAtsHomeRate(BigDecimal atsHomeRate) {
		this.atsHomeRate = atsHomeRate;
	}
	public BigDecimal getAtsAwayRate() {
		return atsAwayRate;
	}
	public void setAtsAwayRate(BigDecimal atsAwayRate) {
		this.atsAwayRate = atsAwayRate;
	}
	public BigDecimal getAtsDrawRate() {
		return atsDrawRate;
	}
	public void setAtsDrawRate(BigDecimal atsDrawRate) {
		this.atsDrawRate = atsDrawRate;
	}
	public BigDecimal getScore() {
		return score;
	}
	public void setScore(BigDecimal score) {
		this.score = score;
	}
	public BigDecimal getScoreHomeRate() {
		return scoreHomeRate;
	}
	public void setScoreHomeRate(BigDecimal scoreHomeRate) {
		this.scoreHomeRate = scoreHomeRate;
	}
	public BigDecimal getScoreAwayRate() {
		return scoreAwayRate;
	}
	public void setScoreAwayRate(BigDecimal scoreAwayRate) {
		this.scoreAwayRate = scoreAwayRate;
	}
	public BigDecimal getScoreDrawRate() {
		return scoreDrawRate;
	}
	public void setScoreDrawRate(BigDecimal scoreDrawRate) {
		this.scoreDrawRate = scoreDrawRate;
	}
	public BigDecimal getOddRate() {
		return oddRate;
	}
	public void setOddRate(BigDecimal oddRate) {
		this.oddRate = oddRate;
	}
	public BigDecimal getEvenRate() {
		return evenRate;
	}
	public void setEvenRate(BigDecimal evenRate) {
		this.evenRate = evenRate;
	}
	
}
