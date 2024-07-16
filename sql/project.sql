USE `movie-recommend`;

# 회원 테이블
CREATE TABLE member
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    email     VARCHAR(100) NOT NULL UNIQUE,
    password  VARCHAR(100) NOT NULL,
    name      VARCHAR(20)  NOT NULL,
    nick_name VARCHAR(50)  NOT NULL UNIQUE,
    gender    INT(1)       NOT NULL, # 남자면 0, 여자면 1
    birth     DATETIME     NOT NULL,
    phone     VARCHAR(20)  NOT NULL,
    inserted  DATETIME     NOT NULL DEFAULT NOW()
);
# 회원 권한 테이블
CREATE TABLE authority
(
    member_id INT         NOT NULL REFERENCES member (id),
    name      VARCHAR(20) NOT NULL,
    PRIMARY KEY (member_id, name)
);

# 게시판 테이블
CREATE TABLE board
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    title     VARCHAR(100)  NOT NULL,
    content   VARCHAR(2000) NOT NULL,
    member_id INT           NOT NULL REFERENCES member (id),
    inserted  DATETIME      NOT NULL DEFAULT NOW()
);
# 게시판 댓글 테이블
CREATE TABLE comment
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    board_id  INT          NOT NULL REFERENCES board (id),
    member_id INT          NOT NULL REFERENCES member (id),
    comment   VARCHAR(500) NOT NULL,
    inserted  DATETIME     NOT NULL DEFAULT NOW()
);
# 게시판 파일(사진) 테이블
CREATE TABLE board_file
(
    board_id INT          NOT NULL REFERENCES board (id),
    name     VARCHAR(500) NOT NULL,
    inserted DATETIME     NOT NULL DEFAULT NOW(),
    PRIMARY KEY (board_id, name)
);