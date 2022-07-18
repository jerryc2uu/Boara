package com.githrd.boa.util.c;
/**
 * 	파일 업로드에 필요한 기능을 처리하기 위한 Utility Class
 * 
 * 	@author 최이지
 * 	@since 2022.06.26
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.26	-	클래스 제작
 *
 */

import java.io.File;

public class FileUtil {

	// 파일 이름 중복시 이전에 업로드한 파일에 rewrite 방지 -> rename
	public static String rename(String path, String oldName) {
		int count = 0;
		String newName = oldName;
		
		File file = new File(path, newName);
		
		// 동명의 파일 존재시 rename
		while(file.exists()) {
			count++;
			
			// 확장자, 이름 분리
			int len = oldName.lastIndexOf(".");
			String preName = oldName.substring(0, len);	// 이름
			String ext = oldName.substring(len);		// 확장자
			
			// Setting
			newName = preName + "_" + count + ext;
			file = new File(path, newName);
		}
		
		return newName;
	}
}
