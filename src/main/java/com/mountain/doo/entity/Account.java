package com.mountain.doo.entity;

import com.mountain.doo.dto.AccountModifyDTO;
import lombok.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Component
@Builder
public class Account {
    private String accountId;
    private String password;
    private String name;
    private GENDER gender;
    private String email;
    private String phoneNo;
    //나중에 오류 확인 
    private String address;
    private String sessionId;
    private LocalDateTime limitTime;

}
