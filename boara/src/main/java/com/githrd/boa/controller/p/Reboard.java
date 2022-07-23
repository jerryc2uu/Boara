package com.githrd.boa.controller.p;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.boa.dao.p.ReboardDao;
import com.githrd.boa.util.p.PageUtil;
import com.githrd.boa.vo.p.ReboardVO;

/**
 * 이 클래스는 댓글 게시판 관련 요청을 처리할 클래스
 * 
 * @author 박소연
 * @since 2022.06.12
 * @version v.1.0
 * 
 * 		작업 이력 ]
 * 			2022.06.12 - 담당자 : 박소연
 * 							클래스 제작,
 *  						리스트 보기 요청 처리
 */
@Controller
@RequestMapping("/reboard")
public class Reboard {
	
	@Autowired
	ReboardDao rDao;
	
	//댓글 리스트 보기 요청
	@RequestMapping("/reboardList.boa")
	public ModelAndView reboardList(ModelAndView mv, ReboardVO rVO, PageUtil page) {
		
		//페이징 처리
		int total = rDao.getTotal(rVO);
		int bno = rVO.getBno();
		int cno = rVO.getCno();
		
		if(total != 0) {
			
			page.setPage(total);
			rVO.setStartCont(page.getStartCont());
			rVO.setEndCont(page.getEndCont());
			
			
			//댓글 리스트 조회
			List<ReboardVO> list = rDao.getList(rVO);
			
			mv.addObject("LIST", list);
		
		} else {
			page.setPage(1);
		}
		
		mv.addObject("PAGE", page);
		mv.addObject("BNO", bno);
		mv.addObject("CNO", cno);
		mv.addObject("CNT", total);
		mv.setViewName("p/reboardList");
		return mv;
	}
	
	//새 댓글 작성 폼보기 요청
	@RequestMapping("/reboardWrite.boa")
	public ModelAndView reboardWrite(ModelAndView mv, ReboardVO rVO) {
		rVO = rDao.getWriterInfo(rVO);
		mv.addObject("DATA", rVO);
		mv.setViewName("p/reboardWrite");
		return mv;
	}
	
	//새 댓글 등록 처리 요청
	@RequestMapping("/reboardWriteProc.boa")
	public ModelAndView reboardWriteProc(ModelAndView mv, ReboardVO rVO, String nowPage, HttpSession session) {

		int cnt = rDao.addReboard(rVO);
		String view = "/boa/reboard/reboardList.boa";
		String id = (String) session.getAttribute("SID");
		rVO.setId(id);
		
		if(cnt == 0) {
			view = "/boa/reboard/reboardWrite.boa";
			rVO.setResult("NO");
		} else {
			rVO.setResult("OK");
			rVO.setGnp(5);
			rVO.setPcode(102);
			rDao.addPoint(rVO);
			mv.addObject("MSG", "댓글 등록에 성공했습니다. 5포인트가 적립되었습니다.");	
			nowPage = "1";
		}
		mv.addObject("VIEW", view);
		mv.setViewName("p/redirect");
		return mv;
	}
	
	//대댓글 작성 폼 보기 요청
	@RequestMapping("/reboardComment.boa")
	public ModelAndView reboardComment(ModelAndView mv, ReboardVO rVO) {
		rVO = rDao.getWriterInfo(rVO);
		mv.addObject("DATA", rVO);
		mv.setViewName("p/reboardComment");
		return mv;
	}

	//대댓글 작성 처리 요청
	@RequestMapping("/reboardCommentProc.boa")
	public ModelAndView reboardCommentProc(ModelAndView mv, ReboardVO rVO, String nowPage) {
		
		int result = rDao.addReboard(rVO);
		
		if(result == 1) {
			//대댓글 등록 성공
			rVO.setGnp(3);
			rVO.setPcode(103);
			rDao.addPoint(rVO);
			mv.addObject("VIEW", "/boa/reboard/reboardList.boa");
			mv.addObject("MSG", "대댓글 등록에 성공했습니다. 3포인트가 적립됩니다.");		
		} else {
			//실패
			mv.addObject("VIEW", "/boa/reboard/reboardComment.boa");			
		}
		mv.addObject("NOWPAGE", nowPage);
		mv.setViewName("p/redirect");
		return mv;
	}
	

	//댓글 수정 폼 보기 요청
	@RequestMapping("/reboardEdit.boa")
	public ModelAndView reboardEdit(ModelAndView mv, ReboardVO rVO, String nowPage, String vw) {
		rVO = rDao.reboardEdit(rVO);
		mv.addObject("DATA", rVO);
		mv.setViewName("p/reboardEdit");
		return mv;
	}
	
	//댓글 수정 처리 요청
	@RequestMapping("/reboardEditProc.boa")
	public ModelAndView reboardEditProc(ModelAndView mv, ReboardVO rVO, String nowPage, String vw) {
		
		int result = rDao.reboardEditProc(rVO);
		
		if(result == 1) {
			rVO.setCnt(result);
			mv.addObject("VIEW", "/boa/reboard/reboardList.boa");
			mv.addObject("MSG", "댓글 수정에 성공했습니다.");
		} else {
			mv.addObject("VIEW", "/boa/reboard/reboardEdit.boa");
			mv.addObject("MSG", "댓글 수정에 실패했습니다.");
		}
		
		mv.addObject("NOWPAGE", nowPage);
		mv.setViewName("p/redirect");
		return mv;
	}
	
	//댓글 삭제 처리 요청
	@RequestMapping("/reboardDel.boa")
	public ModelAndView reboardDel(ModelAndView mv, ReboardVO rVO, String nowPage, String vw) {
		int cnt = rDao.delReboard(rVO.getRno());
		
		if(cnt != 1) {
			mv.addObject("MSG", "댓글 삭제에 실패했습니다.");
		}
		rVO.setCnt(cnt);
		mv.addObject("VIEW", vw);
		mv.addObject("NOWPAGE", nowPage);
		mv.addObject("MSG", "댓글 삭제에 성공했습니다.");
		mv.setViewName("p/redirect");
		return mv;
	}
	
}
