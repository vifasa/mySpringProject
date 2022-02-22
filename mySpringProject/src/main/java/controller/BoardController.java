package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BoardDao;
import dao.MemberDao;
import myutil.MyConstant;
import myutil.Paging;
import vo.BoardVo;
import vo.MemberVo;

@Controller
public class BoardController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	BoardDao board_dao;
	
	MemberDao member_dao;

	
	
	public void setMember_dao(MemberDao member_dao) {
		this.member_dao = member_dao;
	}


	public void setBoard_dao(BoardDao board_dao) {
		this.board_dao = board_dao;
	}
	
	
	@RequestMapping("board/board_list.do")
	public String board_list(@RequestParam(name="ca_idx", defaultValue = "") int ca_idx,
							 @RequestParam(name="ca_name", defaultValue = "") String ca_name,
							 @RequestParam(value="page" , defaultValue = "1")	int nowPage,
							 @RequestParam(value="search",     defaultValue="all")   String search, 
							 @RequestParam(value="search_text",defaultValue="") String search_text,
							 Model model){
		
		//�Խù����� ������ ���� ���
				int start = (nowPage-1) * MyConstant.Board.BLOCK_LIST + 1;
				int end   = start + MyConstant.Board.BLOCK_LIST - 1;
				
				String categoryName = ca_name;
				
				//�˻����� �� ������ ���� ��ü
				Map map = new HashMap();
				map.put("ca_idx", ca_idx);
				map.put("start", start);
				map.put("end", end);
				
				
				//�˻������� map�� ��´�
				if(!search.equals("all")) {
					
					if(search.equals("name_subject_content")) {
						map.put("name", search_text);
						map.put("subject", search_text);
						map.put("content", search_text);
					}else if(search.equals("name")) {
						map.put("name", search_text);
						
					}else if(search.equals("subject")) {
						map.put("subject", search_text);
						
					}else if(search.equals("content")) {
						map.put("content", search_text);
						
					}
				}
				
				
				//��ü�Խù���
				int rowTotal = board_dao.selectRowTotal(map);
						
				//����¡ �޴� ����
				//�˻�����
				String search_filter = String.format("ca_idx=%s&search=%s&search_text=%s",ca_idx,search,search_text);
				
				String pageMenu = Paging.getPaging("board_list.do", 
						                            search_filter,
						                            nowPage, 
						                            rowTotal, 
						                            MyConstant.Board.BLOCK_LIST,
						                            MyConstant.Board.BLOCK_PAGE
						                            );
				
				//�Խñ� ��ϰ�������
				List<BoardVo> list = board_dao.selectList(map);
				
				//model���ؼ� request binding
				model.addAttribute("ca_name", categoryName);
				model.addAttribute("b_list", list);
				model.addAttribute("pageMenu", pageMenu);
				
				session.setAttribute("ca_idx", ca_idx);
				session.setAttribute("page", "board_list");
				return "main";
				
		
	}
	
	// ���ñ� �Է� ��
	@RequestMapping("board/board_insert_form.do")
	public String board_insert_form() {
		
		session.setAttribute("page", "board_insert");
		
		return"main";
	}
	
	// ���ñ� �Է�
	@RequestMapping("board/board_insert.do")
	public String insert(BoardVo vo,Model model) {
		
		//�α��ε� ���� ���� ������
		MemberVo user = (MemberVo) session.getAttribute("user");
		int ca_idx = (Integer) session.getAttribute("ca_idx");
		if(user==null) {
			
			model.addAttribute("reason", "session_timeout");
			
			return "redirect:list.do";
		}
		
		
		vo.setCa_idx(ca_idx);
		vo.setM_idx(user.getM_idx());
		vo.setM_name(user.getM_name());
		vo.setM_image(user.getM_image());
		
		
		//IP���ϱ�
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		//DB insert
		int res = board_dao.insert(vo);
		
		
		return "redirect:board_list.do?ca_idx="+ca_idx;
	}
	
	//���ù� ����
	@RequestMapping("board/board_view.do")
	public String view(int b_idx,Model model) {
		
		BoardVo  vo = board_dao.selectOne(b_idx);
		
		//���� �Խñ��� �ó� ��������� ���ǿ��� �˻�
		if(session.getAttribute("show")==null) {
		
			//��ȸ�� ����
			int res = board_dao.update_readhit(b_idx);
			
			//session�� �ôٴ� ���� ���
			session.setAttribute("show", true);
		}
		
		session.setAttribute("page", "board_view");
		
		model.addAttribute("vo", vo);
		
		return "main";
	}
	
	//���ù� ���ƿ�
	@RequestMapping("board/b_like.do")
	public String b_like(int b_idx,int m_idx) {
		
		System.out.println(b_idx);
		System.out.println(m_idx);
		int res = board_dao.update_like(b_idx);
		
		 res = member_dao.update_point_up(m_idx);
		
		return"redirect:board_view.do?b_idx="+b_idx;
	}
	
	//���ù� �Ⱦ��
	@RequestMapping("board/b_hate.do")
	public String b_hate(int b_idx,int m_idx) {
		
		int res = board_dao.update_hate(b_idx);
		
		 res = member_dao.update_point_down(m_idx);
		
		return"redirect:board_view.do?b_idx="+b_idx;
	}
	
	//���ù� ��Ȱ��ȭ
	@RequestMapping("board/board_delete.do")
	public String delete(int b_idx, int ca_idx, Model model) {
		
		int res = board_dao.update_use_yn(b_idx);
		
		model.addAttribute("ca_idx", ca_idx);
	
		
		System.out.println(ca_idx);
		System.out.println(b_idx);
		
		return"redirect:board_list.do";
	}
	
	//���ù� ���� �� ����
	@RequestMapping("/board/modify_form.do")
	public String modify_form(int b_idx,int ca_idx,Model model) {
		
		//������ �Խù� ������
		BoardVo  vo = board_dao.selectOne(b_idx);
		
		//model���ؼ� request binding
		session.setAttribute("page", "board_modify_form");
		model.addAttribute("ca_idx", ca_idx);
		model.addAttribute("vo", vo);
		
		return "main";
	}
	
	@RequestMapping("/board/board_modify.do")
	public String modify(BoardVo vo,
						  int ca_idx,
						  String page,
				          String search,
				          String search_text,
			              Model model) {
		
		MemberVo user = (MemberVo) session.getAttribute("user");
		if(user==null) {
			
			model.addAttribute("reason", "session_timeout");
			model.addAttribute("page", page);
			model.addAttribute("search", search);
			model.addAttribute("search_text",search_text);
			
			return "redirect:list.do?ca_idx"+ca_idx;
		}
		
		
		String b_ip = request.getRemoteAddr();
		vo.setB_ip(b_ip);
		
		int res = board_dao.update(vo);
		
		model.addAttribute("b_idx", vo.getB_idx());
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("search_text",search_text);
		
		
		return "redirect:board_view.do";
	}
}
