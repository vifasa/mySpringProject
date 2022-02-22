package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.CategoryDao;
import dao.FavoritesDao;
import dao.MemberDao;
import vo.FavoritesVo;
import vo.MemberVo;

@Controller
public class MemberController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServletContext application;
	
	MemberDao member_dao;
	
	FavoritesDao favorites_dao;
	
	CategoryDao category_dao;
	
	
	
	
	public void setCategory_dao(CategoryDao category_dao) {
		this.category_dao = category_dao;
	}

	public void setFavorites_dao(FavoritesDao favorites_dao) {
		this.favorites_dao = favorites_dao;
	}

	public void setMember_dao(MemberDao member_dao) {
		this.member_dao = member_dao;
	}
	
	//�α����� ����
	@RequestMapping("/member/login_form.do")
	public String login_form() {
		return"member/member_login_form";
	}
		
	//�α��� ó���ϱ�
	@RequestMapping("/member/login.do")
	public String login(String m_id, String m_pwd,
						@RequestParam(value="url", defaultValue = "") String url,
						Model model) {
		
		MemberVo user = member_dao.selectOne(m_id);
		
		//���̵� Ʋ������
		if(user == null) {
			
			model.addAttribute("reason", "fail_id");
			
			return "redirect:login_form.do";
		}
		
		//��й�ȣ Ʋ�����
		if(user.getM_pwd().equals(m_pwd)==false) {
			
			model.addAttribute("reason","fail_pwd");
			
			return "redirect:login_form.do";
		}
		
		//���� ���� ��������
		int m_idx = user.getM_idx();
		List<FavoritesVo> list = favorites_dao.selectList(m_idx);
		
		//��й�ȣ ������ ����
		String pwd = "";
        String[] a = user.getM_pwd().split("");
        for(int i= 0; i<a.length; i++){
            if(i < (a.length-4)) {
                pwd += "*";
            } else {
                pwd += a[i];
            }
        }
		
        user.setM_pwd(pwd);
        
		//�α��� ����
		session.setAttribute("user", user);
		session.setAttribute("f_list", list);
		
		model.addAttribute("reason", "success");
		
		return "redirect:login_form.do";
		
	}
	
	//�α׾ƿ�
	@RequestMapping("/member/logout.do")
	public String logout() {
		session.removeAttribute("user");
		
		return "redirect:../main.do";
	}
	
	// ���̵� üũ
	@RequestMapping("/member/check_id.do")
	@ResponseBody
	public Map check_id(String m_id) {
		
		MemberVo vo = member_dao.selectOne(m_id);
		Map map = new HashedMap();
		map.put("result",(vo==null));
		
		return map;
	}
	
	// �ɹ� ������ �̵�
	@RequestMapping("/member/insert_form.do")
	public String insert_form() {
		
		return"member/member_insert_form";
	}
	
	// �ɹ� ����
	@RequestMapping("/member/insert.do")
	public String insert(String m_name,
						 String	m_id,
						 String m_pwd,
						 String	m_mail,
						 Model model) {
		
		String m_ip		= request.getRemoteAddr();
		
		//vo�� �����ϱ�
		MemberVo vo = new MemberVo(m_name, m_id, m_pwd, m_mail, m_ip);
		
		//DB Insert �ϱ�
		int res = member_dao.insert(vo);
		
		return"redirect:../main.do";
	}
	
	// �ɹ� ����
	@RequestMapping("member/modify_form.do")
	public String member_modify() {
		
		session.setAttribute("page", "member_modify_form");
		
		return "main";
	}
	
	//���ã�� ����
	@RequestMapping("member/favorites_insert.do")
	public String favorites_insert(FavoritesVo vo) {
		
		int ca_idx = vo.getCa_idx();
		
		String ca_name = category_dao.selectOne(ca_idx);
		
		vo.setCa_name(ca_name);
		
		int res = favorites_dao.insert(vo);
		
		List<FavoritesVo> list = favorites_dao.selectList(vo.getM_idx());
		
		session.setAttribute("f_list", list);
		
		String referer = request.getHeader("Referer");
		
		return "redirect:"+ referer;
	}
	
	//ȸ������
	@RequestMapping("/member/member_modify.do")
	public String modify(MemberVo vo,
						@RequestParam("image")MultipartFile[] image) throws IllegalStateException, IOException {
		
		System.out.println("���� ����");
		
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		//������ ������ ����Ǿ�����
		if(user==null) {
					
			return"redirect:category_serch_form.do";
					
		}
		
		String webPath = "/resources/images/member/";
		String absPath = application.getRealPath(webPath);
		
		//1.ip���ϱ�
		String m_ip	= request.getRemoteAddr();
		vo.setM_ip(m_ip);
		
		String filename = user.getM_image();
		
		MultipartFile image1 = image[0];
		
		if(!image1.isEmpty()) {
			
				
			filename = image1.getOriginalFilename();
			
			File f = new File(absPath,filename);
			
			if(f.exists()) {
				
				long tm = System.currentTimeMillis();
				
				filename = String.format("%d_%s", tm, filename);
				
				f = new File(absPath, filename);
				
			}
			
			image1.transferTo(f);
			
		}
				
		vo.setM_image(filename);
		
		//DB update
		int res = member_dao.update(vo);
		
		return "redirect:logout.do";
	}
	
	//���ã�� ����
	@RequestMapping("member/favorites_delete.do")
	public String favorites_delete(FavoritesVo vo) {
		
		int res = favorites_dao.delete(vo);
		
		List<FavoritesVo> list = favorites_dao.selectList(vo.getM_idx());
		
		session.setAttribute("f_list", list);
		
		String referer = request.getHeader("Referer");
		
		return "redirect:"+ referer;
	}
	
	//ȸ����
	@RequestMapping("member/member_view.do")
	public String member_view(int m_idx,Model model) {
		
		MemberVo vo = member_dao.selectOne(m_idx);
		
		model.addAttribute("m_vo", vo);
		
		return"member/member_view";
	}
	
	//����Ʈ ����
	@RequestMapping("member/m_like.do")
	public String b_like(int m_idx) {
		int res = member_dao.update_point_up(m_idx);
		
		String referer = request.getHeader("Referer");
		
		return"redirect:"+referer;
	}
	
	//����Ʈ �϶�
	@RequestMapping("member/m_hate.do")
	public String b_hate(int m_idx) {
		int res = member_dao.update_point_down(m_idx);
			
		String referer = request.getHeader("Referer");
			
		return"redirect:"+referer;
	}
}
