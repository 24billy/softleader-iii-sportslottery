insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE, create_time, creator, modified_time, modifier) values ('2014-02-28', 100,2,3,'MLB','BaseBall', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE, create_time, creator, modified_time, modifier) values ('2014-02-28', 100,10,1,'MLB','BaseBall', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into game (GAME_TIME, GAME_NUM, GAME_SCORE_HOME,GAME_SCORE_AWAY,LEAGUE_NAME,BALL_TYPE, create_time, creator, modified_time, modifier) values ('2014-02-28', 100,0,9,'MLB','BaseBall', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');

insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('小熊隊', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('天使隊', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into team (TEAM_NAME, create_time, creator, modified_time, modifier) values ('運動家隊', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');

insert into lottery ( create_time, creator, modified_time, modifier) values (CURRENT_TIMESTAMP,'system', CURRENT_TIMESTAMP, 'system');
insert into lottery ( create_time, creator, modified_time, modifier) values (CURRENT_TIMESTAMP,'system', CURRENT_TIMESTAMP, 'system');
insert into lottery ( create_time, creator, modified_time, modifier) values (CURRENT_TIMESTAMP,'system', CURRENT_TIMESTAMP, 'system');

insert into Usert (USER_ACCOUNT,USER_PASSWORD,USER_NAME,USER_BIRTHDAY,USER_GENDER,USER_PHONE,USER_EMAIL, create_time, creator, modified_time, modifier) values ('wang','a654321','王大蠻','2014-02-28','male','0910-123-456','wang@gmail.com',CURRENT_TIMESTAMP,'system', CURRENT_TIMESTAMP, 'system');

insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (1, 'SU_H', 1, 1, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (2, 'SU_H', 2, 2, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into ODDS (GAME_ID, ODD_TYPE, ODD_COMBINATION, ODD_VALUE, create_time, creator, modified_time, modifier) values (3, 'SU_H', 3, 3, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');