package com.hotdog.petcam.service;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

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

	public void tokenUpdate(RaspberrypiVo raspberrypiVo) {
		raspberrypiDao.tokenUpdate(raspberrypiVo);
	}

	public void DevUpdate(RaspberrypiVo raspberrypiVo) {
		raspberrypiDao.devUpdate(raspberrypiVo);
	}

	public RaspberrypiVo selectByNo(RaspberrypiVo raspberrypiVo) {
		return raspberrypiDao.selectByNo(raspberrypiVo);
	}

}
