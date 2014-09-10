package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDateTime;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

@Entity
@Table(name = "ANNOUNCE")
public class AnnounceEntity extends GenericEntity {

	private static final long serialVersionUID = 2014L;
	
	@Column(name = "ANNOUNCE_TITLE")
	private String announceTitle;
	
	@Column(name = "ANNOUNCE_CONTENT")
	private String announceContent;
	
	@Column(name = "ANNOUNCE_TIME")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	private LocalDateTime announceTime;
	
	@Column(name = "MODIFIED_TIME")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	private LocalDateTime modifiedTime;

	@Override
	public String toString() {
		return "AnnounceEntity [announceTitle=" + announceTitle
				+ ", announceContent=" + announceContent + ", announceTime="
				+ announceTime + ", modifiedTime=" + modifiedTime + ", id="
				+ id + "]";
	}

	public String getAnnounceTitle() {
		return announceTitle;
	}

	public void setAnnounceTitle(String announceTitle) {
		this.announceTitle = announceTitle;
	}

	public String getAnnounceContent() {
		return announceContent;
	}

	public void setAnnounceContent(String announceContent) {
		this.announceContent = announceContent;
	}

	public LocalDateTime getAnnounceTime() {
		return announceTime;
	}

	public void setAnnounceTime(LocalDateTime announceTime) {
		this.announceTime = announceTime;
	}

	public LocalDateTime getModifiedTime() {
		return modifiedTime;
	}

	public void setModifiedTime(LocalDateTime modifiedTime) {
		this.modifiedTime = modifiedTime;
	}

}
