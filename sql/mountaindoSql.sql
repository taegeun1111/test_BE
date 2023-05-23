use mountaindo;

CREATE TABLE feed_reply(
                           feed_reply_no INT(10) AUTO_INCREMENT PRIMARY KEY,
                           feed_board_no INT(10),
                           feed_reply_content VARCHAR(1000) NOT NULL ,
                           feed_reply_writer VARCHAR(16) NOT NUll,
                           feed_reply_date DATETIME DEFAULT current_timestamp,
#     CONSTRAINT FOREIGN KEY (feed_board_no)
#         REFERENCES feed(feed_board_no) on DELETE CASCADE
);

create table issue(
                      issue_board_no int(10) auto_increment primary key,
                      account_id varchar(16) not null,
                      issue_title varchar(100) not null,
                      issue_content varchar(3000) not null,
                      issue_like_count int(5) default 0,
                      issue_view_count int(10) default 0,
                      issue_reg_date datetime default current_timestamp,
                      issue_modify datetime DEFAULT current_timestamp
);



CREATE TABLE review_reply (
                              review_reply_no INT(10) AUTO_INCREMENT,
                              review_board_no INT(10) NOT NULL,
                              review_reply_content VARCHAR(1000)NOT NULL,
                              review_reply_writer VARCHAR(16)NOT NULL,
                              review_reply_date DATETIME DEFAULT CURRENT_TIMESTAMP,
                              CONSTRAINT pk_review_reply PRIMARY KEY (review_reply_no)
);



create table club_reply(
                           club_reply_no int(10) auto_increment primary key,
                           club_board_no int(10),
                           club_reply_content varchar(1000) not null,
                           club_reply_writer varchar(16) not null,
                           club_reply_date datetime default current_timestamp
);


CREATE TABLE secondhand_reply(
                                 secondhand_reply_no INT(10) AUTO_INCREMENT PRIMARY KEY,
                                 secondhand_board_no INT(10),
                                 secondhand_reply_content VARCHAR(1000) NOT NULL,
                                 secondhand_reply_writer VARCHAR(16) NOT NULL,
                                 secondhand_reply_date DATETIME DEFAULT current_timestamp
#     CONSTRAINT FOREIGN KEY (secondhand_board_no) REFERENCES secondhand (secondhand_board_no) on DELETE CASCADE
);

-- =================테이블 조회 구문=================
SELECT * FROM feed_reply;
SELECT * FROM review_reply;
SELECT * FROM club_reply;
SELECT * FROM secondhand_reply;
-- =================테이블 삭제 구문=================
-- DROP TABLE feed_reply;
-- DROP TABLE review_reply;
-- DROP TABLE club_reply;
-- DROP TABLE secondhand_reply;

-- TRUNCATE TABLE feed_reply;
-- TRUNCATE TABLE review_reply;
-- TRUNCATE TABLE club_reply;
-- TRUNCATE TABLE secondhand_reply;

-- =================테이블 변경 구문=================

use mountaindo;

-- 추천 게시판 테이블
CREATE TABLE offer (
                       offer_board_no INT(10) AUTO_INCREMENT,
                       account_id VARCHAR(16)NOT NULL,
                       offer_title VARCHAR(100)NOT NULL,
                       offer_content VARCHAR(3000)NOT NULL,
                       offer_like_count INT(5),
                       offer_view_count INT(10),
                       offer_type VARCHAR(10),
                       CONSTRAINT pk_offer PRIMARY KEY (offer_board_no)
);




-- 피드/일상 게시판 테이블
CREATE TABLE feed(
                     feed_board_no INT(10) AUTO_INCREMENT PRIMARY KEY,
                     account_id VARCHAR(16),
                     feed_title VARCHAR(100),
                     feed_content VARCHAR(3000),
                     feed_like_count INT(5),
                     feed_view_count INT(10) DEFAULT 0,
                     feed_reg_date DATETIME DEFAULT current_timestamp,
#     CONSTRAINT FOREIGN KEY (account_id) REFERENCES account(account_id) on DELETE CASCADE
);

-- 후기 게시판 테이블
CREATE TABLE review (
                        review_board_no INT(10) AUTO_INCREMENT,
                        account_id VARCHAR(16) NOT NULL,
                        review_title VARCHAR(100) NOT NULL,
                        review_content VARCHAR(3000) NOT NULL,
                        review_like_count INT(5),
                        review_view_count INT(10),
                        review_reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
                        review_modify DATETIME,
                        CONSTRAINT pk_review PRIMARY KEY (review_board_no)
);

-- 산악 이슈 게시판 테이블
create table issue(
                      issue_board_no int(10) auto_increment primary key,
                      account_id varchar(16) not null,
                      issue_title varchar(100) not null,
                      issue_content varchar(3000) not null,
                      issue_like_count int(5) default 0,
                      issue_view_count int(10) default 0,
                      issue_reg_date datetime default current_timestamp,
                      issue_modify datetime DEFAULT current_timestamp
);
ALTER table issue change board_no issue_board_no INT(10) auto_increment primary key;


-- 중고거래 게시판 테이블
CREATE TABLE secondhand (
                            secondhand_board_no INT(10) AUTO_INCREMENT PRIMARY KEY,
                            account_id VARCHAR(16) NOT NULL,
                            secondhand_title VARCHAR(30) NOT NULL,
                            secondhand_content VARCHAR(3000) NOT NULL,
                            secondhand_view_count INT(10) DEFAULT 0,
                            secondhand_area VARCHAR(10),
                            secondhand_reg_date DATETIME DEFAULT current_timestamp,
                            secondhand_deal_type VARCHAR(20),
#     CONSTRAINT FOREIGN KEY (account_id) REFERENCES account(account_id) on DELETE CASCADE
);




