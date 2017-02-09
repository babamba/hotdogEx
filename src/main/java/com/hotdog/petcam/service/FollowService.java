package com.hotdog.petcam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.petcam.repository.FollowDao;
import com.hotdog.petcam.vo.NewsVo;
import com.hotdog.petcam.vo.UserVo;

@Service
public class FollowService {

   @Autowired FollowDao followDao;
   
   public void addFollow(int authUser_no,int users_no){
      System.out.println(authUser_no+" : "+ users_no);
      followDao.addFollow(authUser_no,users_no);
   }
   
   public void deleteFollow(int authUser_no,int users_no){
      followDao.deleteFollow(authUser_no,users_no);
   }
   
   public List<UserVo> followingList(int users_no){
      return followDao.followingList(users_no);
   }
   public List<UserVo> followList(int users_no){
      return followDao.followingList(users_no);
   }
   
   // 본인이 해당유저를 팔로우 했나 안했나..authUser와 해당 유저의 번호를 가지고 판단
   public boolean didFollow(int authUser_no,int users_no){
      if( followDao.didFollow(authUser_no,users_no) == null){
         return false;
      }
      return true;
   }
   // 팔로워 숫자 반환
   public int countFollower(int users_no){
      return followDao.countFollower(users_no);
   }
   // 내 프로필인지 아닌지
   public boolean myProfile(int authUser_no,int users_no){
	   if(authUser_no == users_no){
		   return true;
	   }
	   return false;
   }
   // 이웃의 최신글 리턴하기
   public List<NewsVo> news(int authUser_no,int page){
	   return followDao.news(authUser_no,page);
   }
}