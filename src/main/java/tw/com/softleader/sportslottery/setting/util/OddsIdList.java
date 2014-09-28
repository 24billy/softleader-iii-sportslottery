package tw.com.softleader.sportslottery.setting.util;

import java.io.Serializable;

public class OddsIdList implements Serializable{
	
	private static final long serialVersionUID = 2014L;
	
	private Long oddId1;
	private Long oddId2;
	private Long oddId3;
	private Long oddId4;
	private Long oddId5;
	private Long oddId6;
	private Long oddId7;
	private Long oddId8;
	
	public OddsIdList(){
		
	}

	public Long getOddId1() {
		return oddId1;
	}

	public void setOddId1(Long oddId1) {
		this.oddId1 = oddId1;
	}

	public Long getOddId2() {
		return oddId2;
	}

	public void setOddId2(Long oddId2) {
		this.oddId2 = oddId2;
	}

	public Long getOddId3() {
		return oddId3;
	}

	public void setOddId3(Long oddId3) {
		this.oddId3 = oddId3;
	}

	public Long getOddId4() {
		return oddId4;
	}

	public void setOddId4(Long oddId4) {
		this.oddId4 = oddId4;
	}

	public Long getOddId5() {
		return oddId5;
	}

	public void setOddId5(Long oddId5) {
		this.oddId5 = oddId5;
	}

	public Long getOddId6() {
		return oddId6;
	}

	public void setOddId6(Long oddId6) {
		this.oddId6 = oddId6;
	}

	public Long getOddId7() {
		return oddId7;
	}

	public void setOddId7(Long oddId7) {
		this.oddId7 = oddId7;
	}

	public Long getOddId8() {
		return oddId8;
	}

	public void setOddId8(Long oddId8) {
		this.oddId8 = oddId8;
	}

	@Override
	public String toString() {
		return "OddsIdList [oddId1=" + oddId1 + ", oddId2=" + oddId2
				+ ", oddId3=" + oddId3 + ", oddId4=" + oddId4 + ", oddId5="
				+ oddId5 + ", oddId6=" + oddId6 + ", oddId7=" + oddId7
				+ ", oddId8=" + oddId8 + "]";
	}
	
	
}
