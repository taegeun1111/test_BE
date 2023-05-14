package com.mountain.doo.service;

import com.mountain.doo.dto.Page.Search;
import com.mountain.doo.dto.SecondhandBoardListDTO;
import com.mountain.doo.dto.SecondhandBoardWriteDTO;
import com.mountain.doo.entity.SecondhandBoard;
import com.mountain.doo.entity.SecondhandType;
import com.mountain.doo.repository.SecondhandBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

import static java.util.stream.Collectors.toList;

@Service
@RequiredArgsConstructor

public class SecondhandBoardService {
    SecondhandBoardMapper mapper;

    //게시판 전체 조회
    public List<SecondhandBoardListDTO> findAll(Search search) {
        return mapper.findAll(search)
                .stream()
                .map(SecondhandBoardListDTO::new)
                .collect(toList())
                ;

    }


    //게시물 하나 찾기
    public SecondhandBoard findOne(int secondHandBoardNo){
        SecondhandBoard one = mapper.findOne(secondHandBoardNo);
        mapper.plusViewCount(secondHandBoardNo);
        return one;

    }



    //게시물작성
    public boolean handWriteData(SecondhandBoardWriteDTO dto){
        return mapper.handWriteData(dto);

    }

    //전체 게시물수 확인
    public int count(Search search){
        return mapper.count(search);
    }




}