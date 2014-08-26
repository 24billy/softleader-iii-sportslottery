insert into team (TEAM_NAME) values ('巴爾的摩金鶯');
insert into team (TEAM_NAME) values ('波士頓紅襪');
insert into team (TEAM_NAME) values ('紐約洋基');
insert into team (TEAM_NAME) values ('坦帕灣光芒');
insert into team (TEAM_NAME) values ('多倫多藍鳥');
insert into team (TEAM_NAME) values ('芝加哥白襪');
insert into team (TEAM_NAME) values ('克里夫蘭印地安人');
insert into team (TEAM_NAME) values ('底特律老虎');
insert into team (TEAM_NAME) values ('堪薩斯市皇家');
insert into team (TEAM_NAME) values ('明尼蘇達雙城');
insert into team (TEAM_NAME) values ('休士頓太空人');
insert into team (TEAM_NAME) values ('洛杉磯安那罕天使');
insert into team (TEAM_NAME) values ('奧克蘭運動家');
insert into team (TEAM_NAME) values ('西雅圖水手');
insert into team (TEAM_NAME) values ('德州遊騎兵');
insert into team (TEAM_NAME) values ('亞特蘭大勇士');
insert into team (TEAM_NAME) values ('匹茲堡海盜');
insert into team (TEAM_NAME) values ('亞歷桑那響尾蛇');
insert into team (TEAM_NAME) values ('華盛頓國民');
insert into team (TEAM_NAME) values ('聖地牙哥教士');
insert into team (TEAM_NAME) values ('洛杉磯道奇');
insert into team (TEAM_NAME) values ('樂天金鷹');
insert into team (TEAM_NAME) values ('日本火腿鬥士');
insert into team (TEAM_NAME) values ('中日龍');
insert into team (TEAM_NAME) values ('阪神虎');
insert into team (TEAM_NAME) values ('廣島東洋鯉魚');
insert into team (TEAM_NAME) values ('紐約大都會');
insert into team (TEAM_NAME) values ('橫濱海灣之星');
insert into team (TEAM_NAME) values ('西武獅');
insert into team (TEAM_NAME) values ('軟體銀行鷹');
insert into team (TEAM_NAME) values ('歐力士猛牛');
insert into team (TEAM_NAME) values ('羅德海洋');
insert into team (TEAM_NAME) values ('密爾瓦基釀酒人');
insert into team (TEAM_NAME) values ('巴爾地摩金鶯');
insert into team (TEAM_NAME) values ('LG雙子');
insert into team (TEAM_NAME) values ('斗山熊');
insert into team (TEAM_NAME) values ('SK飛龍');
insert into team (TEAM_NAME) values ('三星獅');
insert into team (TEAM_NAME) values ('起亞老虎');
insert into team (TEAM_NAME) values ('Lamigo桃猿');
insert into team (TEAM_NAME) values ('中信兄弟象');
insert into team (TEAM_NAME) values ('費城費城人');
insert into team (TEAM_NAME) values ('耐克森英雄');



insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE,TEAM_HOME,TEAM_AWAY) values ('2014-08-08T10:50:20', 100,2,3,'MLB','Baseball', 1, 2);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE,TEAM_HOME,TEAM_AWAY) values ('2014-08-08T10:50:20', 101,10,1,'MLB','Baseball', 2, 3);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE,TEAM_HOME,TEAM_AWAY) values ('2014-08-08T10:50:20', 102,0,9,'MLB','Baseball', 1, 3);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE,TEAM_HOME,TEAM_AWAY) values ('2014-08-08T10:50:20', 103,0,9,'MLB','Baseball', 1, 3);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE,TEAM_HOME,TEAM_AWAY) values ('2014-08-09T10:50:20', 104,0,9,'MLB','Baseball', 1, 3);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE,TEAM_HOME,TEAM_AWAY) values ('2014-08-10T10:50:20', 105,0,9,'MLB','Baseball', 1, 3);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE,TEAM_HOME,TEAM_AWAY) values ('2014-08-11T10:50:20', 106,0,9,'MLB','Baseball', 1, 3);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE,TEAM_HOME,TEAM_AWAY) values ('2014-08-12T10:50:20', 107,0,9,'MLB','Baseball', 1, 3);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE,TEAM_HOME,TEAM_AWAY) values ('2014-08-19T07:05:00', 118,0,0,'MLB','Baseball', 11, 3);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE,TEAM_HOME,TEAM_AWAY) values ('2014-08-19T07:05:00', 117,0,0,'MLB','Baseball', 17, 16);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE,TEAM_HOME,TEAM_AWAY, IS_END) values ('2014-08-19T07:05:00', 119,0,0,'MLB','Baseball', 19, 18, true);

insert into USERN (USER_ACCOUNT,USER_PASSWORD,USER_NAME,USER_BIRTHDAY,USER_GENDER,USER_PHONE,USER_EMAIL) values ('jackychen','a123456','王大蠻','2014-02-28','male','0910123456','wang@gmail.com');

insert into USERN (USER_ACCOUNT,USER_PASSWORD,USER_NAME,USER_BIRTHDAY,USER_GENDER,USER_PHONE,USER_EMAIL,CREATE_TIME,CREATOR,MODIFIED_TIME,MODIFIER) values ('chen','123','王小蠻','2012-02-29','male','0910123455','wanglittle@gmail.com',CURRENT_TIMESTAMP,'system',CURRENT_TIMESTAMP,'system');

insert into USERN (USER_ACCOUNT,USER_PASSWORD,USER_NAME,USER_BIRTHDAY,USER_GENDER,USER_PHONE,USER_EMAIL,CREATE_TIME,CREATOR,MODIFIED_TIME,MODIFIER) values ('wang','1234','王中蠻','2012-02-29','male','0910123455','wanglittle@gmail.com',CURRENT_TIMESTAMP,'system',CURRENT_TIMESTAMP,'system');






insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (1, 'SU_H', 0, 1.70);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (1, 'SU_A', 0, 1.25);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (1, 'ATS_A', 1.5, 1.60);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (1, 'ATS_H', -1.5, 1.90);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (1, 'SC_H', 8.5, 1.70);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (1, 'SC_L', 8.5, 1.80);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (1, 'ODD', 0, 1.50);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (1, 'EVEN', 0, 2.05);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (2, 'SU_H', 0, 1.85);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (2, 'SU_A', 0, 1.65);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (2, 'ATS_A', 1.5, 1.60);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (2, 'ATS_H', -1.5, 1.90);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (2, 'SC_H', 8.5, 1.70);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (2, 'SC_L', 8.5, 1.80);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (2, 'ODD', 0, 1.50);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (2, 'EVEN', 0, 2.05);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (3, 'SU_H', 0, 1.70);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (3, 'SU_A', 0, 1.60);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (3, 'ATS_A', 1.5, 1.60);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (3, 'ATS_H', -1.5, 1.90);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (3, 'SC_H', 8.5, 1.70);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (3, 'SC_L', 8.5, 1.80);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (3, 'ODD', 0, 1.50);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (3, 'EVEN', 0, 2.05);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (4, 'SU_H', 0, 1.20);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (4, 'SU_A', 0, 2.10);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (4, 'ATS_A', 1.5, 1.60);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (4, 'ATS_H', -1.5, 1.90);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (4, 'SC_H', 8.5, 1.70);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (4, 'SC_L', 8.5, 1.80);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (4, 'ODD', 0, 1.50);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (4, 'EVEN', 0, 2.05);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (5, 'SU_H', 0, 1.85);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (5, 'SU_A', 0, 1.35);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (5, 'ATS_A', 1.5, 1.60);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (5, 'ATS_H', -1.5, 1.90);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (5, 'SC_H', 8.5, 1.70);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (5, 'SC_L', 8.5, 1.80);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (5, 'ODD', 0, 1.50);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (5, 'EVEN', 0, 2.05);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (6, 'SU_H', 0, 1.75);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (6, 'SU_A', 0, 1.75);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (6, 'ATS_A', 1.5, 1.60);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (6, 'ATS_H', -1.5, 1.90);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (6, 'SC_H', 8.5, 1.70);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (6, 'SC_L', 8.5, 1.80);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (6, 'ODD', 0, 1.50);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (6, 'EVEN', 0, 2.05);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (7, 'SU_H', 0, 1.95);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (7, 'SU_A', 0, 1.45);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (7, 'ATS_A', 1.5, 1.60);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (7, 'ATS_H', -1.5, 1.90);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (7, 'SC_H', 8.5, 1.70);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (7, 'SC_L', 8.5, 1.80);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (7, 'ODD', 0, 1.50);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (7, 'EVEN', 0, 2.05);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (8, 'SU_H', 0, 1.25);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (8, 'SU_A', 0, 2.15);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (8, 'ATS_A', 1.5, 1.60);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (8, 'ATS_H', -1.5, 1.90);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (8, 'SC_H', 8.5, 1.70);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (8, 'SC_L', 8.5, 1.80);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (8, 'ODD', 0, 1.50);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (8, 'EVEN', 0, 2.05);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (9, 'SU_A', 0, 2.15);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (9, 'SU_H', 0, 1.45);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (9, 'ATS_A', 1.5, 1.60);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (9, 'ATS_H', -1.5, 1.90);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (9, 'SC_H', 8.5, 1.70);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (9, 'SC_L', 8.5, 1.80);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (9, 'ODD', 0, 1.50);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (9, 'EVEN', 0, 2.05);


insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (10, 'SU_A', 0, 2.15);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (10, 'SU_H', 0, 1.45);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (10, 'ATS_A', 1.5, 1.60);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (10, 'ATS_H', -1.5, 1.90);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (10, 'SC_H', 7.5, 1.85);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (10, 'SC_L', 7.5, 1.65);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (10, 'ODD', 0, 1.50);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (10, 'EVEN', 0, 2.05);

insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (11, 'SU_A', 0, 2.85);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (11, 'SU_H', 0, 1.25);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (11, 'ATS_A', 1.5, 1.95);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (11, 'ATS_H', -1.5, 1.55);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (11, 'SC_H', 6.5, 1.60);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (11, 'SC_L', 6.5, 1.90);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (11, 'ODD', 0, 1.50);
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE) values (11, 'EVEN', 0, 2.05);


insert into lottery (USER_ID, ODDS_ID_1, ODDS_ID_2, ODDS_ID_3, ODDS_ID_4, ODDS_ID_5, ODDS_ID_6, ODDS_ID_7, ODDS_ID_8, CONFIRM_TIME) values (1,1,2,3,3,4,null,null,null,'2014-08-08T10:50:20');
insert into lottery (USER_ID, ODDS_ID_1, ODDS_ID_2, ODDS_ID_3, ODDS_ID_4, ODDS_ID_5, ODDS_ID_6, ODDS_ID_7, ODDS_ID_8, CONFIRM_TIME) values (1,3,1,3,4,5,null,null,null,'2014-08-09T10:50:20');
insert into lottery (USER_ID, ODDS_ID_1, ODDS_ID_2, ODDS_ID_3, ODDS_ID_4, ODDS_ID_5, ODDS_ID_6, ODDS_ID_7, ODDS_ID_8, CONFIRM_TIME) values (1,2,3,1,6,7,null,null,null,'2014-08-10T10:50:20');