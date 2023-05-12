package com.mountain.doo.repository;

import com.mountain.doo.dto.SecondhandBoardWriteDTO;
import com.mountain.doo.entity.SecondhandBoard;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import java.util.List;
@Mapper
public interface SecondhandBoardMapper {

    //전체 게시판 조회
    List<SecondhandBoard>findAll();

    //게시판 하나 조회
    SecondhandBoard findOne(int secondHandBoardNo);

    boolean handWriteData(SecondhandBoardWriteDTO dto);

}
