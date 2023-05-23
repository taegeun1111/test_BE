package com.mountain.doo.dto;

import lombok.*;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AccountResponseDTO {
    private String accountId;
    private String name;
    private String profile;
}
