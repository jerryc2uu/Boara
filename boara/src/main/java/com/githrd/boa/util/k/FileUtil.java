package com.githrd.boa.util.k;

import java.io.File;

/**
 * 파일업로드에 필요한 기능을 처리하기 위해서 만든 유틸리티적인 클래스
 * @author	김소연
 * @since	2022/06/24
 * @version	v.1.0
 * 			
 * 			작업이력 ]
 * 				2022/06/21	- 담당자 : 김소연
 * 								클래스제작
 * 
 */

public class FileUtil {

	public static String rename(String path, String oldName) {
		/*
			리네임 정책 설정 ]
				"파일이름_숫자.확장자" 
		 */
		 // 동일한 파일이름의 경우 가운데 붙여질 번호
		int count = 0;
		
		String newName = oldName;
		
		File file = new File(path, newName);
		
		while(file.exists()) {
			count++;
			// ex)spring.jpg
			int len = oldName.lastIndexOf(".");
			String preName = oldName.substring(0, len); // 파일이름만 분리
			String ext = oldName.substring(len); // 확장자 분리
			
			// 중복시 ex)spring_1.jpg
			newName = preName + "_" + count + ext;
			file = new File(path, newName);
		}
		return newName;
	}
}