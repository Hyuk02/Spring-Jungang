package org.zerock.controller;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration//콘트롤러 테스트용 어노테이션
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",//DAO,Service
									  "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})//Controller
@Log4j
public class BoardControllerTests {
	//웹 테스트용 설정 정보
	 @Setter(onMethod_=@Autowired)
       private WebApplicationContext ctx;
	 
	 //웹 테스트용 목업객체
	 private MockMvc mockMvc;
	 
	 @Before//@Test어노테이션으로 선언된 메소드 실행직전 실행됨..
	 public void setup() {
		 this.mockMvc=MockMvcBuilders.webAppContextSetup(ctx).build();
	 }
	 
	 //글 목록 테스트
	 @Ignore
	 @Test
	 public void testList() throws Exception{
		 log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/list")).andReturn().getModelAndView().getModelMap());
	 }
	 
	 //등록 테스트
	 @Ignore
	 @Test
	public void testRegister() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				                                                                                        .param("title","테스트 새글 제목")
				                                                                                        .param("content", "테스트 새글 내용")
				                                                                                        .param("writer", "user00"))
				                                     .andReturn().getModelAndView().getViewName()
				;
		log.info(resultPage);
	}
	 
	 //글 상세보기 테스트
	 @Ignore
	 @Test                                                                                                      //   /board/get?bno=5
	 public void testGet() throws Exception {//웹테스트, jsp나 html에서  parameter-> controller로 전달 , Integer.parseInt(request.getParameter("bno"))
		 log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get").param("bno","5")).andReturn().getModelAndView().getModelMap());
	 }
	        
	 //글 수정 테스트
	 @Ignore
	 @Test
	 public void testModify() throws Exception{
		 /*    localhost:8181/board/modify?bno=1&title=제목&title=내용&writer=user00 */
		 MultiValueMap<String, String> map=new LinkedMultiValueMap<String, String>();
		 map.add("bno", "1");
		 map.add("title","1수정된 테스트 새글 제목");
		 map.add("content","1수정된 테스트 새글 내용");
		 map.add("writer","user00");
		 
		 String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")//post 방식 전달
				 																						 .params(map)
				                                                                                         /*.param("bno", "1")
				                                                                                         .param("title","수정된 테스트 새글 제목")
				                                                                                         .param("content","수정된 테스트 새글 내용")
				                                                                                         .param("writer","user00") */)
				                                     .andReturn().getModelAndView().getViewName();
		 log.info(resultPage);
	 }
	 
	 //글 삭제 테스트
	 @Ignore
	 @Test
	 public void testDelete() throws Exception{
		 String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove").param("bno", "4"))
				                                     .andReturn().getModelAndView().getViewName();
		 log.info(resultPage);
	 }
	 
	 //글 조회 
	 @Test
	 public void testGetList() throws Exception {
		 String  resultPage = mockMvc.perform(MockMvcRequestBuilders.get("/board/list")
				                                      .param("pageNum", "1")
				                                      .param("amount", "10"))
				                                      .andReturn().getModelAndView().getViewName();
		 log.info(resultPage);
	 }
}




