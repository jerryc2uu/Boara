package com.githrd.boa.scheduler;

import org.quartz.*;
import org.springframework.scheduling.quartz.*;

public class UpShowJob extends QuartzJobBean {
	private UpShow upIsshow;
	
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		upIsshow.upIsshow();
		
	}
	
	public void setUpIsshow(UpShow upIsshow) {
		this.upIsshow = upIsshow;
	}


}
