package com.githrd.boa.controller.k;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.boa.dao.c.BoardDao;
import com.githrd.boa.dao.k.MainBoardDao;
import com.githrd.boa.service.c.Recommend;
import com.githrd.boa.service.k.MemberService;
import com.githrd.boa.util.k.PageUtil;
import com.githrd.boa.vo.k.FileVO;
import com.githrd.boa.vo.k.MessageVO;
import com.githrd.boa.vo.k.SearchVO;

/**
 * 메인 게시판 관련 요청을 처리할 controller클래스
 * @author	김소연
 * @since	2022.06.12
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.06.12	-		클래스 제작, 메인
 * 				2022.06.29  - 		top 게시글 조회
 * 				2022.07.03	-		컬렉션 검색(reference collectList.jsp)
 *				2022.07.06	-		게시글 검색(reference boardList.jsp), hot 게시글
 *				2022.07.12	- 		발신, 수신 메세지 조회
 *				2022.07.13 	-		수신자 조회, 쪽지보내기
 *				2022.07.17	-		쪽지 상세보기
 *										담당자 : 김소연
 *
 *				2022.07.18	-		도서 추천api 추가
 *										담당자 : 최이지
 */

@Controller
public class Main {
	@Autowired
	MainBoardDao mbDao;
	@Autowired
	BoardDao bDao;
	@Autowired
	MemberService mSrvc;
	@Autowired
	Recommend reco;
	
	@RequestMapping({"/", "/main.boa"})
	public ModelAndView getMain(ModelAndView mv, HttpSession session, FileVO fVO) {
		List<FileVO> hList = mbDao.getHotBoard();
		List<FileVO> list = mbDao.getTopBoard();
		mv.addObject("GNO", reco.susume(session));
		mv.addObject("HLIST", hList);
		mv.addObject("LIST", list);
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping("/search.boa")
	public ModelAndView serch(ModelAndView mv, String search, SearchVO sVO, PageUtil page, String sel) {
			
		String str = "col";
		int totalCount = mbDao.getTotal(sVO);
		page.setPage(totalCount);
		
		sVO.setStartCont(page.getStartCont());
		sVO.setEndCont(page.getEndCont());
		sVO.setSel(sel);
		sVO.setSearch(search);
		
		if(str.equals(sel)) {
			List<SearchVO> list = mbDao.getColList(sVO);
			mv.addObject("LIST", list);
		} else  {
			List<SearchVO> blist = mbDao.getBoList(sVO);
			mv.addObject("BLIST", blist);
		}
			 mv.addObject("PAGE", page);
			 mv.setViewName("k/search"); 
		
		return mv;
	
	}
	
	@RequestMapping("/receive.boa")
	@ResponseBody
	public List<MessageVO> receList (MessageVO msVO){
		

		List<MessageVO> list = mbDao.getReceList(msVO);
		return list;
	}
	
	@RequestMapping("/send.boa")
	@ResponseBody
	public List<MessageVO> sendList (MessageVO msVO){
		List<MessageVO> list = mbDao.getSendList(msVO);
		return list;
	}
	
	@RequestMapping("/idList.boa")
	@ResponseBody
	public List<MessageVO> idList (MessageVO msVO){
		List<MessageVO> list = mbDao.getIdList(msVO);
		return list;
	}
	
	@RequestMapping("/sendMess.boa")
	@ResponseBody
	public Map<String, String> sendMess (MessageVO msVO){
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		msVO.setBody(msVO.getBody().replaceAll("\n", "<br>"));
		int cnt = mbDao.addMess(msVO);
		msVO.setCnt(cnt);
		if(cnt == 1) {
			result = "OK";
		}
		map.put("result", result);
		return map;
	}
	
	@RequestMapping("/messDetail.boa")
	@ResponseBody
	public MessageVO messDetail (MessageVO msVO){
		msVO = mSrvc.mesdetail(msVO);
		return msVO;
	}
	
	@RequestMapping("/delMess.boa")
	@ResponseBody
	public Map<String, String> delMess (MessageVO msVO){
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		int cnt = mbDao.delMess(msVO);
		msVO.setCnt(cnt);
		if(cnt == 1) {
			result = "OK";
		}
		map.put("result", result);
		return map;
	}
}
 