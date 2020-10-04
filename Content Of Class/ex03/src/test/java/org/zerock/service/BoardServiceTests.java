package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	//서비스 인스턴스 확인 메소드
	@Test
	public void testExist() {
		log.info(service);
		//service 인스턴스 생성 여부 확인 메소드 
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newbie");
		
		service.register(board);
				
		log.info("새성된 게시물의 번호: "+board.getBno());//<selectKey>의 리턴값을 받음.
		
	}
	
	//내용보기 테스트
	@Test
	public void gtestGet() {
		log.info(service.get(1L));
	}
	
	//삭제 테스트
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT "+service.remove(2L));
	}
	
	//수정 테스트
	@Test
	public void testModify() {
		  BoardVO board = service.get(1L);
		
		  if(board==null) {
			  return;
		  }
		  board.setTitle("제목 수정합니다.");
		  board.setContent("내용 수정 합니다");
		  
		  log.info("MODIFY RESULT:"+service.modify(board));
	}
	
	//글 목록 조회
	@Test
	public void testGetList() {
		service.getList().forEach(board->log.info(board));
	}
	
	
	
}
