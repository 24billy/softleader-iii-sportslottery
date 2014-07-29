package tw.com.softleader.sportslottery.common.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDateTime;

@MappedSuperclass
public abstract class GenericEntity implements Serializable {
	
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	protected Long id;
	
	@Column(name="CREATE_TIME")
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	protected LocalDateTime createTime;
	
	@Column(name="CREATOR")
	protected String creator;
	
	@Column(name="MODIFIED_TIME")
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	protected LocalDateTime modifiedTime;
	
	@Column(name="MODIFIER")
	protected String modifier;

	@Override
	public String toString() {
		return "GenericEntity [id=" + id + ", createTime=" + createTime
				+ ", creator=" + creator + ", modifiedTime=" + modifiedTime
				+ ", modifier=" + modifier + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDateTime getCreateTime() {
		return createTime;
	}

	public void setCreateTime(LocalDateTime createTime) {
		this.createTime = createTime;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public LocalDateTime getModifiedTime() {
		return modifiedTime;
	}

	public void setModifiedTime(LocalDateTime modifiedTime) {
		this.modifiedTime = modifiedTime;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}
	
	
	
	
	
	
	
}
