package pattern.practice2.sjhmem.dao;

import java.util.ArrayList;

import pattern.practice2.sjhmem.vo.SmemberVO;

public interface SmemberDAO {

	// login
	public ArrayList<SmemberVO> loginSmember(SmemberVO _smvo);
	// ȸ������ insert
	public Boolean insertSmember(SmemberVO _smvo);
}// end of SmemberDAO