-- 모집 게시판 테이블
create table club(
                     club_board_no int(10) auto_increment primary key,
                     account_id varchar(16) not null,
                     club_title varchar(100) not null,
                     club_content varchar(3000)not null,
                     club_area varchar(30)not null,
                     club_reg_date DATETIME default current_timestamp,
                     club_modify_date DATETIME,
                     club_recruit_deadline DATETIME,
                     club_recruit_type varchar(10),
                     club_recruit_count INT(10) not null,
#                                 CONSTRAINT FOREIGN KEY (account_id) REFERENCES account(account_id) ON DELETE CASCADE
);
INSERT INTO club
(account_id, club_title, club_content,club_area,club_recruit_type, club_recruit_count)
VALUES ('test1', '2백두산에', '백두산에 qweqwewqewqewq 사람 구합니다','서울', '소모임',4);

-- =================테이블 조회 구문=================
-- 전체조회
SELECT * FROM offer;
SELECT * FROM feed;
SELECT * FROM review;
SELECT * FROM issue;
SELECT * FROM club;
SELECT * FROM secondhand;

SELECT COUNT(*) AS total_count
FROM (
    SELECT issue_board_no FROM issue WHERE account_id = 'test1'
    UNION ALL
    SELECT secondhand_board_no FROM secondhand WHERE account_id = 'test1'
    UNION ALL
    SELECT club_board_no FROM club WHERE account_id = 'test1'
) AS combined_table;

SELECT *
FROM secondhand s 
WHERE account_id ='test1';
-- =================테이블 삭제 구문=================
-- 망쳐서 테이블 다 삭제하고 싶으면 drop 쓰시고 처음부터 다시 만드세요
-- DROP TABLE offer;
-- DROP TABLE feed;
-- DROP TABLE review;
-- DROP TABLE issue;
-- DROP TABLE club;
-- DROP TABLE secondhand;
-- 테이블 내용물만 지우고 싶으면 truncate를 쓰세요
-- TRUNCATE TABLE offer;
-- TRUNCATE TABLE feed;
-- TRUNCATE TABLE review;
-- TRUNCATE TABLE issue;
-- TRUNCATE TABLE club;
-- TRUNCATE TABLE secondhand;

-- =================테이블 변경 구문=================

-- auto increment 초기화 구문
-- update 뒤에 원하는 테이블을, set 뒤에 칼럼명을 쓰세요
ALTER TABLE club AUTO_INCREMENT=1;
SET @COUNT = 0;
UPDATE club SET club_board_no = @COUNT:=@COUNT+1;

-- 입력하고 싶은 데이터를 조정해서 넣어주세요
INSERT INTO club (account_id, club_title, club_content, club_area, club_recruit_type, club_recruit_count)
VALUES ('test1', '백두산모임', '백두산에 모일 사람 구합니다', '백두산', '정기모임', 4);

DELETE FROM club 
WHERE club_board_no ='2';



  SELECT
        club_board_no, account_id,
        club_title, club_content,
        club_area, club_reg_date,
        club_modify_date, club_recruit_deadline,
        club_recruit_type, club_recruit_count
        from club;
WHERE club_recruit_type LIKE CONCAT('정기모임');

SELECT issue_board_no, 
account_id, 
issue_title, 
issue_content, issue_like_count, issue_view_count, issue_reg_date, issue_modify
FROM issue
ORDER BY issue_board_no
DESC LIMIT 1, 6;


-- ===========================================================================

use mountaindo;

CREATE TABLE account(
                        account_id VARCHAR(16) PRIMARY KEY,
                        password VARCHAR(150) NOT NULL ,
                        name VARCHAR(30) NOT NULL ,
                        gender CHAR(1) NOT NULL ,
                        email VARCHAR(50) NOT NULL ,
                        phone_no VARCHAR(20) NOT NULL ,
                        address VARCHAR(100),
                        session_id VARCHAR(200),
						limit_time DATETIME
);

create table account_login_time(
   account_id VARCHAR(16) PRIMARY key,
   login_time DATE not null
);

alter table account
add profile_img VARCHAR(100);

CREATE TABLE stamp(
    stamp_no INT(2) PRIMARY KEY ,
    account_id VARCHAR(16),
    attend_count INT(10) DEFAULT 0,
    board_count INT(10) DEFAULT 0,
    banner_click_count INT(10) DEFAULT 0,
    current_stamp_count INT(10),
    total_stamp_count INT(5),
);
update account 
set profile_img = 'fwefjklf';
-- =================테이블 조회 구문=================
SELECT * FROM account;
SELECT * FROM stamp;
SELECT * FROM account_login_time;
-- =================테이블 삭제 구문=================
-- DROP TABLE account;
-- DROP TABLE stamp;

-- TRUNCATE TABLE account;
-- TRUNCATE TABLE stamp;
-- TRUNCATE TABLE account_login_time;

-- =================테이블 변경 구문=================

INSERT INTO account (account_id, password, name, gender, email, phone_no, address)
VALUES ('test2', 'test2', '테스트','M', 'admin@admin.com', '000-0000-0000', '서울시 강남구');	
























