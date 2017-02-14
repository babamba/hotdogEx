package com.hotdog.petcam.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.CategoryVo;

@Repository
public class CategoryDao {
	
	 @Autowired private SqlSession sqlSession;
	 
	 public List<CategoryVo> getCategoryList(){
		 return sqlSession.selectList("category.getCategoryList");
	 }

}
