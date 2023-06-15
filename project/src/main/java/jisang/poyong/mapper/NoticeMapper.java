package jisang.poyong.mapper;

import jisang.poyong.vo.NoticeVO;

import java.util.List;

public interface NoticeMapper {

    // 작성된 공고 불러오기
    List<NoticeVO> LoadNotice();
    
    // 공고 입력
    List<NoticeVO> InsertNotice();
}