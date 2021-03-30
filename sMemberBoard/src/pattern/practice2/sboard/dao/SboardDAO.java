package pattern.practice2.sboard.dao;

import java.util.ArrayList;

import pattern.practice2.sboard.vo.SboardVO;

public interface SboardDAO {
	
	// �Խñ� ��ü��ȸ(selelctAll)
	public ArrayList<SboardVO> selectAllSboard();
	// �Խñ� �ۼ�(insert)
	public Boolean insertSboard(SboardVO _sbvo);
	// �Խñ� ��ȸ(select)
	public ArrayList<SboardVO> selectSboard(SboardVO _sbvo);
	// �Խñ� ����(update)
	public Boolean updateSboard(SboardVO _sbvo);
	// �Խñ� ����(delete)
	public Boolean deleteSboard(SboardVO _sbvo);
	
}// end of SboardDAO
