package com.githrd.boa.controller.p;

import java.io.IOException;
import java.util.List;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.boa.dao.p.MyInfoDao;
import com.githrd.boa.service.p.IamPort;
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
	
	@Autowired
	IamPort pt;
	
	
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
	
	// 전체 포인트 내역 폼보기
	@RequestMapping("/mypoint.boa")
	public ModelAndView myPoint(ModelAndView mv, HttpSession session, MyInfoVO iVO, PageUtil page) {
		String id = (String) session.getAttribute("SID");
		iVO.setId(id);
		
		//포인트 내역 수
		int total = iDao.myPointCnt(iVO);
		
		//페이징
		page.setPage(total);
		iVO.setStartCont(page.getStartCont());
		iVO.setEndCont(page.getEndCont());

		//포인트 내역 조회
		List<MyInfoVO> list = iDao.myPoint(iVO);
		mv.addObject("LIST", list);
		mv.addObject("PAGE", page);
		mv.addObject("PCODE", iVO.getPcode());
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
	
	//포인트 충전 폼보기
	@RequestMapping("/addPoint.boa")
	public ModelAndView addPoint(ModelAndView mv, MyInfoVO iVO) {
		iVO = iDao.addPoint(iVO);
		mv.addObject("DATA", iVO);
		mv.setViewName("p/addPoint");
		return mv;
	}
	
	//포인트 충전 처리
	@RequestMapping("/addPointProc.boa")
	public ModelAndView addPointProc(ModelAndView mv, MyInfoVO iVO) {
		int cnt = iDao.addPointProc(iVO);
		int gnp = iVO.getGnp();
		String view =  "/boa/member/myinfo.boa";
		
		if(cnt != 1) {
			view = "/boa/member/addpoint.boa";
		}
		
		iVO.setResult("OK");
		mv.addObject("VIEW", view);
		mv.addObject("MSG", gnp + " 포인트 충전에 성공했습니다.");
		mv.setViewName("p/redirect");
		return mv;
		
		
	}
	
	//포인트 환불하기
	@RequestMapping("/canclePay.boa")
	public ModelAndView canclePay(ModelAndView mv, MyInfoVO iVO) {
		
		String imp = iVO.getImp_uid();
		int gnp = iVO.getGnp();
		
		try {
			
			pt.refundPoint(iVO);
			iVO.setResult("OK");
		    mv.addObject("MSG", "환불이 완료되었습니다.");

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("MSG", "환불에 실패했습니다. 다시 시도해주세요.");
		}
		
		mv.addObject("VIEW", "/boa/member/myinfo.boa");
		mv.setViewName("p/redirect");
		return mv;
	}
	
}
