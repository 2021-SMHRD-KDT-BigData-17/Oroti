package jisang.poyong.mapper;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import jisang.poyong.vo.NoticeVO;
import jisang.poyong.vo.Survey_VO;
import jisang.poyong.vo.SurveyresultVO;

@Mapper
public interface SurveyMapper {

	public List<Survey_VO> surveylist();

	public void surveyinsert(SurveyresultVO vo);

	public List<NoticeVO> noticesearch(HashMap<String, List<String>> requestDataMap);



}
