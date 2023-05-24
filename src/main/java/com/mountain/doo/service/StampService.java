package com.mountain.doo.service;

import com.mountain.doo.dto.stamp.StampAddConditionDTO;
import com.mountain.doo.dto.stamp.StampResponseDTO;
import com.mountain.doo.entity.Stamp;
import com.mountain.doo.repository.StampMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class StampService {
    private final StampMapper mapper;

    public Stamp stampCount(StampAddConditionDTO dto) {
        //조건별 데이터 전달
        stampAddCondition(dto);

        //응모권 쓰면 -18개
        if (dto.isClickEvent()) {
            clickEvent(dto);
        }

        // 업데이트 된 정보 전달
        Stamp stampCount = mapper.stampCount(dto.getAccountId());
        return stampCount;
    }
    //로그인, 게시글작성, 배너 클릭시 각각 칼럼 count ++
    //스탬프 +1 되는 조건 충족시 도장개수 +1
    public void stampAddCondition(StampAddConditionDTO dto){
               boardBanner(dto);
                plusStamp(dto);
    }

//여기에 변수 하나 만들어서 로그인 true 면 조건 넣으시고
public void boardBanner(StampAddConditionDTO dto) {
    boolean ac = dto.isBannerClickCount();

    if (ac) {
        mapper.bannerPlus(dto.getAccountId());
    }

}


public void plusStamp(StampAddConditionDTO dto) {
    mapper.myBoard(dto.getAccountId());

    Stamp stamp = mapper.stampCount(dto.getAccountId());

    //해당 아이디가 작성한 게시글 count 로 교체
//    stamp.realBoardCount(dto.getAccountId());

        if (stamp.getBannerClickCount() % 3 == 0 && stamp.getBannerClickCount() != 0) {
            mapper.stampAdd(dto.getAccountId());
            mapper.currentAdd(dto.getAccountId());
        }
        if (stamp.getBoardCount() % 3 == 0 && stamp.getBoardCount() != 0) {
            mapper.stampAdd(dto.getAccountId());
            mapper.currentAdd(dto.getAccountId());
        }
        if(stamp.isAttendCount()==true){
            mapper.stampAdd(dto.getAccountId());
            mapper.currentAdd(dto.getAccountId());
        }
    }

    public void clickEvent(StampAddConditionDTO dto){
        // 스탬프 18개 이상일때만 동작
            if(mapper.currentCount(dto.getAccountId())>=18){
            mapper.openEvent(dto.getAccountId());}
    }

    public void loginStamp(String accountId, StampAddConditionDTO dto){

        boolean currentAttendCount = dto.isAttendCount();
        log.info("dto.getAccountId() : "+dto.getAccountId());
        boolean dbAttendCount = mapper.findAccountCount(accountId);

        log.info("currentAttendCount : "+currentAttendCount);
        log.info("dbAttendCount : "+dbAttendCount);

        if(currentAttendCount!=dbAttendCount){
            mapper.isLogin(currentAttendCount, accountId);
        }
    }

    public Stamp minjungTest(String accountId){
        Stamp stamp = mapper.stampCount(accountId);
        return stamp;
    }



}

