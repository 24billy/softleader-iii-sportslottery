insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('巴爾的摩金鶯', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('波士頓紅襪', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('紐約洋基', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('坦帕灣光芒', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('多倫多藍鳥', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('芝加哥白襪', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('克里夫蘭印地安人', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('底特律老虎', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('堪薩斯市皇家', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('明尼蘇達雙城', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('休士頓太空人', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('洛杉磯安那罕天使', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('奧克蘭運動家', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('西雅圖水手', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('德州遊騎兵', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');

insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE, create_time, creator, modified_time, modifier,TEAM_HOME,TEAM_AWAY) values (CURRENT_TIMESTAMP, 100,2,3,'MLB','Baseball', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 1, 2);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE, create_time, creator, modified_time, modifier,TEAM_HOME,TEAM_AWAY) values (CURRENT_TIMESTAMP, 101,10,1,'MLB','Baseball', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 2, 3);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE, create_time, creator, modified_time, modifier,TEAM_HOME,TEAM_AWAY) values (CURRENT_TIMESTAMP, 102,0,9,'MLB','Baseball', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 1, 3);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE, create_time, creator, modified_time, modifier,TEAM_HOME,TEAM_AWAY) values ('2014-08-08T10:50:20', 103,0,9,'MLB','Baseball', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 1, 3);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE, create_time, creator, modified_time, modifier,TEAM_HOME,TEAM_AWAY) values ('2014-08-09T10:50:20', 104,0,9,'MLB','Baseball', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 1, 3);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE, create_time, creator, modified_time, modifier,TEAM_HOME,TEAM_AWAY) values ('2014-08-10T10:50:20', 105,0,9,'MLB','Baseball', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 1, 3);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE, create_time, creator, modified_time, modifier,TEAM_HOME,TEAM_AWAY) values ('2014-08-11T10:50:20', 106,0,9,'MLB','Baseball', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 1, 3);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE, create_time, creator, modified_time, modifier,TEAM_HOME,TEAM_AWAY) values ('2014-08-12T10:50:20', 107,0,9,'MLB','Baseball', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 1, 3);

insert into USERN (USER_ACCOUNT,USER_PASSWORD,USER_NAME,USER_BIRTHDAY,USER_GENDER,USER_PHONE,USER_EMAIL, create_time, creator, modified_time, modifier) values ('wang','a123456','王大蠻','2014-02-28','male','0910123456','wang@gmail.com',CURRENT_TIMESTAMP,'system', CURRENT_TIMESTAMP, 'system');

insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (1, 'SU_H', 1, 1.70, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (1, 'SU_A', 1, 1.25, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (2, 'SU_H', 1, 1.85, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (2, 'SU_A', 1, 1.65, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (3, 'SU_H', 1, 1.70, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (3, 'SU_A', 1, 1.60, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (4, 'SU_H', 1, 1.20, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (4, 'SU_A', 1, 2.10, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (5, 'SU_H', 1, 1.85, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (5, 'SU_A', 1, 1.35, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (6, 'SU_H', 1, 1.75, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (6, 'SU_A', 1, 1.75, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (7, 'SU_H', 1, 1.95, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (7, 'SU_A', 1, 1.45, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (8, 'SU_H', 1, 1.25, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (8, 'SU_A', 1, 2.15, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');

insert into lottery (USER_ID, ODDS_ID_1, ODDS_ID_2, ODDS_ID_3, ODDS_ID_4, ODDS_ID_5, ODDS_ID_6, ODDS_ID_7, ODDS_ID_8, create_time, creator, modified_time, modifier) values (1,1,2,3,3,4,null,null,null,CURRENT_TIMESTAMP,'system', CURRENT_TIMESTAMP, 'system');
insert into lottery (USER_ID, ODDS_ID_1, ODDS_ID_2, ODDS_ID_3, ODDS_ID_4, ODDS_ID_5, ODDS_ID_6, ODDS_ID_7, ODDS_ID_8, create_time, creator, modified_time, modifier) values (1,3,1,3,4,5,null,null,null,CURRENT_TIMESTAMP,'system', CURRENT_TIMESTAMP, 'system');
insert into lottery (USER_ID, ODDS_ID_1, ODDS_ID_2, ODDS_ID_3, ODDS_ID_4, ODDS_ID_5, ODDS_ID_6, ODDS_ID_7, ODDS_ID_8, create_time, creator, modified_time, modifier) values (1,2,3,1,6,7,null,null,null,CURRENT_TIMESTAMP,'system', CURRENT_TIMESTAMP, 'system');