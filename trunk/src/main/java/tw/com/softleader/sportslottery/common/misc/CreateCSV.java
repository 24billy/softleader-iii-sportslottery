package tw.com.softleader.sportslottery.common.misc;

public class CreateCSV {

	public static void main(String[] args) {
		
		//AnnounceLog Table
		System.out.println("profit, entered_time");
		for (int i = 1; i <= 100; i++) {
			int profit = (int) (Math.random() * 200000 - 20000);
			System.out.print(profit + ", ");
			
			int m = (int) (Math.random() * 12 + 1);
			int d = (int) (Math.random() * 28 + 1);
			int h = (int) (Math.random() * 23 + 1);
			int M = (int) (Math.random() * 59 + 1);
			int s = (int) (Math.random() * 59 + 1);
			System.out.printf("2014-%d-%dT%d:%d:%d", m, d, h, M, s);
			System.out.println();
		}
	}
}
