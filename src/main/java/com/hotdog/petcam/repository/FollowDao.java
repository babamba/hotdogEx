package com.hotdog.petcam.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotdog.petcam.vo.UserVo;

@Repository
public class FollowDao {
   @Autowired SqlSession sqlSession;
   
   public void addFollow(int authUser_no,int users_no){
      Map<String,Object> map = new HashMap<String,Object>();
      map.put("authUser_no", authUser_no);
      map.put("users_no", users_no);
      
      sqlSession.insert("follow.addFollow", map);
   }
   
   public void deleteFollow(int authUser_no,int users_no){
      Map<String,Object> map = new HashMap<String,Object>();
      map.put("authUser_no", authUser_no);
      map.put("users_no", users_no);
      
      sqlSession.delete("follow.deleteFollow",map);
   }
   
   public List<UserVo> followingList(int users_no){
      return sqlSession.selectList("follow.followingList", users_no);
   }
   
   public List<UserVo> followList(int users_no){
      return sqlSession.selectList("follow.followList", users_no);
   }
   
   public UserVo didFollow(int authUser_no, int users_no){
      Map<String,Object> map = new HashMap<String,Object>();
      map.put("authUser_no", authUser_no);
      map.put("users_no", users_no);
      
      return sqlSession.selectOne("follow.didFollow", map);
   }
   
   public int countFollower(int users_no){
      return sqlSession.selectOne("follow.countFollower", users_no);
   }
}