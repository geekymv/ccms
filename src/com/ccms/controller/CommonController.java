package com.ccms.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.FileEntity;
import com.ccms.service.FileEntityService;
import com.ccms.util.DateUtils;

@Controller
public class CommonController {
	
	@Autowired
	private FileEntityService fileService;
	
	/**
	 * 学生时间统计，获得最近5个学年
	 * @return
	 */
	@RequestMapping("/recent5Years")
	@ResponseBody
	public List<String> getRecent5Years() {
		return DateUtils.getRecent5XueYear();
	}
	
	/**
	 * 文件上传
	 * @param myFiles
	 * @param authority 文件权限
	 * @param request
	 * @return
	 */
	@RequestMapping("/fileUpload")
	@ResponseBody
	public String fileUpload(@RequestParam MultipartFile[] myFiles, Integer authority,
			HttpServletRequest request) {
		College college = (College) request.getSession().getAttribute("user");
		String realPath = request.getSession().getServletContext().getRealPath("/upload");
		
		for (MultipartFile multipartFile : myFiles) {
			if(multipartFile != null && !multipartFile.isEmpty()) {
				// 获得原始文件名称
				String originalFilename = multipartFile.getOriginalFilename();
				// 获得文件类型
			//	String contentType = multipartFile.getContentType();
				// 获得文件扩展名
			//	String extension = FilenameUtils.getExtension(originalFilename);
				// 获得文件大小
				long size = multipartFile.getSize();

				try {
					String time = DateUtils.getCurrentDate(DateUtils.FORMAT_NORMAL_NO_SIGN);
					int index = originalFilename.lastIndexOf(".");
					String newFileName = originalFilename.substring(0, index) + "_" + time + originalFilename.substring(index);
					// 保存文件
					multipartFile.transferTo(new File(realPath, newFileName));
					
					FileEntity fileEntity = new FileEntity();
					fileEntity.setCollege(college);
					fileEntity.setUploadDate(new Date());
					fileEntity.setFileSize(Float.parseFloat(size + ""));
					fileEntity.setAuthority(authority);
					fileEntity.setNewFileName(newFileName);
					fileEntity.setOriginalFilename(originalFilename);
					
					// 保存文件信息
					fileService.upload(fileEntity);	
					return "success";
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return "fail";
	}
	
}













