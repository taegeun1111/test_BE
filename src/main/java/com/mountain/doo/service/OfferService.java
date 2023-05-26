package com.mountain.doo.service;

import com.mountain.doo.dto.OfferImageResponseDTO;
import com.mountain.doo.dto.OfferResponseDTO;
import com.mountain.doo.repository.OfferImageMapper;
import com.mountain.doo.repository.OfferMapper;
import com.mountain.doo.dto.OfferWriteRequestDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
@RequiredArgsConstructor
@Slf4j
public class OfferService {


    private final OfferMapper offerMapper;
    private final OfferImageMapper offerImageMapper;

    public void save(OfferWriteRequestDTO dto, String accountId, List<String> filePathList) {

        offerMapper.save(dto,accountId);
        int offerBoardNo = offerMapper.findBoardNo(dto.getOfferType());

        int imageNumber=0;
        if (filePathList.size() > 0) {

            log.info("imageNumber : "+imageNumber);
            for (String filePath : filePathList) {
                imageNumber++;
                 offerImageMapper.imageSave(offerBoardNo,imageNumber,filePath);
            }
        }
    }

    public Integer findBoardNo(String offerType) {
        Integer boardNo = offerMapper.findBoardNo(offerType);
        return boardNo;
    }

    public OfferResponseDTO findText(int offerBoardNo){
        OfferResponseDTO dto = offerMapper.findText(offerBoardNo);

        return dto;
    }

    //이미지찾기
    public List<OfferImageResponseDTO> findImage(int offerBoardNo){
        List<OfferImageResponseDTO> dto = offerMapper.findImage(offerBoardNo);
        return dto;
    }

    public  Integer findMountain(String s) {
        Integer dto = offerMapper.isNull(s);
        return dto;
    }
}
