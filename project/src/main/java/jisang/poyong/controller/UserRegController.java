package jisang.poyong.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jisang.poyong.mapper.Mapper;
import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

// POJO(Plain Old Java Object) : 실제로 일하는 컨트롤러
// @Component : Spring 초창기에 쓰던 표현
@Controller
public class UserRegController {
	
	// 모든 요청들은  FrontController로 들어와서 이 POJO로 연결됨
	
	// @Autowired 안적으면 오류는 나지 않지만 실행이 되지 않음 
	@Autowired
	private Mapper mapper;
	
	
	
	// main.do라는 요청이 들어오면 WEB-INF/views/basic.jsp가 실행되도록
	// 메소드를 만들어서 일을 시킴
	// RequestMapping은 메소드 단위로 연결
			// ()에는 요청의 경로를 작성
	@RequestMapping("/main.do")
	public String basic() {
		// view의 논리적 이름을 문자열로 작성
		return "basic";
	}
	
	// .do 요청패턴 --> 꼭 사용해야하는건 아니다.
	// String boardList(HttpServletRequest request) : 매개변수로 객체를 사용
	// Model : 스프링에서 가상의 메모리에 데이터를 저장할 수 있음
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		// DB에 있는 데이터를 가져오려면 데이터 감을 VO, 일을 시킬 DAO 필요
		// 임의의 값으로 게시글 만들기
		// mapper에게 일 시켜서 값 가져오기
		List<Board> list = mapper.boardList();
	
		model.addAttribute("list",list);
		
		// WEB-INF/views/boardList.jsp (viewResolver)
		return "boardList";
	}
	
	// boardInsertForm.do하는 요청을 받아서 boarderInsertForm.jsp를 실행하는 메소드
	// 만약에 메소드 이름과 실행시킬 jsp의 이름이 일치하면 return하지 않아도 된다.
	@RequestMapping("/boardInsertForm.do")
	public void boardInsertForm(){}

		@RequestMapping("/boardInsert.do")
		public String boardInsert(Board vo) {
			
			// title, content, writer 정보를 받아와서(파라미터 수집)
			// request.getParameter("name"값)
			// 객체의 속성(property)명으로 name을 지정해줬기 때문에
			// 스프링 프레임 워크가 알아서 Board 객체로 묶어줌
			// mapper에 일 시켜서 결과값은 받아올건 없음!!!
			
			mapper.boardInsert(vo);
			
			// 계시글 작성이 완료됐으면 다시 게시판 목록으로 갈 수 있게끔~~~
			// jsp 바로 못부른다며?!? 요청을 입력
			// DB값을 가져와서 model에 저장을 하고난 다음에 jsp를 불러오는 boardList메소드로 이동해야한다!!
			// 스프링은 기본적으로 이동방식이 forward방식
			// 원래는 문자열을 인식해서 viewResolver로 보내는데..
			// redirect : 가 적어져 있으면 viewResolver로 이동하지 않고 요청을 수행
			// WEB-INF/views/redirect:/boardList.do.jsp....
			return "redirect:/boardList.do";
	}
	
		// boardList.do에서 제목을 클릭했을때 콘솔창에 게시글 번호가 잘 넘어오는지 확인!!
	@RequestMapping("/boardContent.do/{idx}")
	public String boardContent(@PathVariable("idx") int theIdx, Model model) {
		// 전에 servlet에서 받아온다면 Integer.parseInt(request.getParamater(name)
		// 한개의 값이 넘어 온다면 @RequestParam int idx 
		
		// 요청 다음에 넘어오는 값이 idx임을 지정{idx}
		// @pathVariable("idx") int theIdx
		
		System.out.println(theIdx);
		
		// DB에서 해당 idx를 가지는 게시글 내용(번호, 제목, 내용, 작성자, 작성일, 조회수)가지고와서
		Board vo = mapper.boardContent(theIdx);
		// Model에 저장해 놓고 나중에 view에서 가져올 예정
		model.addAttribute("vo", vo);

		return "boardContent";
	}
		
	@RequestMapping("/boardDelete.do/{idx}")
	public String boardDelete(@PathVariable("idx") int idx) {
		mapper.boardDelete(idx);
		
		// 게시글 삭제하고 나면 게시글 목록 돌아가기
		// 게시글 목록을 보여줄 boardList.jsp를 돌려주면 XXXXX
		// 그냥 jsp만 실행시키면 DB에서 게시글 내용을 불러올 수 없기 때문에
		// boardList.do요철을 수행하는 boardList 메소드로 이동
		return "redirect:/boardList.do";
	}
	
	// 쿼리스트링으로 name = value로 데이터 보낼시에는
	// getParameter(name)해온 것처럼 매개변수에 원하는 타입으로 원하는 이름으로 받아올 수 있다.
	@RequestMapping("/boardUpdateForm.do")
	public String boardUpdateForm(int idx,Model model) {
		
		// 수정하기 양식으로 보낼때 기존의 게시글 내용을 포함 시켜야됨
		// 기존에 이미 만들었던 메소드를 사용
		Board vo = mapper.boardContent(idx);
		// 게시글 내용을 다시 model에 저장
		model.addAttribute("vo", vo);
		
		return "boardUpdateForm";
	}
	
	// post요청으로 보낸 요청을 연결
	@PostMapping("/boardUpdate.do")
	public String boardUpdate(Board vo) {
		mapper.boardUpdate(vo);
		// 게시글 수정했으면 다시 게시글 목록으로 이동
		return "redirect:/boardList.do";
		
	}
	
	
}
