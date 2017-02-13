package com.hotdog.petcam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.petcam.repository.RaspberrypiDao;
import com.hotdog.petcam.vo.RaspberrypiVo;

@Service
public class RaspberrypiService {

	@Autowired
	private RaspberrypiDao raspberrypiDao;

	public void insert(RaspberrypiVo raspberrypiVo) {
		raspberrypiDao.insert(raspberrypiVo);
	}

	public RaspberrypiVo selectByNo(RaspberrypiVo raspberrypiVo) {
		return raspberrypiDao.selectByNo(raspberrypiVo);
	}
}
