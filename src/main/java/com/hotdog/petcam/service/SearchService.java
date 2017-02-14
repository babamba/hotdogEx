package com.hotdog.petcam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotdog.petcam.repository.SearchDao;

@Service
public class SearchService {

	@Autowired private SearchDao searchDao;
}
