package com.mountain.doo.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OfferWriteRequestDTO {

    private String offerType;
    private String offerTitle1;
    private String offerContent1;
    private String offerTitle2;
    private String offerContent2;
    private String offerTitle3;
    private String offerContent3;
    private String offerTitle4;
    private String offerContent4;
    private List<MultipartFile> offerImage;
}
