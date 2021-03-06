package com.test.finalproject.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ScreenTimeVo {

	
	private String timecode;
	private String screencode;
	private String moviecode;
	private String starttime;
	private String endtime;
	private String event;
	@JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Seoul")
	private Date screendate;
	private String state;
}
