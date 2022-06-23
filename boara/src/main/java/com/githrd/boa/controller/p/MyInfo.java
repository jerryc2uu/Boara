package com.githrd.boa.controller.p;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.boa.dao.p.MyInfoDao;
import com.githrd.boa.util.p.PageUtil;
import com.githrd.boa.vo.p.MyInfoVO;

/**
 * 이 클래스는 마이페이지 관련 요청을 처리할 클래스
 * 
 * @author 박소연
 * @since 2022.06.15
 * @version v.1.0
 * 
 * 		작업 이력 ]
 * 			2022.06.15 - 담당자 : 박소연
 * 							클래스 제작
 */
@Controller
@RequestMapping("/member")
public class MyInfo {
	
	@Autowired
	MyInfoDao iDao;
	
	//마이페이지 메인 보기 요청
	@RequestMapping("/myinfo.boa")
	public ModelAndView myInfo(ModelAndView mv, MyInfoVO iVO) {
		String id = iVO.getId();
		iVO = iDao.getMyInfo(id);		
		mv.addObject("DATA", iVO);
		mv.setViewName("p/myInfo");
		return mv;
	}
	
	//구매글 리스트 폼 보기 요청
	@RequestMapping("/mybuy.boa")
	public ModelAndView myBuyList(ModelAndView mv, HttpSession session, MyInfoVO iVO, PageUtil page) {
		String id = (String) session.getAttribute("SID");
		
		//구매글 수
		int total = iDao.myBuyCount(id);
		iVO.setId(id);
		
		//페이지
		page.setPage(page.getNowPage(), total, 5, 3);
		iVO.setStartCont(page.getStartCont());
		iVO.setEndCont(page.getEndCont());
		
		//구매 글 리스트
		List<MyInfoVO> list = iDao.myBuyList(iVO);

		//데이터 심고
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		
		//뷰
		mv.setViewName("p/mybuy");
		return mv;
	}
	
	// 포인트 내역 폼보기
	@RequestMapping("/mypoint.boa")
	public ModelAndView myPoint(ModelAndView mv, HttpSession session, MyInfoVO iVO, PageUtil page) {
		String id = (String) session.getAttribute("SID");
		iVO.setId(id);
		
		//포인트 내역 수
		int total = iDao.myPointCnt(id);
		
		//페이징
		page.setPage(total);
		iVO.setStartCont(page.getStartCont());
		iVO.setEndCont(page.getEndCont());

		//포인트 내역 조회
		List<MyInfoVO> list = iDao.myPoint(iVO);
		
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		mv.setViewName("p/myPoint");
		return mv;
	}
	
	//좋아요 리스트 폼보기
	@RequestMapping("/mylike.boa")
	public ModelAndView myLike(ModelAndView mv, HttpSession session, MyInfoVO iVO, PageUtil page) {	
		String id = (String) session.getAttribute("SID");
		
		//구매글 수
		int total = iDao.myLikeCnt(id);
		iVO.setId(id);
		//페이지 정보
		page.setPage(page.getNowPage(), total, 5, 3);
		iVO.setStartCont(page.getStartCont());
		iVO.setEndCont(page.getEndCont());
		
		//구매 글 리스트
		List<MyInfoVO> list = iDao.myLikeList(iVO);

		//데이터 심고
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		mv.setViewName("p/myLike");
		return mv;
	}
	
	//찜 리스트 폼보기
	@RequestMapping("/myjjim.boa")
	public ModelAndView myJJim(ModelAndView mv, HttpSession session, MyInfoVO iVO, PageUtil page) {
		String id = (String) session.getAttribute("SID");
		
		//갯수
		int total = iDao.myJJimCnt(id);
		iVO.setId(id);
		
		//페이지
		page.setPage(page.getNowPage(), total, 5, 3);
		iVO.setStartCont(page.getStartCont());
		iVO.setEndCont(page.getEndCont());
		
		//찜 리스트
		List<MyInfoVO> list = iDao.myJJimList(iVO);
		
		//데이터 심고
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		
		//뷰
		mv.setViewName("p/myJJim");
		return mv;
	}
	
	//내가 작성한 게시글리스트 폼보기
	@RequestMapping("/myboard.boa")
	public ModelAndView myBoard(ModelAndView mv, HttpSession session, MyInfoVO iVO, PageUtil page) {
		String id = (String) session.getAttribute("SID");
		iVO.setId(id);
		//갯수
		int total = iDao.myBoardCnt(id);
		
		//페이지
		page.setPage(total);
		iVO.setStartCont(page.getStartCont());
		iVO.setEndCont(page.getEndCont());
		
		//리스트 
		List<MyInfoVO> list = iDao.myBoardList(iVO);
		
		//데이터 심고
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		
		//뷰
		mv.setViewName("p/myboard");
		return mv;
	}

	//내가 작성한 댓글리스트 폼보기
	@RequestMapping("/myreboard.boa")
	public ModelAndView myReboard(ModelAndView mv, HttpSession session, MyInfoVO iVO, PageUtil page) {
		String id = (String) session.getAttribute("SID");
		iVO.setId(id);
		//갯수
		int total = iDao.myReboardCnt(id);
		
		//페이지
		page.setPage(total);
		iVO.setStartCont(page.getStartCont());
		iVO.setEndCont(page.getEndCont());
		
		//리스트 
		List<MyInfoVO> list = iDao.myReboardList(iVO);
		
		//데이터 심고
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		
		//뷰
		mv.setViewName("p/myreboard");
		return mv;
	}
	
	@RequestMapping("/addpoint.boa")
	public ModelAndView myReboard(ModelAndView mv) {
		mv.setViewName("p/addPoint");
		return mv;
	}
}
