select * FROM users;

-----------------------BOARD

SELECT * FROM board;

select * from board b, users u where b.board_no = 3; 

SELECT @ROWNUM := @ROWNUM + 1 AS ROWNUM, board.* 
FROM
    board,
    (SELECT @ROWNUM := 0) R ;

select b.board_no, b.category, b.title, b.content, b.regdate, b.hits ,b.users_no, u.nickname, (select count(*) from board_comments bc
																												where b.board_no = bc.board_no) as count
from board b, users u
where b.category = 1 and b.users_no = u.users_no and (b.title like "%%" or b.content like "%%")
order by b.board_no DESC 
limit 1, 10 ;
	

select u.nickname , b.board_no , b.category, b.title, b.content, b.regdate, b.hits from board b, users u
where b.category = 1 and b.users_no = u.users_no and (b.title like "%%" or b.content like "%%")
order by b.board_no DESC 
limit 1, 10; 

select count(*) from board b WHERE b.category = 1 and (b.title like "%gd%" or b.content like "%gd%");



select b.board_no, b.category, b.title, b.content, b.regdate, b.hits ,u.nickname, (select count(*) from board_comments bc
																					   where b.board_no = bc.board_no) as count
from board b, users u where b.board_no = 10 and b.users_no = u.users_no;
select * from board b WHERE b.category = 1 and (b.title like "%%" or b.content like "%%");

insert into board value (1, 1, '자유게시판', '냉무',  now(), 0, 0, 3);

delete FROM board ;

update board set hits = 2+ 1 where board_no = 3;

insert into board(category, title, content, regdate, users_no) values (1 , '자유게시판' , '냉무' , now(), 3);

--------------------------------------comment

select * from board_comments;

select count(*) from board_comments bc where bc.board_no= 10;

select * from board_comments bc where bc.comments_no = 7;


select bc.comments_no, bc.content, bc.regdate, bc.board_no, bc.users_no, u.nickname, (select count(*) FROM board_chat bChat
																					  where bc.board_no = 10 and bc.comments_no = bChat.comments_no) as count
from board_comments bc, users u
where bc.board_no = 10 and bc.users_no = u.users_no;
		
----------------------------------------------------------------------------
		
insert INTO board_comments(content, regdate, board_no, users_no) VALUES ('reply!!', now(), 2, 1);


------------------------------------------comment chat
select * from board_chat; 

select count(*) from board_chat bc where bc.comments_no = 35;

select bc.board_chat_no, bc.content, bc.regdate, bc.comments_no, bc.users_no, u.nickname, u.users_image
 from board_chat bc, users u 
 where bc.comments_no = 29 and u.users_no = bc.users_no;

insert INTO board_chat(content, regdate, comments_no , users_no) VALUES ('댓글 채팅 4번', now(), 35, 2);
