package com.mountain.doo.service;

import com.mountain.doo.dto.ClubDetailResponseDTO;
import com.mountain.doo.dto.ClubListResponseDTO;
import com.mountain.doo.dto.ClubWriteRequestDTO;
import com.mountain.doo.entity.Club;
import com.mountain.doo.repository.ClubMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

import static java.util.stream.Collectors.toList;

@Service
@RequiredArgsConstructor
public class ClubService {

    private final ClubMapper boardRepository; //mybatis 사용시


    // 중간처리 기능 자유롭게 사용
    // 목록 중간처리
    public List<ClubListResponseDTO> getList(Search page) {

        return boardRepository.findAll(page)
                .stream()
                .map(board -> new ClubListResponseDTO(board))
                .collect(toList())
                ;
    }

    // 글 등록 중간처리
    public boolean register(ClubWriteRequestDTO dto) {
        return boardRepository.save(new Club(dto));
    }
    
    // 글 삭제 중간처리
    public boolean delete(int bno) {
        return boardRepository.deleteByNo(bno);
    }

    //글 상세조회 중간처리
    public ClubDetailResponseDTO getDetail(int bno) {

        Club club = boardRepository.findOne(bno);
        // 조회수 상승 처리
        boardRepository.upViewCount(bno); //mybatis-sql 사용시

        return new ClubDetailResponseDTO(club);
    }

    //조회수 중간 처리
    public int getCount(Search search) {
        return boardRepository.count(search);
    }

}
