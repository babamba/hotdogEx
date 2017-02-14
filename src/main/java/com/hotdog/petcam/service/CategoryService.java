package com.hotdog.petcam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.petcam.repository.CategoryDao;
import com.hotdog.petcam.vo.CategoryVo;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryDao categoryDao;
	
	 public List<CategoryVo> getCategoryList(){
		 return categoryDao.getCategoryList();
	 }
}
