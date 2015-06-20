package com.ccms.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ccms.persistence.pojo.ActivityType;
import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.FileEntity;
import com.ccms.persistence.pojo.Rank;
import com.ccms.persistence.pojo.SecondLevel;
import com.ccms.persistence.pojo.Specialty;
import com.ccms.service.ActivityTypeService;
import com.ccms.service.CollegeService;
import com.ccms.service.CommonService;
import com.ccms.service.FileEntityService;
import com.ccms.service.RankService;
import com.ccms.service.SecondLevelService;
import com.ccms.service.SpecialtyService;
import com.ccms.util.DateUtils;
import com.ccms.util.FileUtil;
import com.ccms.util.RandomValidateCode;

@Controller
public class CommonController {
	@Autowired
	private SpecialtyService specialtyService;
	@Autowired
	private SecondLevelService secondLevelService;
	@Autowired
	private FileEntityService fileService;
	@Autowired
	private ActivityTypeService activityTypeService;
	@Autowired
	private CommonService commonService;
	@Autowired
	private RankService rankService;
	@Autowired
	private CollegeService collegeService;
	
	/**
	 * 根据学院id获取该学院的所有专业
	 * @param collegeId
	 * @return
	 */
	@RequestMapping("/getAllSpecialty")
	@ResponseBody
	public List<Specialty> getAllSpecialty(Integer collegeId) {
		return specialtyService.getAllByCollegeId(collegeId);
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/getAllCollege")
	@ResponseBody
	public List<College> getAllCollege() {
		return collegeService.getColleges();
	}
	
	/**
	 * 根据一级分类id获得所有二级分类
	 * @param superiorId
	 * @return
	 */
	@RequestMapping("/secondLevels")
	@ResponseBody
	public List<SecondLevel> listAll(Integer superiorId) {
		return secondLevelService.listAll(superiorId);
	}

	/**
	 * 根据id加载活动一级类型
	 * @param activityTypeId
	 * @return
	 */
	@RequestMapping("/getActivityTypeById")
	@ResponseBody
	public ActivityType getActivityTypeById(Integer activityTypeId) {
		return activityTypeService.getById(activityTypeId);
	}
	
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
	 * 添加活动附件
	 * @param myFiles
	 * @param authority
	 * @param request
	 * @return
	 */
	@RequestMapping("/addAttach")
	@ResponseBody
	public FileEntity addAttach(@RequestParam MultipartFile[] myFiles, Integer authority,
			HttpServletRequest request, HttpSession session) {
		College college = (College) session.getAttribute("user");
		
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
					String newFileName = "";
					if(index != -1) {	// 没有扩展名
						newFileName = originalFilename.substring(0, index) + "_" + time + originalFilename.substring(index);
					}else {
						newFileName = originalFilename + "_" + time;
					}
					
					// 保存文件
					multipartFile.transferTo(new File(realPath, newFileName));
					
					FileEntity fileEntity = new FileEntity();
					fileEntity.setCollege(college);
					fileEntity.setUploadDate(new Date());

					String fileSize = FileUtil.convertFileSize(size);
					fileEntity.setFileSize(fileSize);
					
					fileEntity.setAuthority(authority);
					fileEntity.setNewFileName(newFileName);
					fileEntity.setOriginalFilename(originalFilename);
					
					// 保存文件信息
					fileService.upload(fileEntity);	
					
					// 根据文件新名称查询
					return fileService.queryByNewFileName(newFileName);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return null;
	}
	
	@RequestMapping("/deleteAttach")
	@ResponseBody
	public String deleteAttach(Integer id) {
		return fileService.delete(id);
	}
	
	/**
	 * 将活动和附件关联起来
	 * @param fileId 附件id
	 * @param uuid 活动的uuid
	 * @return
	 */
	@RequestMapping("/linkFileAndActivity")
	@ResponseBody
	public String linkFileAndActivity(Integer fileId, String uuid) {
		return fileService.linkFileAndActivity(fileId, uuid);
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

					String fileSize = FileUtil.convertFileSize(size);
					fileEntity.setFileSize(fileSize);
					
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
	
	/**
	 * 生成验证码
	 * @param request
	 * @param response
	 * @param session
	 */
	@RequestMapping("/image")
	public void image(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		try {
			String str = RandomValidateCode.createRandomString();
			BufferedImage image = commonService.createImage();
			
			session.removeAttribute("authCode");
			session.setAttribute("authCode", str);
			
			ImageIO.write(image, "JPEG", response.getOutputStream());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取所有的受助等级
	 * @return
	 */
	@RequestMapping("/getRanks")
	@ResponseBody
	public List<Rank> getAll() {
		return rankService.findAll();
	}
	
}













