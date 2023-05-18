package com.mountain.doo.controller;

import com.mountain.doo.service.StampService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/stamp")
@Slf4j
public class StampController {

    private final StampService stampService;


}
