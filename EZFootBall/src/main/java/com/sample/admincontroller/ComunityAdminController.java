package com.sample.admincontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.adminservice.ComunityAdminService;
import com.sample.dao.ReviewCommentDAO;
import com.sample.vo.ReviewCommentVO;
import com.sample.vo.UserVO;

@Controller
@RequestMapping("/comuAdmin")
public class ComunityAdminController {
	
	private ComunityAdminService service;
	
	public ComunityAdminController(ComunityAdminService service) {
		super();
		this.service = service;
	}
	
	// 모든 커멘트를 가져오는 개체
	@PostMapping("/review")
	@ResponseBody
	public List<ReviewCommentVO> getAllComment(HttpSession session, Model model){
		UserVO vo = (UserVO)session.getAttribute("sessionVO");
		model.addAttribute("userdata", vo);
		return service.getCommentList();
	}
	
}
