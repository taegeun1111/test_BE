package com.mountain.doo.service;

import com.mountain.doo.repository.OfferMapper;
import com.mountain.doo.dto.OfferWriteRequestDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OfferService {


    private final OfferMapper offerMapper;

    public void save(OfferWriteRequestDTO dto, String accountId, List<String> filePathList) {
        offerMapper.save(dto,accountId);

        if (filePathList.size() > 0) {
            for (String filePath : filePathList) {
                // fileMapper.save(filePath);
            }

        }

    }
}
