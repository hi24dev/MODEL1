package pattern.practice2.sjhmem.dao;

import java.util.ArrayList;

import pattern.practice2.sjhmem.vo.SmemberVO;

public interface SmemberDAO {

	// login
	public ArrayList<SmemberVO> loginSmember(SmemberVO _smvo);
	// 회원가입 insert
	public Boolean insertSmember(SmemberVO _smvo);
	// 전체회원 selectAll
	public ArrayList<SmemberVO> selectAllSmember();
	// 회원검색 search
	public ArrayList<SmemberVO> searchSmember(SmemberVO _smvo);
	// 회원정보수정 update
	public Boolean updateSmember(SmemberVO _smvo);
	// 회원탈퇴 delete
	public Boolean deleteSmember(SmemberVO _smvo);
}// end of SmemberDAO
