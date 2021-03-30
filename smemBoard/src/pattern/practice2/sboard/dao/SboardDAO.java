package pattern.practice2.sboard.dao;

import java.util.ArrayList;

import pattern.practice2.sboard.vo.SboardVO;

public interface SboardDAO {
	
	// 게시글 전체조회(selelctAll)
	public ArrayList<SboardVO> selectAllSboard();
	// 게시글 작성(insert)
	public Boolean insertSboard(SboardVO _sbvo);
	// 게시글 조회(select)
	public ArrayList<SboardVO> selectSboard(SboardVO _sbvo);
	// 게시글 수정(update)
	public Boolean updateSboard(SboardVO _sbvo);
	// 게시글 삭제(delete)
	public Boolean deleteSboard(SboardVO _sbvo);
	
}// end of SboardDAO
