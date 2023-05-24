package com.mountain.doo.entity;

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
public class OfferImage {

    private int imageNumber;
    private MultipartFile offerImage1;
    private MultipartFile offerImage2;
    private MultipartFile offerImage3;
    private MultipartFile offerImage4;
}
