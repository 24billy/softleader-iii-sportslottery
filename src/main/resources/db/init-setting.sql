insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('小熊隊', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('天使隊', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('運動家隊', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');

insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE, create_time, creator, modified_time, modifier,TEAM_HOME,TEAM_AWAY) values (CURRENT_TIMESTAMP, 100,2,3,'MLB','BaseBall', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 1, 2);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE, create_time, creator, modified_time, modifier,TEAM_HOME,TEAM_AWAY) values (CURRENT_TIMESTAMP, 100,10,1,'MLB','BaseBall', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 2, 3);
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE, create_time, creator, modified_time, modifier,TEAM_HOME,TEAM_AWAY) values (CURRENT_TIMESTAMP, 100,0,9,'MLB','BaseBall', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 1, 3);

insert into USERN (USER_ACCOUNT,USER_PASSWORD,USER_NAME,USER_BIRTHDAY,USER_GENDER,USER_PHONE,USER_EMAIL, create_time, creator, modified_time, modifier) values ('wang','a654321','王大蠻','2014-02-28','male','0910123456','wang@gmail.com',CURRENT_TIMESTAMP,'system', CURRENT_TIMESTAMP, 'system');

insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (1, 'SU_H', 1, 1, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (2, 'SU_H', 2, 2, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (3, 'SU_H', 3, 3, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');

insert into lottery (USER_ID, ODDS_ID_1, ODDS_ID_2, ODDS_ID_3, ODDS_ID_4, ODDS_ID_5, ODDS_ID_6, ODDS_ID_7, ODDS_ID_8, create_time, creator, modified_time, modifier) values (1,1,2,3,null,null,null,null,null,CURRENT_TIMESTAMP,'system', CURRENT_TIMESTAMP, 'system');
insert into lottery (USER_ID, ODDS_ID_1, ODDS_ID_2, ODDS_ID_3, ODDS_ID_4, ODDS_ID_5, ODDS_ID_6, ODDS_ID_7, ODDS_ID_8, create_time, creator, modified_time, modifier) values (1,3,1,3,null,null,null,null,null,CURRENT_TIMESTAMP,'system', CURRENT_TIMESTAMP, 'system');
insert into lottery (USER_ID, ODDS_ID_1, ODDS_ID_2, ODDS_ID_3, ODDS_ID_4, ODDS_ID_5, ODDS_ID_6, ODDS_ID_7, ODDS_ID_8, create_time, creator, modified_time, modifier) values (1,2,3,1,null,null,null,null,null,CURRENT_TIMESTAMP,'system', CURRENT_TIMESTAMP, 'system');