package com.mountain.doo.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StampMapper {


    int stampCount (String accountId);

//    boolean plusStampCount()
}
