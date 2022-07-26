package com.githrd.boa.scheduler.p;
/**
 * 이 클래스는 자동 충전 요청 처리 클래스
 * 
 * @author 박소연
 * @since 2022.07.22
 * @version v.1.0
 * 
 * 		작업 이력 ]
 * 			2022.07.22 - 담당자 : 박소연
 * 							클래스 제작
 */
import org.quartz.*;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class AutoPointJob extends QuartzJobBean{
	
	private AutoPoint autoPoints;
	

	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		autoPoints.autoPoint();
		
	}
	
	public void setAutoPoints(AutoPoint autoPoints) {
		this.autoPoints = autoPoints;
	}
}
