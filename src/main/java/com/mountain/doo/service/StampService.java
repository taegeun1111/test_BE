package com.mountain.doo.service;

import com.mountain.doo.repository.StampMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class StampService {
    private final StampMapper mapper;

    public int stampCount(String accountId) {

            int stampCount = mapper.stampCount(accountId);

        return stampCount(accountId);

    }


}
