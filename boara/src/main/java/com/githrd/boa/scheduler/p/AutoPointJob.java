package com.githrd.boa.scheduler.p;

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
