package org.zerock.mapper;

import java.util.List;
import java.util.function.Consumer;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import oracle.net.ano.Service;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	//Lombok라이브러리를 이용한 주입
  @Setter(onMethod_ = @Autowired)	
 private BoardMapper mapper;
 
 @Ignore
 @Test//해당메소드를 실행 
 public void testGetList() {
	 //리스트 출력 메소드 -무명인터페이스를 선언하여 forEach()메소드의 매개변수로 전달
	 /*mapper.getList().forEach(new Consumer<BoardVO>() {
		@Override
		public void accept(BoardVO board) {
		   log.info(board);
		}
	});
	*/
	 
	 //매개변수값은 받고 리턴은 없는 void형태의 추상메소드 1개 존재
	mapper.getList().forEach(board->  log.info(board));
	/*
	 List<BoardVO> list = mapper.getList();
	 
	 list.forEach(board-> log.info(board));
	 
	 for(int i=0;i<list.size();i++) {
		  BoardVO board = list.get(i);
		  log.info(board);
	 }
	 
	 for(BoardVO board:list) {
		 log.info(board);
	 }
	 */
	 
 }
 
 @Ignore
 @Test
 public void testInsert() {
	 BoardVO board = new BoardVO();
	 board.setTitle("새로 작성하는 글");
	 board.setContent("새로 작성하는 내용");
	 board.setWriter("newbie");
	 
	 mapper.insert(board);
	 
	 log.info(board);
 }
 
 @Ignore
 @Test
 public void testInsertSelectKey() {
	 BoardVO board = new BoardVO();
	 board.setTitle("새로 작성하는 글 select Key");
	 board.setContent("새로 작성하는 내용 select Key");
	 board.setWriter("newbie");
	 
	 mapper.insertSelectKey(board);

	 log.info(board);
 }
 
 @Ignore
 @Test
 public void testGetBoard() {
	 BoardVO board = mapper.read(5L);
	 
	 log.info(board);
 }
 
 @Ignore
 @Test
 public void testDelete() {
	 log.info("delete count:"+mapper.delete(3L));
 }
 
 @Ignore
 @Test
 public void testUpdate() {
	 BoardVO board = new BoardVO();
	 board.setBno(5L);
	 board.setTitle("수정된 제목");
	 board.setContent("수정된 내용");
	 board.setWriter("user00");
	 
	   int count = mapper.update(board);
	 
	 log.info("UPDATECOUNT: "+count);
	 testGetBoard();
 }
 
 @Test
 public void testSearch() {
	 Criteria cri = new  Criteria();
	 cri.setKeyword("수정");
	 cri.setType("TC");
	
	 List<BoardVO> list = mapper.getListWithPaging(cri);
	 list.forEach(board -> log.info(board));
	 
	 int total=mapper.getTotalCount(cri);
	 log.info("전체건수:"+total);
 }
}
