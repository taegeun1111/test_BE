package com.mountain.doo.dto;

import lombok.*;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
public class AccountModifyDTO {
    private String accountId;
    private String password;
    private String email;
    private String phoneNo;
    private String address;

    public AccountModifyDTO changeAccount(AccountModifyDTO dto){
        AccountModifyDTO build = AccountModifyDTO.builder()
                .password(dto.getPassword())
                .email(dto.getEmail())
                .phoneNo(dto.getPhoneNo())
                .address(dto.getAddress())
                .build();
        return build;
    }

}
