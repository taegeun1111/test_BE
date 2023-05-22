package com.mountain.doo.util;

import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public class FileUtil {
    public static String uploadFile(
            MultipartFile file,
            String rootPath){

//      원본 파일명을 중복이 없는 랜덤 이름으로 변경
        String newFileName
                = UUID.randomUUID() + "_" + file.getOriginalFilename();

//        이 파일을 저장할 날짜별 폴더를 생성
        String newPath=makeDateFormatDirectory(rootPath);

//       파일 업로드 수행
        try {
            file.transferTo(new File(newPath,newFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }

        //저장된 파일의 풀 경로
        String fullPath = newPath + "/" + newFileName;
        return fullPath.substring(rootPath.length());
    }

    private static String makeDateFormatDirectory(String rootPath){
//       오늘 연월일 날짜정보 가져오기
        LocalDateTime now=LocalDateTime.now();
        int y = now.getYear();
        int m = now.getMonthValue();
        int d= now.getDayOfMonth();

        List<String> dateInfo = List.of(
                String.valueOf(y),
                len2(m),
                len2(d));

        String directoryPath = rootPath;
        for (String s : dateInfo) {
            directoryPath+="/"+s;
            File f = new File(directoryPath);
            if(!f.exists()) f.mkdir();
        }
        return directoryPath;
    }

    private static String len2(int n) {
        return new DecimalFormat("00").format(n);
    }
}
