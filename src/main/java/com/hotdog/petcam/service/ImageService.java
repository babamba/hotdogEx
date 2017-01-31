package com.hotdog.petcam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.petcam.repository.ImageDao;

@Service
public class ImageService {

		@Autowired
		private ImageDao imageDao;
		
		
	
}
