package com.inhatc.system.board.vo;


public class BoardVO {

	private Integer bno; //글번호
	private String manager_classification; //작업분류(PC실습실, 강의실)
	private String manager_belong; //소속 (IT기가재, PC지원실 )
	private String client_number; //전화번호
	private String client_belong; //의뢰인 소속
	private String client_local; //위치
	private String client_name; //이름
	private String instrument; //고장기자재(프린터, 앰프 ...)
	private String content; //접수내용
	private String progress; //처리상황(대기, 처리중, 처리완료)
	private String completeContent; //처리내용
	private String completeId; //처리자
	private String completeDate; //처리한 날짜
	private String regdate; //접수 날짜
	private String writer; //작성자
	private String show;
	private String date_range0;
	private String date_start;
	private String date_end;
	private String call_classification;
	private String client_division;
	

	public String getClient_division() {
		return client_division;
	}

	public void setClient_division(String client_division) {
		this.client_division = client_division;
	}
	
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getManager_classification() {
		return manager_classification;
	}
	public void setManager_classification(String manager_classification) {
		this.manager_classification = manager_classification;
	}
	public String getManager_belong() {
		return manager_belong;
	}
	public void setManager_belong(String manager_belong) {
		this.manager_belong = manager_belong;
	}
	public String getClient_number() {
		return client_number;
	}
	public void setClient_number(String client_number) {
		this.client_number = client_number;
	}
	public String getClient_belong() {
		return client_belong;
	}
	public void setClient_belong(String client_belong) {
		this.client_belong = client_belong;
	}
	public String getClient_local() {
		return client_local;
	}
	public void setClient_local(String client_local) {
		this.client_local = client_local;
	}
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public String getInstrument() {
		return instrument;
	}
	public void setInstrument(String instrument) {
		this.instrument = instrument;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public String getCompleteId() {
		return completeId;
	}
	public void setCompleteId(String completeId) {
		this.completeId = completeId;
	}
	public String getCompleteDate() {
		return completeDate;
	}
	public void setCompleteDate(String completeDate) {
		this.completeDate = completeDate;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public String getCompleteContent() {
		return completeContent;
	}
	public void setCompleteContent(String completeContent) {
		this.completeContent = completeContent;
	}
	public String getDate_range0() {
		return date_range0;
	}
	public void setDate_range0(String date_range0) {
		this.date_range0 = date_range0;
	}
	public String getCall_classification() {
		return call_classification;
	}
	public void setCall_classification(String call_classification) {
		this.call_classification = call_classification;
	}
	public String getDate_start() {
		return date_start;
	}
	public void setDate_start(String date_start) {
		this.date_start = date_start;
	}
	public String getDate_end() {
		return date_end;
	}
	public void setDate_end(String date_end) {
		this.date_end = date_end;
	}
	
	
	
	
}
