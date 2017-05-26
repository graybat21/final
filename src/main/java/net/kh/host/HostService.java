package net.kh.host;

import java.util.HashMap;

public interface HostService {

	public HostVO hostLogin(HostVO host) throws Exception;

	public HostVO getHostInfoByHostNo(int no) throws Exception;
	public boolean hostInsert(HostVO host) throws Exception; // ����

	public boolean hostAuthOk(HostVO host) throws Exception; // ����

	public int hostGetCurrentNo() throws Exception; // ���� no ��ȣ ���ϱ�

}
