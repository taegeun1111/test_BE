//package com.mountain.doo.controller;
//
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//@Controller
//@RequiredArgsConstructor
//@Slf4j
//@RequestMapping("/doo")
//public class boardController {
//
//    private final BoardService boardService;
//
//    //추천 정보 페이지로 이동
//    @GetMapping("/mountain-recommend")
//    public String feed(String id, Model model) {
//        List<BoardListResponseDTO> list = boardService.getList();
//
//        model.addAttribute("id", id);
//        return "";
//    }
//
//
//    //피드/일상 페이지로 이동
//    @GetMapping("/feed")
//    public String feed(String id, Model model) {
//        List<BoardListResponseDTO> list = boardService.getList();
//
//        model.addAttribute("id", id);
//        return "";
//    }
//
//    //산악후기 페이지로 이동
//    @GetMapping("/mountain-review")
//    public String feed(String id, Model model) {
//        List<BoardListResponseDTO> list = boardService.getList();
//
//        model.addAttribute("id", id);
//        return "";
//    }
//
//    //산악이슈 페이지로이동
//    @GetMapping("/mountain-issue")
//    public String feed(String id, Model model) {
//        List<BoardListResponseDTO> list = boardService.getList();
//
//        model.addAttribute("id", id);
//        return "";
//    }
//
//    //모임 페이지로이동
//    @GetMapping("/club")
//    public String feed(String id, Model model) {
//        List<BoardListResponseDTO> list = boardService.getList();
//
//        model.addAttribute("id", id);
//        return "";
//    }
//
//    //중고거래 페이지로이동
//    @GetMapping("/secondhand")
//    public String feed(String id, Model model) {
//
//        return "";
//    }
//
//
//
//    //커뮤니티 페이지에서 글쓰기
//    @GetMapping("/feed-write")
//    public String feedWrite(String id, Model model) {
//        model.addAttribute("id", id);
//        return "";
//    }
//
//    @PostMapping("/feed-write")
//    public String feedPost(String id, String title, String content, String category, Model model) {
//        boardService.save(boardDto dto);
//        model.addAttribute("id", id);
//        return "";
//    }
//
//    //수정
//    @GetMapping("/modify")
//    public String modifyBoard(String id, String boardNo, Category category, Model model) {
//        //boardNo를 찾아서
//        //그 보드에 해당하는 타이틀과 내용을 뿌려줘야한다.
//        model.addAttribute("origin", originBoardDto dto)
//        return "";
//    }
//
//    //수정하기 버튼 클릭
//    @PostMapping("/modify")
//    public String endModify(modifyDTO dto) {
//        boardService.modify(dto);
//        return "redirect:/doo/list";
//    }
//
//    //삭제
//    @GetMapping("/delete")
//    public String delete(Category catogory, String id, String boardNo) {
//        boardService.delete();
//        return "redirect:/doo/list";
//    }
//
//    //글 상세 보기
//    @GetMapping("/detail")
//    public String delete(Category catogory, String id, String boardNo) {
//        boardService.detail();
//        return "detail";
//    }
//}
