package com.ccms.service.impl;

import java.awt.image.BufferedImage;

import org.springframework.stereotype.Service;

import com.ccms.service.CommonService;
import com.ccms.util.RandomValidateCode;

@Service
public class CommonServiceImpl implements CommonService {
	
	@Override
	public BufferedImage createImage() {
		String str = RandomValidateCode.createRandomString();
		return RandomValidateCode.createImage(str);
	}

}
