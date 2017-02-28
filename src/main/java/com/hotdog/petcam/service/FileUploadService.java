package com.hotdog.petcam.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

	private static final String SAVE_PATH = "/upload";

	public String restore(MultipartFile userimage, int users_no) {

		String saveFileName;
		try {

			if (userimage.isEmpty() == true) {
				return "";
			}

			String originalFileName = userimage.getOriginalFilename();
			String extName = originalFileName.substring(originalFileName.lastIndexOf('.') + 1,
					originalFileName.length());
			saveFileName = originalFileName;
			Long fileSize = userimage.getSize();

			writeFile(userimage, saveFileName, users_no);
		} catch (IOException ex) {
			// throw new UploadFileException("write file");
			// log 남기기
			throw new RuntimeException("write file");
		}
		return users_no + "/" + saveFileName;
	}

	public String restore2(MultipartFile userimage, int users_no) {

		String saveFileName;
		try {

			if (userimage.isEmpty() == true) {
				return "";
			}

			String originalFileName = userimage.getOriginalFilename();
			String extName = originalFileName.substring(originalFileName.lastIndexOf('.') + 1,
					originalFileName.length());
			saveFileName = users_no + "." + extName;
			writeFile(userimage, saveFileName);
		} catch (IOException ex) {
			// throw new UploadFileException("write file");
			// log 남기기
			throw new RuntimeException("write file");
		}
		return saveFileName;
	}

	private void writeFile(MultipartFile multipartFile, String saveFileName) throws IOException {

		byte[] fileData = multipartFile.getBytes();

		FileOutputStream fos = new FileOutputStream("/usr/local/WowzaStreamingEngine/content/" + saveFileName);
		fos.write(fileData);

		if (fos != null) {
			fos.close();
		}

	}

	private void writeFile(MultipartFile multipartFile, String saveFileName, int users_no) throws IOException {

		byte[] fileData = multipartFile.getBytes();

		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + users_no + "/" + saveFileName);
		fos.write(fileData);

		if (fos != null) {
			fos.close();
		}

	}

}