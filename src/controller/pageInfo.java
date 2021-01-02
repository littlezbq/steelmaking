package controller;


public class pageInfo {
	private static pageInfo page;
	
//	��ǰҳ��
	private int currentPage;
//	ǰһҳҳ��
	private int prePage;
//	��һҳҳ��
	private int nextPage;
//	����ÿҳ�����ʾ��¼������Ĭ��ֵΪ50
	private int maxRecord = 50;
//	��ҳ��
	private int finalPage;
//	�ܼ�¼��
	private int totalRecord;
	
	
//	ʹ�õ���ģʽ
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
