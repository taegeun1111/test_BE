package com.mountain.doo.repository;

import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Mapper
public interface LoginTimeMapper {

    boolean updateLoginTime(String accountId, LocalDate currentLoginTime); //update
    LocalDate findLoginTime(String accountId); //select

    boolean saveLoginTime(String accountId, LocalDate currentLoginTime); //insert
}
