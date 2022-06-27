package com.githrd.boa.service.c;
/**
 * 	컬렉션 관련 기능을 부가적으로 처리하는 클래스
 * 
 * 	@author 최이지
 * 	@since 2022.06.21
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.21	-	클래스 제작
 * 								담당자 : 최이지
 * 
 * 			2022.06.26	-	함수 추가(uploadProc, addColl, editColl)
 * 								담당자 : 최이지
 *
 */

import java.io.File;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.githrd.boa.dao.c.CollectionDao;
import com.githrd.boa.util.c.FileUtil;
import com.githrd.boa.vo.c.*;

public class CollectionService {
	
	@Autowired
	CollectionDao cDao;
	
	// 컬렉션 리스트 불러오며, 장르도 같이 뽑아주기
	public List<CollecVO> getCollList(CollecVO cVO){
		// 장르 데이터 꺼내기
		List<GenreVO> glist = cDao.getGnr();
		
		// 데이터 꺼내주기
		List<CollecVO> list = cDao.getCList(cVO);
		
		// 장르 처리
		for(CollecVO vo : list) {
			if(vo.getGnos()!= null) {
				for(int gno : vo.getGnos()) {
					for(GenreVO gnr : glist) {
						if(gnr.getGno() == gno) vo.getGenre().add(gnr.getGname());
					}
				}
			}
		}
		
		return list;
	}
	
// 컬렉션 작성/수정 관련 ------------------------------------------------------------------------
	
	// 파일 업로드
	public FileVO uploadProc(MultipartFile file) {
		// 반환값 변수
		FileVO fVO = new FileVO();
		String savename = null;	// 저장 이름
		
		// 저장경로 도출
		String path = this.getClass().getResource("").getPath();
		path = path.substring(0, path.indexOf("/WEB-INF")) + "/resources/upload";
		
		// 파일 크기 도출
		long len = file.getSize();
		fVO.setLen(len);
		
		// 파일 이름 만들기
		String oldName = file.getOriginalFilename();
		if(oldName == null) return fVO;	// 넘어온 파일이 없을 때
		fVO.setOriname(oldName);
		savename = FileUtil.rename(path, oldName);
		fVO.setSavename(savename);
		
		// 업로드
		try {
			File f = new File(path, savename);
			file.transferTo(f);	// 파일 정보 기록
		}catch(Exception e) {
			e.printStackTrace();
		}
		return fVO;
	}

	// db 입력 : 컬렉션 작성
	@Transactional
	public int addColl(CollecVO cVO) {
		// 파일 제외 정보 입력
		cDao.addColl(cVO);
		
		// 썸네일 존재시 파일 채워주기
		if(cVO.getThumb() != null) {
			FileVO thumb = uploadProc(cVO.getThumb());
			
			// cno, id 채워주기
			thumb.setCno(cVO.getCno());
			thumb.setId(cVO.getId());
			
			// 입력
			cDao.addThumb(thumb);
		}
		
		// 다 성공했다면 1 반환
		return 1;
	}
	
	// db 입력 : 컬렉션 수정
	@Transactional
	public int editColl(CollecVO cVO) {
		cDao.editColl(cVO);
		
		// 파일 변경사항 있는지 확인
		if(cVO.getThumb() != null) {// 새 썸네일로 변경
			FileVO thumb = uploadProc(cVO.getThumb());
			
			cDao.setOldThumb(cVO.getCno());
			
			// cno, id 채워주기
			thumb.setCno(cVO.getCno());
			thumb.setId(cVO.getId());
			
			// 입력
			cDao.addThumb(thumb);
		}else if(cVO.getFno() != 0) {// 히스토리 중 선택
			cDao.setOldThumb(cVO.getCno());
			cDao.setNewThumb(cVO.getFno());
		}
		
		return 1;
	}
}