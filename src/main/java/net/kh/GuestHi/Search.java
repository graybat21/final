package net.kh.GuestHi;

import java.util.Date;

public class Search {

	private String area;
	private Date from;
	private Date to;
	private int participant;
	private int max_price;

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Date getFrom() {
		return from;
	}

	public void setFrom(Date from) {
		this.from = from;
	}

	public Date getTo() {
		return to;
	}

	public void setTo(Date to) {
		this.to = to;
	}

	public int getParticipant() {
		return participant;
	}

	public void setParticipant(int participant) {
		this.participant = participant;
	}

	public int getMax_price() {
		return max_price;
	}

	public void setMax_price(int max_price) {
		this.max_price = max_price;
	}

	@Override
	public String toString() {
		return "\nSearch [area=" + area + ", participant=" + participant + ", max_price=" + max_price + "]";
	}

}
