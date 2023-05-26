package com.mountain.doo.repository;

import com.mountain.doo.dto.stamp.StampAddConditionDTO;
import com.mountain.doo.dto.stamp.StampResponseDTO;
import com.mountain.doo.entity.Stamp;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StampMapper {


    Stamp stampCount (String accountId);

    void bannerPlus(String accountId);

    void boardPlus(String accountId);

    void stampAdd(String accountId);

    void currentAdd(String accountId);
    int currentCount(String accountId);

    void openEvent(String accountId);

    void myBoard(String accountId);

    void isLogin(boolean attendCount,String accountId);

    int todayMyBoard(String accountId);

//    int todayMyBoard2(String accountId);

    void updateCount(String accountId);

    void addAccount(String accountId);
    boolean findAccountCount(String accountId);
    
    //출석 스탬프 클릭 여부
    void saveClickStamp(String accountId);
    void updateClickStamp(boolean click, String accountId);

    boolean isClick(String accountId);

}
