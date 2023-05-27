create table board(
	idx int not null auto_increment,
	title varchar(1000) not null,
	content varchar(3000) not null,
	writer varchar(100) not null,
	indate datetime not null default now(),
	count int not null default 0,
	primary key(idx)
);

-- int : 숫자형 타입
-- auto_increment : 자동으로 1씩 증가하는 시퀀스
-- datetime : 시간을 넣어주는 타입
-- default : 따로 값을 주지 않으면 초기값으로 입력
-- now() : sql프로그램 안에서의 현재 시간을 자동으로 넣어주는 함수

insert into board(title, content,writer)
values('스프링 게시판', '오늘 어쩌구..', '고민성');

select * from board;

create table member(
	memId varchar(50) not null,
	memPw varchar(50) not null,
	memName varchar(50) not null,
	primary key(memId)
);

insert into member values ('오지윤', '1234', '오지늉');
insert into member values ('admin', 'admin', '관리자');

select * from member;


