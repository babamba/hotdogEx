package com.hotdog.petcam.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

    
        private static final String SAVE_PATH = " /usr/local/WowzaStreamingEngine/content";
        
        
        //오디오업로드용 멀티파트
        public String restore(MultipartFile userimage) {
            
            String saveFileName;
            try {

                if (userimage.isEmpty() == true) {
                    return "";
                }

                String originalFileName = userimage.getOriginalFilename();
                String extName = originalFileName.substring(originalFileName.lastIndexOf('.') + 1,originalFileName.length());
                saveFileName = generateSaveFileName(extName);
                Long fileSize = userimage.getSize();

                System.out.println("파일명 정제중");
                System.out.println(saveFileName);
                
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