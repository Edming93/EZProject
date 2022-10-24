package com.sample.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.sample.service.ReviewCommentService;
import com.sample.vo.ReviewCommentVO;
import com.sample.vo.UserVO;


@Controller
@RequestMapping("/review")
public class ReviewCommentController {
	
	private ReviewCommentService service;
	
	ReviewCommentController(ReviewCommentService service) {
		super();
		this.service = service;
	}

	// 페이지 이동
	@GetMapping("/reviewmain")
	public String move(HttpSession session, Model model) {
	 UserVO vo = (UserVO)session.getAttribute("sessionVO");
		model.addAttribute("userdata", vo);
		return "review/reviewmain";
	}
	
	// 모든 커멘트를 가져오는 개체
	@PostMapping("/comment")
	@ResponseBody
	public List<ReviewCommentVO> getAllComment(){
		return service.getCommentAllList();
	}
	
	// 커멘트를 저장
	@PostMapping("/comment/save")
	@ResponseBody
	public Map<String, Object> setComment(HttpSession session, @RequestBody ReviewCommentVO vo) {
        UserVO vo2 = (UserVO) session.getAttribute("sessionVO");
        System.out.println(vo2.getUserName());
		System.out.println(vo.getContent());
		vo.setUserName(vo2.getUserName());
		return service.setComment(vo);
	}
	

	// 커멘트를 수정
	@PutMapping("/comment/edit")
	@ResponseBody
	public Map<String,String> editComment(@RequestBody ReviewCommentVO vo){
	
		return service.editComment(vo);
	}

	

  @DeleteMapping("/comment/delete")
  @ResponseBody
  public Map<String,String> deleteComment(@RequestBody ReviewCommentVO vo){
    return service.deleteComment(vo);
  }

}
