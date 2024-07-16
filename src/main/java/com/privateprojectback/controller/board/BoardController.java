package com.privateprojectback.controller.board;

import com.privateprojectback.domain.board.Board;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/api/board")
public class BoardController {

    @PostMapping("add")
    public void add(@RequestBody Board board) {
        System.out.println("board = " + board);
    }
}
