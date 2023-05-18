package com.mountain.doo.service;

import com.mountain.doo.dto.stamp.StampAddConditionDTO;
import com.mountain.doo.dto.stamp.StampResponseDTO;
import com.mountain.doo.repository.StampMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class StampService {
    private final StampMapper mapper;

    public StampResponseDTO stampCount(String accountId) {

        StampResponseDTO stampCount = mapper.stampCount(accountId);

        return stampCount;

    }

    public void stampAddCondition(StampAddConditionDTO dto){
                mapper.bannerPlus(dto);
                mapper.boardPlus(dto);
                mapper.booleanLogin(dto);
                mapper.stampUpdate(dto);

    }


}
