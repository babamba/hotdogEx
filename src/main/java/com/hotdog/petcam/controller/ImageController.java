package com.hotdog.petcam.controller;

import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hotdog.petcam.security.Auth;
import com.hotdog.petcam.security.AuthUser;
import com.hotdog.petcam.service.ImageService;
import com.hotdog.petcam.vo.ImageVo;
import com.hotdog.petcam.vo.UserVo;

@Controller
@RequestMapping("/image")
public class ImageController {

	@Autowired
	private ImageService imageService;
	
	
	@Auth
	@RequestMapping("/upload")
	
	public String image(
			@RequestParam(value="CKEditorFuncNum") int CKEditorFuncNum,
			@RequestParam(value="upload") MultipartFile upload, Model model,
			HttpServletRequest request, HttpServletResponse response, @AuthUser UserVo authUser, ImageVo imageVo) throws UnknownHostException{
		
		String saveFileName = imageService.restore(upload);
		String path = "/hotdog/image/user/";
		
		String file_path = path + saveFileName;
		
					
		model.addAttribute("file_path", file_path); 
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
/*			model.addAttribute(file_path);
		model.addAttribute(CKEditorFuncNum);*/
		
		
		
		
		/*String funcNum = request.getParameter("CKEditorFuncNum");
		String fileUrl = "http://localhost:8087/hotdog/hotdog/image/user/";
		String callback = ("<script>window.parent.CKEDITOR.tools.callFunction(" + funcNum + ", '" + fileUrl + saveFileName + "');</script>");*/
		
		return "includes/imageUpload";
		
	}
	
	
}
