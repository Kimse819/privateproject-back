package com.privateprojectback.domain.board;

import lombok.Data;

@Data
public class Board {
    private String title;
    private String content;
    private String member_id;
    private String writer;
}
