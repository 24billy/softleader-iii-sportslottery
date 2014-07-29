insert into set_occupation (code, local_name, eff_date, exp_date, create_time, creator, modified_time, modifier) values ('A0001001', '住宅', '2000-01-01', null, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into set_occupation (code, local_name, eff_date, exp_date, create_time, creator, modified_time, modifier) values ('A0001002', '商家', '2001-02-03', null, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into set_occupation (code, local_name, eff_date, exp_date, create_time, creator, modified_time, modifier) values ('A0001003', '工廠', '2002-03-04', null, CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');

insert into set_insureditem (create_time, creator, modified_time, modifier, code, name, type, property, section_class) values (CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 'A001', '保險項目名稱1', '主險', '保品', '分向險種');
insert into set_insureditem (create_time, creator, modified_time, modifier, code, name, type, property, section_class) values (CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 'A002', '保險項目名稱2', '主險', '保品', '分向險種');
insert into set_insureditem (create_time, creator, modified_time, modifier, code, name, type, property, section_class) values (CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 'A003', '保險項目名稱3', '主險', '保品', '分向險種');

insert into set_road_code (addr_code,road_code,road_name,create_time, creator, modified_time, modifier ) values ('235', '01', '第一路段',CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP,'system');
insert into set_road_code (addr_code,road_code,road_name,create_time, creator, modified_time, modifier ) values ('236', '02', '第二路段',CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP,'system');
insert into set_road_code (addr_code,road_code,road_name,create_time, creator, modified_time, modifier ) values ('237', '03', '第三路段',CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP,'system');

insert into set_acu (acu_desc, acu_no,create_time, creator, modified_time, modifier) values ('hehehe' ,'A001',CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into set_acu (acu_desc, acu_no,create_time, creator, modified_time, modifier) values ('jajaja' ,'A002',CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into set_acu (acu_desc, acu_no,create_time, creator, modified_time, modifier) values ('wowowo' ,'A003',CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');

insert into set_deductible (create_time, creator, modified_time, modifier, code, name, rate, mintsi, maxtsi, location) values (CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 'AA001', '自付額', 0.25, 1500000, 10000000, '條件');
insert into set_deductible (create_time, creator, modified_time, modifier, code, name, rate, mintsi, maxtsi, location) values (CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 'AA002', '自付額', 0.25, 1500000, 10000000, '條件');
insert into set_deductible (create_time, creator, modified_time, modifier, code, name, rate, mintsi, maxtsi, location) values (CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', 'AA003', '自付額', 0.25, 1500000, 10000000, '條件');

insert into set_addr_zip(create_time, creator, modified_time, modifier, addr_code, addr_name)values( CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', '100', '中正區');
insert into set_addr_zip(create_time, creator, modified_time, modifier, addr_code, addr_name)values( CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', '103', '大同區');
insert into set_addr_zip(create_time, creator, modified_time, modifier, addr_code, addr_name)values( CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system', '104', '中山區');

insert into set_acu_addr (acu_no, addr_code, rod_code, addr_txt, acu_st, create_time, creator, modified_time, modifier) values ('N201400001', '106', '2', '台北市大安區和平東路二段106號11樓', '正常', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into set_acu_addr (acu_no, addr_code, rod_code, addr_txt, acu_st, create_time, creator, modified_time, modifier) values ('N201400012', '103', '2', '台北市大同區', '正常', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');
insert into set_acu_addr (acu_no, addr_code, rod_code, addr_txt, acu_st, create_time, creator, modified_time, modifier) values ('N201400213', '104', '2', '台北市中山區', '正常', CURRENT_TIMESTAMP, 'system', CURRENT_TIMESTAMP, 'system');