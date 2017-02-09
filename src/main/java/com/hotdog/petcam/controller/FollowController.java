package com.hotdog.petcam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotdog.petcam.DTO.JSONResult;
import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.service.FollowService;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("/follow")
public class FollowController {
   @Autowired private FollowService followService;
   
   // 모달 띄울때 해당유저 정보 받아오기
   @Auth
   @ResponseBody
   @RequestMapping(value="/infomodal",method=RequestMethod.POST)
   public Object infoModal(@AuthUser UserVo authUser,@RequestParam(value="users_no")Integer users_no){
      
      Map<String,Object> resultMap = new HashMap<String,Object>();
      resultMap.put("didFollow", followService.didFollow(authUser.getUsers_no(),users_no));
      resultMap.put("countFollower", followService.countFollower(users_no));
      resultMap.put("myProfile", followService.myProfile(authUser.getUsers_no(),users_no));
      
      return JSONResult.success(resultMap);
   }
   
   // 1. Follow 추가
   @Auth
   @ResponseBody
   @RequestMapping(value="/add",method=RequestMethod.POST)
   public Object addFollow(@AuthUser UserVo authUser,@RequestParam(value="users_no")Integer users_no){
      // 나의 번호와 상대의 번호를 가져와 디비에 입력
      followService.addFollow(authUser.getUsers_no(), users_no);
      // Json으로 결과값을 리턴한다. 페이지처리 하든지 말든지..
      return JSONResult.success("success");
   }
   
   // 2. Follow 삭제
   @Auth
   @ResponseBody
   @RequestMapping(value="/delete",method=RequestMethod.POST)
   public Object deleteFollow(@AuthUser UserVo authUser,@RequestParam(value="users_no")Integer users_no){
      // 나의 번호와 상대의 번호를 가져와 디비에서 삭제
      followService.deleteFollow(authUser.getUsers_no(),users_no);
      return JSONResult.success("success");
   }
   
   // 3. Following 목록
   @ResponseBody
   @RequestMapping(value="/followinglist",method=RequestMethod.POST)
   public Object followingList(@RequestParam(value="users_no")Integer users_no){
      // 번호로 해당 유저가 팔로잉하는 사람들의 리스트를 가져온다. 
      List<UserVo> list = followService.followingList(users_no);
      // JSON 으로 리스트를 넘긴다.
      return JSONResult.success(list);
   }
   
   // 4. Follow 목록
   @ResponseBody
   @RequestMapping(value="/followlist",method=RequestMethod.POST)
   public Object followList(@RequestParam(value="users_no")Integer users_no){
      // 번호로 해당 유저를 팔로잉 중인 유저들의 리스트를 가져온다. 
      List<UserVo> list = followService.followingList(users_no);
      // JSON 으로 리스트를 넘긴다.
      return JSONResult.success(list);
   }
   
   // 5. 팔로우 이웃들의 최근 글 출력하기
   @Auth
   @ResponseBody
   @RequestMapping(value="/news",method=RequestMethod.GET)
   public Object news(@AuthUser UserVo authUser,
		   			  @RequestParam(value="page",required=true,defaultValue="1")Integer page){
	   
	   return JSONResult.success(followService.news(authUser.getUsers_no(), page));
   }
}