package com.privateprojectback.domain.board;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

@Data
public class Board {
    private String title;
    private String content;
    private String member_id;
    private String writer;
    private Integer memberId;
    private LocalDateTime inserted;

    private Integer numberOfLike;
    private Integer numberOfImages;
    private Integer numberOfComments;
    private List<BoardFile> fileList;

    public Integer getId() {
        return memberId;
    }
}
