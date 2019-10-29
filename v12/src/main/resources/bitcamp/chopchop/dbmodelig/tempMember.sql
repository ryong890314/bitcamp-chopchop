/*
 * 임시 멤버 만드는 sql문
 */
insert into 
  member (email, password, nickname, tel)
value ('test1@test.com', password(1111), 'test1', '1111-1111');

insert into 
  member (email, password, nickname, tel)
value ('test2@test.com', password(2222), 'test2', '2222-2222');

insert into 
  member (email, password, nickname, tel)
value ('test3@test.com', password(3333), 'test3', '3333-3333');

insert into 
  member (email, password, nickname, tel)
value ('test4@test.com', password(4444), 'test4', '4444-4444');

insert into 
  member (email, password, nickname, tel)
value ('test1=@test.com', password(5555), 'test5', '5555-5555');
