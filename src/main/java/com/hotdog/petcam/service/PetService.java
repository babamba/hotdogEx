package com.hotdog.petcam.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.petcam.repository.PetDao;
import com.hotdog.petcam.vo.PetVo;

@Service
public class PetService {
	@Autowired PetDao petDao;
	
	public PetVo getAllByNo(int no){
		return petDao.getAllByNo(no);
	}
	
	public List<PetVo> getHotdog(PetVo petVo){
		return petDao.getHotdog();
	}
	
}
