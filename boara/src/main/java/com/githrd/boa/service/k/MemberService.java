package com.githrd.boa.service.k;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.githrd.boa.dao.k.MemberDao;
import com.githrd.boa.util.k.FileUtil;
import com.githrd.boa.vo.k.FileVO;
import com.githrd.boa.vo.k.MemberVO;

public class MemberService {
	
	@Autowired
	MemberDao mDao;
	
	// 단일 파일 업로드
	public FileVO uploadProc(MultipartFile file) {
		
		FileVO fVO = new FileVO();
		
		String path = this.getClass().getResource("").getPath();
		path = path.substring(0, path.indexOf("/WEB-INF")) + "/resources/upload";
		
		
		// 파일크기
		long len = file.getSize();
		fVO.setLen(len);
		
		// oriName
		String oldName = file.getOriginalFilename();
		if(oldName == null) {
			return fVO;
		}
		fVO.setOriname(oldName);
		
		// reName(중복이름 구분해서 저장하기 위해서)
		String reName = FileUtil.rename(path, oldName);
		fVO.setSavename(reName);
		
		// 파일 업로드 하고
		try {
			File f = new File(path, reName);
			// 파일 내용 기록
			file.transferTo(f);
			} catch(Exception e) {
			e.printStackTrace();
		}
		return fVO;
	}
	
	// 데이터베이스 입력작업 전담 처리함수
	@Transactional
	public void addMemberData(MemberVO mVO) {
		// 회원정보 데이터 입력
		mDao.addMember(mVO);
		
		if(mVO.getFile() != null) {
			// 파일정보테이블에 파일정보들 입력
			FileVO file = uploadProc(mVO.getFile());
			// Mno를 꺼내서 FileVO들에 채워주고
			file.setMno(mVO.getMno());
			
			mDao.addFile(file);
		} 
	}	
}