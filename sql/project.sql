USE movie_recommend;

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

# 영화 테이블
CREATE TABLE movie
(
    id           INT PRIMARY KEY AUTO_INCREMENT,
    title        VARCHAR(100) NOT NULL,
    description  TEXT         NOT NULL,
    director     VARCHAR(50)  NOT NULL,
    release_date DATE         NOT NULL,
    duration     INT          NOT NULL, # Duration in minutes
    inserted     DATETIME     NOT NULL DEFAULT NOW()
);

# 장르 테이블
CREATE TABLE genre
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(50) NOT NULL UNIQUE,
    inserted DATETIME    NOT NULL DEFAULT NOW()
);

# 영화-장르 연결 테이블
CREATE TABLE movie_genre
(
    movie_id INT NOT NULL REFERENCES movie (id),
    genre_id INT NOT NULL REFERENCES genre (id),
    PRIMARY KEY (movie_id, genre_id)
);

# 리뷰 테이블
CREATE TABLE review
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    movie_id  INT      NOT NULL REFERENCES movie (id),
    member_id INT      NOT NULL REFERENCES member (id),
    content   TEXT     NOT NULL,
    inserted  DATETIME NOT NULL DEFAULT NOW()
);

# 평점 테이블
CREATE TABLE rating
(
    movie_id  INT      NOT NULL REFERENCES movie (id),
    member_id INT      NOT NULL REFERENCES member (id),
    score     INT      NOT NULL CHECK (score >= 1 AND score <= 10), # 평점은 1~10 사이
    inserted  DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY (movie_id, member_id)
);

# 추천 테이블
CREATE TABLE recommendation
(
    member_id INT      NOT NULL REFERENCES member (id),
    movie_id  INT      NOT NULL REFERENCES movie (id),
    reason    VARCHAR(255),
    inserted  DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY (member_id, movie_id)
);

INSERT INTO authority(member_id, name)
VALUES (2, 'admin');



