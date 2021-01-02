package controller;


public class pageInfo {
	private static pageInfo page;
	
//	当前页码
	private int currentPage;
//	前一页页码
	private int prePage;
//	后一页页码
	private int nextPage;
//	设置每页最多显示记录条数，默认值为50
	private int maxRecord = 50;
//	总页数
	private int finalPage;
//	总记录数
	private int totalRecord;
	
	
//	使用单例模式
	private pageInfo() {}
	
	public static pageInfo getPageInfo() {
		if (page == null) {
			page = new pageInfo();
		}
		return page;
	}
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPrePage() {
		return prePage;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getMaxRecord() {
		return maxRecord;
	}
	public void setMaxRecord(int maxRecord) {
		this.maxRecord = maxRecord;
	}
	public int getFinalPage() {
		return finalPage;
	}
	public void setFinalPage(int finalPage) {
		this.finalPage = finalPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	
	
	
}
