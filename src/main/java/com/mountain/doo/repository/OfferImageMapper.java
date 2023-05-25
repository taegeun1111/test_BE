package com.mountain.doo.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OfferImageMapper {
    boolean imageSave(int offerBoardNo,int imageNumber,String filePath);
}
