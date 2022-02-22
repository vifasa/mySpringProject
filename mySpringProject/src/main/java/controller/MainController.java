package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDao;
import dao.CategoryDao;
import vo.BoardVo;
import vo.CategoryVo;
import vo.MemberVo;

@Controller
public class MainController {
	
	CategoryDao category_dao;
	BoardDao board_dao;
	
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext application;
	
	
	
	public void setBoard_dao(BoardDao board_dao) {
		this.board_dao = board_dao;
	}

	public void setCategory_dao(CategoryDao category_dao) {
		this.category_dao = category_dao;
	}

	

	@RequestMapping("main.do")
	public String main(Model model) {
		
		List<BoardVo> list = board_dao.selectList();
		model.addAttribute("b_list", list);
		
		session.setAttribute("page", "board_list_main");
		return "main";
		
	}
	
	@RequestMapping("category/category_serch_form.do")
	public String category_serch_form(Model model) {
		
		session.setAttribute("page", "category_serch");
		
		List<CategoryVo> list = category_dao.selectList();
		
		model.addAttribute("list", list);
		
		return "main";
	}
	
	@RequestMapping("category/category_insert_form.do")
	public String category_insert_form(Model model) {
		
		session.setAttribute("page", "category_insert");
		
		return "main";
	}
	
	@RequestMapping("category/category_insert.do")
	public String category_insert(CategoryVo vo,
								  @RequestParam("image")MultipartFile[] image,
								  Model model) throws Exception {
		
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		//유저의 세션이 만료되었을시
		if(user==null) {
			
			model.addAttribute("reson","session_timeout");
			
			return"redirect:category_serch_form.do";
			
		}
		
		
		/*
		 * //혹여나 관리자가 아니라면 if(user.getM_grade().equals("관리자")) {
		 * 
		 * model.addAttribute("reson","no_permission");
		 * 
		 * return"redirect:category_serch_form.do";
		 * 
		 * }
		 */
		
		String webPath = "/resources/images/category/";
		String absPath = application.getRealPath(webPath);
		
		String filename = "not_file";
		
		MultipartFile ca_image1 = image[0];
		
		if(!ca_image1.isEmpty()) {
			
				
			filename = ca_image1.getOriginalFilename();
			
			File f = new File(absPath,filename);
			
			if(f.exists()) {
				
				long tm = System.currentTimeMillis();
				
				filename = String.format("%d_%s", tm, filename);
				
				f = new File(absPath, filename);
				
			}
			
			ca_image1.transferTo(f);
			
		}
		
		vo.setCa_image(filename);
		
		int res = category_dao.insert(vo);
		
		
		return"redirect:category_serch_form.do";
	}
	
}
