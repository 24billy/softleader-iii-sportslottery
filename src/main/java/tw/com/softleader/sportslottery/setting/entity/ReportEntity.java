package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDateTime;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

@Entity
@Table(name = "REPORT")
public class ReportEntity extends GenericEntity {

	private static final long serialVersionUID = 2014L;
	
	@Column(name = "TITLE")
	private String title;
	
	@Column(name = "QUESTION")
	private String question;
	
	@Column(name = "ASNWER")
	private String answer;
	
	@Column(name = "QUESTION_TIME")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	private LocalDateTime questionTime;
	
	@Column(name = "ANSWER_TIME")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	private LocalDateTime answerTime;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public LocalDateTime getQuestionTime() {
		return questionTime;
	}

	public void setQuestionTime(LocalDateTime questionTime) {
		this.questionTime = questionTime;
	}

	public LocalDateTime getAnswerTime() {
		return answerTime;
	}

	public void setAnswerTime(LocalDateTime answerTime) {
		this.answerTime = answerTime;
	}

	@Override
	public String toString() {
		return "ReportEntity [title=" + title + ", question=" + question
				+ ", answer=" + answer + ", questionTime=" + questionTime
				+ ", answerTime=" + answerTime + ", id=" + id + "]";
	}
	
}
