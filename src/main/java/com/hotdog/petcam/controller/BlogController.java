package com.hotdog.petcam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.security.Secret;
import com.hotdog.petcam.service.BlogService;
import com.hotdog.petcam.service.PetService;
import com.hotdog.petcam.service.UserService;
import com.hotdog.petcam.vo.UserVo;
import com.hotdog.petcam.vo.VideoVo;

@Controller
@RequestMapping("/blog")
public class BlogController {

	@Autowired
	private BlogService blogService;
	@Autowired
	private UserService userService;
	@Autowired
	private PetService petService;

	@RequestMapping("/{nickname}")
	public String main(@PathVariable String nickname, Model model) {
		System.out.println("로그인한 유저 닉네임" + nickname);

		Map<String, Object> map = blogService.index(nickname);
		model.addAttribute("map", map);

		System.out.println("맵" + map);

		return "blog/blog-main2";
	}

	@Auth
	@RequestMapping("/{nickname}/vod")
	public String vodMain(@PathVariable String nickname, @AuthUser UserVo authUser, Model model) {

		int userNo = authUser.getUsers_no();

		List<VideoVo> list = blogService.getVod(userNo);

		Map<String, Object> map = blogService.index(nickname);

		model.addAttribute("map", map);
		model.addAttribute("list", list);

		return "blog/vod-list";
	}

	@ResponseBody
	@RequestMapping(value = "/app/vod", method = RequestMethod.POST)
	public Object appVodMain(@RequestParam(value = "users_no") int users_no, Model model) {

		List<VideoVo> list = blogService.getVod(users_no);
		return JSONResult.success(list);
	}

	@Auth
	@Secret
	@RequestMapping("/{nickname}/streaming")
	public String Streaming(@PathVariable String nickname, Model model) {
		Map<String, Object> map = blogService.index(nickname);
		model.addAttribute("map", map);

		return "blog/streaming-main";
	}

	@Auth
	@Secret
	@RequestMapping("/{nickname}/account")
	public String Account(@PathVariable String nickname, @AuthUser UserVo authUser, Model model) {
		// 뷰에 수정에 필요한 내용들 다 넘겨버리자
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userVo", userService.getAllByNo(authUser.getUsers_no()));
		map.put("blogVo", blogService.getTitleByNo(authUser.getUsers_no()));
		map.put("petVo", petService.getAllByNo(authUser.getUsers_no()));

		model.addAttribute("map", map);

		return "blog/account-main2";
	}

}
