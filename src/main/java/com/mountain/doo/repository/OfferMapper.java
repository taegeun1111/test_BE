package com.mountain.doo.repository;


import com.mountain.doo.dto.OfferImageResponseDTO;
import com.mountain.doo.dto.OfferWriteRequestDTO;
import com.mountain.doo.dto.OfferResponseDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OfferMapper {
    boolean save(@Param("dto") OfferWriteRequestDTO dto,
                 @Param("accId") String accountId);

    int findBoardNo(String offerType);

//    List<OfferResponseDTO> findRecentArticle(String offerType);

    OfferResponseDTO findText(int offerBoardNo);


    List<OfferImageResponseDTO> findImage(int offerBoardNo);
}

