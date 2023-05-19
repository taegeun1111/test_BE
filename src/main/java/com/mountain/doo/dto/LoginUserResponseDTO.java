package com.mountain.doo.dto;

import lombok.*;

@Getter @Setter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Builder
//세션에 로그인한 회원들에 대한 dto
public class LoginUserResponseDTO {
    private String accountId;
    private String profile;
}
