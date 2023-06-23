package jisang.poyong.vo;

public class Survey_VO {

	private String surveyidx;
	private String surveytext;
	
	public String getSurveyidx() {
		return surveyidx;
	}
	public void setSurveyidx(String surveyidx) {
		this.surveyidx = surveyidx;
	}
	public String getSurveytext() {
		return surveytext;
	}
	public void setSurveytext(String surveytext) {
		this.surveytext = surveytext;
	}
	@Override
	public String toString() {
		return "Survey_VO [surveyidx=" + surveyidx + ", surveytext=" + surveytext + "]";
	}
	
	
}
