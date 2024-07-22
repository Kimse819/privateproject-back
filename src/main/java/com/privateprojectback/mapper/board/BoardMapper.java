package com.privateprojectback.mapper.board;

import com.privateprojectback.domain.board.Board;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {
    @Insert("""
            INSERT INTO board(title, content, member_id)
            VALUES (#{title}, #{content}, #{member_id})
            """)
    public int insert(Board board);

    @Delete("""
            DELETE FROM board
            WHERE member_id = #{memberId}
            """)
    int deleteByMemberId(Integer memberId);
}
