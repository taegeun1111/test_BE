package com.mountain.doo.service;

import com.mountain.doo.dto.SecondhandRewriteRequestDTO;
import com.mountain.doo.dto.page.Search;
import com.mountain.doo.dto.SecondhandBoardListDTO;
import com.mountain.doo.dto.SecondhandBoardWriteDTO;
import com.mountain.doo.dto.page.SecondhandSearch;
import com.mountain.doo.entity.SecondhandBoard;
import com.mountain.doo.repository.SecondhandBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

import static java.util.stream.Collectors.toList;

@Service
@RequiredArgsConstructor

public class SecondhandBoardService {
   private final SecondhandBoardMapper repository;

    //게시판 전체 조회
    public List<SecondhandBoardListDTO> findAll(SecondhandSearch search) {
        return repository.findAll(search)
                .stream()
                .map(SecondhandBoardListDTO::new)
                .collect(toList())
                ;

    }


    //게시물 하나 찾기
    public SecondhandBoard findOne(int secondHandBoardNo){
        SecondhandBoard one = repository.findOne(secondHandBoardNo);
        repository.plusViewCount(secondHandBoardNo);
        return one;

    }



    //게시물작성
    public boolean handWriteData(SecondhandBoardWriteDTO dto, HttpSession session){
        SecondhandBoard board =new SecondhandBoard(dto);

        //session에서 id 추가 필요
//        board.setAccountId(LoginUtil.getCurrentLoginMemberAccount(session));;

        return repository.handWriteData(board);

    }

    //전체 게시물수 확인
    public int count(SecondhandSearch search){
        return repository.count(search);
    }

    //게시물 수정 처리
    public boolean modify(SecondhandRewriteRequestDTO dto){
        return repository.modifySecondhand(new SecondhandBoard(dto));
    }

    //게시물 삭제
    public boolean delete(int boardNo){
        return repository.deleteSecondhand(boardNo);
    }

}