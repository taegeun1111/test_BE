package com.mountain.doo.service;

import com.mountain.doo.entity.Offer;
import com.mountain.doo.repository.OfferMapper;
import com.mountain.doo.dto.OfferWriteRequestDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OfferService {


    private final OfferMapper offerMapper;

    public void save(OfferWriteRequestDTO dto,String accountId) {
        offerMapper.save(dto,accountId);

    }
}
