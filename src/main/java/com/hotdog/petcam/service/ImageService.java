package com.hotdog.petcam.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hotdog.petcam.repository.ImageDao;
import com.hotdog.petcam.vo.ImageVo;
import com.hotdog.petcam.vo.PostVo;

@Service
public class ImageService {

	private static final String SAVE_PATH = "/upload";
	
	
	@Autowired
	private ImageDao imageDao;
	
	
	public void PostImageUpload(PostVo postVo){
		imageDao.uploadPostImage(postVo);
	}

	public String restore(MultipartFile userimage, int no) {
		
		String saveFileName;
		try {

			if (userimage.isEmpty() == true) {
				return "";
			}

			String originalFileName = userimage.getOriginalFilename();
			String extName = originalFileName.substring(originalFileName.lastIndexOf('.') + 1,originalFileName.length());
			saveFileName = generateSaveFileName(extName);

			
			writeFile(userimage, saveFileName);

			
		} catch (IOException ex) {
			// throw new UploadFileException("write file");
			// log 남기기
			throw new RuntimeException("write file");
		}
		return saveFileName;
	}	
	
	
	//포스팅용 이미지 업로드 리스토어
	public String restore(MultipartFile multipartFile){
		String url = "";
		String saveFileName;
		try {
			
			if(multipartFile.isEmpty() == true){
				return url;
			}
			
			String originalFileName = multipartFile.getOriginalFilename();
			String extName = originalFileName.substring(originalFileName.lastIndexOf('.')+1, originalFileName.length());
			saveFileName = generateSaveFileName(extName);
			
			ImageVo imageVo = new ImageVo();
			imageVo.setSave_name(saveFileName);
			imageVo.setOrg_name(originalFileName);
			imageVo.setExt_name(extName);
			
			imageDao.insert(imageVo);
			
			writeFile(multipartFile, saveFileName);
			
		} catch (Exception e) {
			// TODO: handle exception
			throw new RuntimeException("upload file exception");
		}
		return saveFileName;
	}
	
	
	private void writeFile(MultipartFile multipartFile, String saveFileName) throws IOException {

		byte[] fileData = multipartFile.getBytes();
		
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(fileData);

		if (fos != null) {
			fos.close();
		}

	}

	private String generateSaveFileName(String ext) {
		String fileName = "";
		Calendar calendar = Calendar.getInstance();

		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += ("." + ext);

		return fileName;
	}
}
