package net.kh.utils;

public class PageMaker {

	public Integer page;
	public Integer count;
	public Integer start;
	public Integer end;
	public boolean prev;
	public boolean next;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		if (page < 1 || page == null) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setCount(Integer count, int countPerPaging) {
		if (count < 1) {
			return;
		}
		this.count = count;
		calcPage(countPerPaging);
	}

	private void calcPage(int countPerPaging) {
		// page변수는 현재 페이지번호, 현재 페이지번호를 기준으로 끝 페이지를 계산한다.
		int tempEnd = (int) (Math.ceil(page / (float) countPerPaging) * countPerPaging);
		// 시작 페이지 계산
		this.start = tempEnd - countPerPaging + 1;

		if (tempEnd * countPerPaging > this.count) { // 가상으로 계산한 tempEnd크기가 실제
														// count보다 많을경우
			this.end = (int) Math.ceil(this.count / (float) countPerPaging);
		} else {
			this.end = tempEnd; // 실제 count가 tempEnd보다 많을경우
		}
		this.prev = this.start != 1;
		this.next = this.end * countPerPaging < this.count;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getEnd() {
		return end;
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Integer getCount() {
		return count;
	}

	@Override
	public String toString() {
		return "PageMaker [page=" + page + ", count=" + count + ", start=" + start + ", end=" + end + ", prev=" + prev
				+ ", next=" + next + "]";
	}

}
