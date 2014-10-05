package tw.com.softleader.sportslottery.common.misc;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

public class CreateCSV {

	public static void main(String[] args) throws Exception {
		CreateCSV csv = new CreateCSV();
		//csv.generateAdminLog();
		csv.generateUser();
	}
	
	public Boolean generateAdminLog() {
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
		return true;
	}
	
	public Boolean generateUser() throws Exception {
		String file = "C:/Java/names_zh.txt";
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8));
		String data = br.readLine();
		System.out.println("user_account,user_password,user_name,user_card_id,user_birthday,user_address,user_email,user_bank_account,user_phone,coins,user_state");
		while (data != null) {
			StringBuffer userAccount = new StringBuffer();
			Integer accountLength = (int) (Math.random() * 7 + 6);
			for (int i = 0; i < accountLength; i++) {
				Character word = (char) ((int) (Math.random() * 26 + 97));
				userAccount.append(word);
			}
			String[] split = data.split(", ");
			String userName = split[0];
			String userCardId = split[1];
			data = br.readLine();
			System.out.printf("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s", 
					userAccount.toString(),
					"a123456",
					userName,
					userCardId,
					"1988-11-11",
					"Taipei",
					userAccount.toString() + "@gmail.com",
					"1234-5678-1111",
					"0912345678",
					"1000",
					"0");
			System.out.println();
		}
		br.close();
		return true;
	}
}
