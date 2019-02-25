package com.henu.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.henu.bean.Notice;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@Component(value="commonAction")
@Scope("prototype")
public class CommonAction extends ActionSupport{
	@Resource
	private Notice notice;
	public Notice getNotice() {
		return notice;
	}
	public void setNotice(Notice notice) {
		this.notice = notice;
	}
	
}
