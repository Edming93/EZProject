package com.sample.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.SearchService;
import com.sample.vo.RecentVO;
import com.sample.vo.SearchVO;

@Controller
public class SearchController {

	private SearchService searchService;

	public SearchController(SearchService searchService) {
		super();
		this.searchService = searchService;
	}

	@GetMapping("/searchbar")
	public String searchBar(Model model) {
		List<SearchVO> list = searchService.selectList();
		model.addAttribute("list", list);
		return "search";
	}

	@GetMapping("/stadium/{id}")
	public String stadium(@PathVariable("id") int id, Model model, HttpServletRequest request) {

		searchService.fieldNum(model, id);
		return "result";
	}

	@GetMapping("/recentSearch")
	public String recentSearch() {

		return "Redirect:search";
	}

	@GetMapping("recent")
	@ResponseBody
	public List<RecentVO> getRecentAll() {
		return searchService.getRecentAllList();
	}

	@PostMapping("recent")
	@ResponseBody
	public Map<String, String> setRecent(@RequestBody RecentVO recentVO) {
		return searchService.setRecent(recentVO);
	}

	@PostMapping("delete_recent")
	@ResponseBody
	public Map<String, String> deleteRecent(@RequestBody RecentVO recentVO) {
		return searchService.deleteRecent(recentVO);
	}

}
