package com.mountain.doo.repository.replymapper;


import com.mountain.doo.dto.page.Page;
import com.mountain.doo.entity.reply.FeedReply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface FeedReplyMapper {

    boolean save(FeedReply feedReply);
    boolean modify(FeedReply feedReply);
    boolean delete(long feedBoardNo);
    List<FeedReply> findAll(long feedBoardNo, Page page);
    FeedReply findOne(long feedBoardNo);

    int count(long feedBoardNo);


}
