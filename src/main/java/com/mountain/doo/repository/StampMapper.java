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
    int currentCount(String acocuntId);

    void openEvent(String accountId);

    void myBoard(String accountId);

    void isLogin(boolean attendCount,String accountId);

}
