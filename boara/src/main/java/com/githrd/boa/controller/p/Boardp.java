package com.githrd.boa.controller.p;

import java.util.HashMap;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.boa.dao.c.BoardDao;
import com.githrd.boa.dao.p.BoardpDao;
import com.githrd.boa.vo.c.BoardVO;
import com.githrd.boa.vo.p.MyInfoVO;
/**
 * 이 클래스는 결제 관련 요청을 처리할 클래스
 * 
 * @author 박소연
 * @since 2022.06.12
 * @version v.1.0
 * 
 * 		작업 이력 ]
 * 			2022.07.05 - 담당자 : 박소연
 * 							클래스 제작
 * 			2022.07.05 - 유료 게시글 구매
 * 			2022.07.06 - 핫 포스팅 등록
 */
@Controller
@RequestMapping("/board")
public class Boardp {
	
	@Autowired
	BoardpDao pDao;
	
	@Autowired
	BoardDao bDao;
	
	//게시글 구매 처리
	@RequestMapping("/buyBoard.boa")
	public ModelAndView buyBoard(ModelAndView mv, MyInfoVO iVO, BoardVO bVO, String nowPage) {
		
		mv.addObject("MSG", "게시글 구매에 성공했습니다.");
		iVO.setResult("NO");

		//현재 총 포인트
		int sumpoint = pDao.selPoint(iVO);
		
		if (sumpoint - iVO.getGnp() < 0) {
		
			mv.addObject("MSG", "포인트가 부족합니다. 포인트를 충전해주세요.");
			iVO.setResult("NO");
			
		} else {
			
			int bno = iVO.getBno();
			int cnt = pDao.buyBoard(iVO);
			int wnt = pDao.selBoard(iVO);
			
			iVO.setResult("OK");
			
			if(cnt != 1 || wnt != 1) {
				mv.addObject("MSG", "게시글 구매에 실패했습니다.");
				iVO.setResult("NO");
			}
			
			bDao.cntStat(bVO);
			bDao.discard(bVO);
			
		}
		
		mv.addObject("NOWPAGE", nowPage);
		mv.addObject("VIEW", "/boa/board/boardDetail.boa");
		mv.setViewName("p/redirect");
		return mv;
	}
	
	//핫 게시글 등록 처리
	@RequestMapping("/hotBoardProc.boa")
	@ResponseBody
	public Map hotBoardProc(MyInfoVO iVO) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		
		//현재 총 포인트
		int sumpoint = pDao.selPoint(iVO);
		
		if(sumpoint - 5000 >= 0) {
			
			//핫 포스팅 등록 처리
			int cnt = pDao.hotBoardProc(iVO);
			
			//핫 포스팅 등록 시 포인트 차감
			int cnt2 = pDao.hotBoardPoint(iVO);
			
			if(cnt == 1 && cnt2 == 1) {
				result = "OK";
			} else {
				result = "NO";
			}
		} else {
			result = "NOPOINT";
		}
		
		iVO.setResult(result);
		map.put("result", result);
		return map;
	}
	
}
