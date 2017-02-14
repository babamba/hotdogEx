package com.hotdog.petcam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.service.RaspberrypiService;
import com.hotdog.petcam.vo.RaspberrypiVo;

@Controller
@RequestMapping("/pi")
public class RaspberrypiController {

	@Autowired
	private RaspberrypiService raspberrypiService;

	@ResponseBody
	@RequestMapping(value = "/app/raspberry/insert", method = RequestMethod.POST)
	public Object piInsert(@ModelAttribute RaspberrypiVo raspberrypiVo, @RequestParam(value = "users_no") int users_no,
			@RequestParam(value = "token") String token, @RequestParam(value = "device_num") String device_num) {
		raspberrypiVo.setUsers_no(users_no);
		raspberrypiVo.setDevice_num(device_num);
		raspberrypiVo.setToken(token);
		raspberrypiService.insert(raspberrypiVo);
		return JSONResult.success("success");
	}

	@ResponseBody
	@RequestMapping(value = "/app/raspberry/tokenupdate", method = RequestMethod.POST)
	public Object piTokenUpdate(@ModelAttribute RaspberrypiVo raspberrypiVo,
			@RequestParam(value = "users_no") int users_no, @RequestParam(value = "token") String token) {
		raspberrypiVo.setUsers_no(users_no);
		raspberrypiVo.setToken(token);
		raspberrypiService.tokenUpdate(raspberrypiVo);
		return JSONResult.success("success");
	}

	@ResponseBody
	@RequestMapping(value = "/app/raspberry/devupdate", method = RequestMethod.POST)
	public Object piDevUpdate(@ModelAttribute RaspberrypiVo raspberrypiVo,
			@RequestParam(value = "users_no") int users_no, @RequestParam(value = "device_num") String device_num) {
		raspberrypiVo.setUsers_no(users_no);
		raspberrypiVo.setDevice_num(device_num);
		raspberrypiService.DevUpdate(raspberrypiVo);
		return JSONResult.success("success");
	}

	@ResponseBody
	@RequestMapping("/app/raspberry/getinfo")
	public Object getinfo(@ModelAttribute RaspberrypiVo raspberrypiVo, @RequestParam(value = "users_no") int users_no) {
		raspberrypiVo.setUsers_no(users_no);

		return JSONResult.success(raspberrypiService.selectByNo(raspberrypiVo));
	}
}
