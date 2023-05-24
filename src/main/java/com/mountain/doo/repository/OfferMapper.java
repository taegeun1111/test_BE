package com.mountain.doo.repository;


import com.mountain.doo.dto.OfferWriteRequestDTO;
import com.mountain.doo.entity.Offer;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface OfferMapper {
    boolean save(@Param("dto") OfferWriteRequestDTO dto,
                 @Param("accId") String accountId);
}
