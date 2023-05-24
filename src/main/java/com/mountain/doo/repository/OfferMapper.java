package com.mountain.doo.repository;


import com.mountain.doo.dto.OfferWriteRequestDTO;
import com.mountain.doo.entity.Offer;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OfferMapper {
    boolean save(OfferWriteRequestDTO dto,String accountId);
}
