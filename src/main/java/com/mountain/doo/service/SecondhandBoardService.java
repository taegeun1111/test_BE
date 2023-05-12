package com.mountain.doo.service;

import com.mountain.doo.dto.SecondhandBoardListDTO;
import com.mountain.doo.dto.SecondhandBoardWriteDTO;
import com.mountain.doo.entity.SecondhandBoard;
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
    public List<SecondhandBoardListDTO> findAll() {
        return mapper.findAll()
                .stream()
                .map(SecondhandBoardListDTO::new)
                .collect(toList())
                ;

    }

    public SecondhandBoard findOne(int secondHandBoardNo){
        SecondhandBoard one = mapper.findOne(secondHandBoardNo);
        return one;

    }

    public boolean handWriteData(SecondhandBoardWriteDTO dto){
        boolean writeData = mapper.handWriteData(dto);
        return writeData;


    }


}