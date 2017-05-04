package net.kh.host;

public interface HostService {

	public HostVO hostLogin(HostVO host) throws Exception;
	public boolean hostInsert(HostVO host) throws Exception; // 가입
	public boolean hostAuthOk(HostVO host) throws Exception; // 인증
	public int hostGetCurrentNo() throws Exception; // 현재 no 번호 구하기
	
}
