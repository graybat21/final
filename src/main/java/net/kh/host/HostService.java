package net.kh.host;


public interface HostService {

	public HostVO hostLogin(HostVO host) throws Exception;
	public boolean hostInsert(HostVO host) throws Exception; // ����
	public boolean hostAuthOk(HostVO host) throws Exception; // ����
	public int hostGetCurrentNo() throws Exception; // ���� no ��ȣ ���ϱ�
	
	
}
