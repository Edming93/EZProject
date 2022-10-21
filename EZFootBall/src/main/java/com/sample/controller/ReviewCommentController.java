package com.sample.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.ReviewCommentService;
import com.sample.vo.ReviewCommentVO;



@Controller
@RequestMapping("/review")
public class ReviewCommentController {
	
	private ReviewCommentService service;
	
	ReviewCommentController(ReviewCommentService service) {
		super();
		this.service = service;
	}

	//로그인
	/*
	 * @GetMapping("/login") public String getLogin(UserVO vo) { return "login"; }
	 * 
	 * @PostMapping("/login") public String postLogin(UserVO vo, HttpSession
	 * session) { return (service.isUser(vo,
	 * session))?"redirect:/review_main":"/login"; }
	 */
	
	// 페이지 이동
	@GetMapping("/reviewmain")
	public String move() {
		return "review/reviewmain";
	}
	
	// 모든 커멘트를 가져오는 개체
	@GetMapping("/comment")
	@ResponseBody
	public List<ReviewCommentVO> getAllComment(){
		return service.getCommentAllList();
	}
	
	// 커멘트를 저장
	@PostMapping("/comment")
	@ResponseBody
	public Map<String,Object> setComment(@RequestBody ReviewCommentVO vo){
		System.out.println(vo.getOwner());
		System.out.println(vo.getContent());
		return service.setComment(vo);
	}
	
//	@PostMapping("/comment")
//	@ResponseBody
//	public ResponseEntity<Map<String,String>> setComment(@RequestBody CommentVO vo){
//		ResponseEntity<Map<String,String>> res = null;
//		Map<String, String> map = new HashMap<String, String>();
//		if(service.setComment(vo) > 0) {
//			map.put("result", "성공적으로 전송되었습니다");
//			res = new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
//		}else {
//			map.put("result", "전송되지 못했습니다");
//			res = new ResponseEntity<Map<String,String>>(map, HttpStatus.NOT_FOUND);
//		}
//		
//		return res;
//		
//	}

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
