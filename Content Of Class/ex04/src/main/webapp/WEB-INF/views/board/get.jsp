<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>    

<div class="row">
	<div class="col-lg-12">
	    <h1 class="page-header">글 상세 보기</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!--  /.row -->

<!-- 본문 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-info">
			<div class="panel-heading"> 글 상세 보기 페이지</div>
			<!--  /.panel-heading -->
			<div class="panel-body">
				
				<div class="form-group">
					<label>글번호</label>
					<input class="form-control" name="bno" value='<c:out value="${board. bno }"/>' readonly>
				</div>
				
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" name="title" value='<c:out value="${board. title }"/>' readonly>
				</div>
				
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="3" name="content" readonly>
					       <c:out value="${board.content }"/>
					 </textarea>
				</div>
				
				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="writer" value='<c:out value="${board.writer }"/>' readonly>
				</div>
				
				<button data-oper='modify' class="btn btn-primary">수정</button>
				<button data-oper='list' class="btn btn-default">글목록</button>
 				
				<!--  이동할 폼 생성  -->
				<form id='operForm' action="/board/modify" method="get">
				<input type="hidden" id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
				<input type="hidden" id='pageNum' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type="hidden" id='amount' name='amount' value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" id='keyword' name='keyword' value='<c:out value="${cri.keyword}"/>'>
				<input type="hidden" id='type' name='type' value='<c:out value="${cri.type}"/>'>
				</form>
				
			</div><!--  end panel-body -->
		</div><!-- end panel-info -->
	</div><!-- end panel -->

</div><!--  /.row -->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">댓글 팝업창</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                               <label>답변내용</label>
                                               <input type="text" class="form-control" name='reply' value='새로운 댓글!!!'>
                                            </div>
                                            <div class="form-group">
                                               <label>작성자</label>
                                               <input type="text" class="form-control" name='replyer' value='작성자'>
                                            </div>
                                            <div class="form-group">
                                               <label>작성일자</label>
                                               <input type="text" class="form-control" name='replyDate' value='2020-09-16 15:50'>
                                            </div>
                                            
                                        </div>
                                        <div class="modal-footer">
                                            <button id='modalModBtn' type="button" class="btn btn-warning" >수정</button>
                                            <button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
                                            <button id='modalRegisterBtn' type="button" class="btn btn-default" >등록</button>
                                            <button id='modalCloseBtn' type="button" class="btn btn-primary">닫기</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->



<div class='row'>
	<div class='col-lg-12'>
		
	<div class='panel panel-default'>
	   <div class='panel-heading'>
	     <i class="fa fa-comments fa-fw"></i>댓글
	<button id='addReplyBtn' class="btn btn-primary btn-xs pull-right">댓글달기</button>
	   </div>
	
	<div class="panel-body">
	        <ul class="chat">
	        
	        </ul>
	      
	</div>
	   <div class="panel-footer"></div>
		
		</div>
		</div>

</div>




<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
$(document).ready(function () {
  
  var bnoValue = '<c:out value="${board.bno}"/>';
  var replyUL = $(".chat");
  
    showList(1);
    
function showList(page){
	
	  console.log("show list " + page);
    
    replyService.getList({bno:bnoValue,page: page|| 1 }, function(replyCnt, list) {
      
    console.log("replyCnt: "+ replyCnt );
    console.log("list: " + list);
    console.log(list);
    
    if(page == -1){
      pageNum = Math.ceil(replyCnt/10.0);
      showList(pageNum);
      return;
    }
      
     var str="";
     
     if(list == null || list.length == 0){
       return;
     }
     
     for (var i = 0, len = list.length || 0; i < len; i++) {
       str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
       str +="  <div><div class='header'><strong class='primary-font'>["
    	   +list[i].rno+"] "+list[i].replyer+"</strong>"; 
       str +="    <small class='pull-right text-muted'>"
           +replyService.displayTime(list[i].replyDate)+"</small></div>";
       str +="    <p>"+list[i].reply+"</p></div></li>";
     }
     
     replyUL.html(str);
     
     showReplyPage(replyCnt);

 
   });//end function
     
 }//end showList
    
    var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    function showReplyPage(replyCnt){
      
      var endNum = Math.ceil(pageNum / 10.0) * 10;  
      var startNum = endNum - 9; 
      
      var prev = startNum != 1;
      var next = false;
      
      if(endNum * 10 >= replyCnt){
        endNum = Math.ceil(replyCnt/10.0);
      }
      
      if(endNum * 10 < replyCnt){
        next = true;
      }
      
      var str = "<ul class='pagination pull-right'>";
      
      if(prev){
        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
      
      for(var i = startNum ; i <= endNum; i++){
        
        var active = pageNum == i? "active":"";
        
        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      if(next){
        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
      }
      
      str += "</ul></div>";
      
      console.log(str);
      
      replyPageFooter.html(str);
    }
     
    replyPageFooter.on("click","li a", function(e){
       e.preventDefault();
       console.log("page click");
       
       var targetPageNum = $(this).attr("href");
       
       console.log("targetPageNum: " + targetPageNum);
       
       pageNum = targetPageNum;
       
       showList(pageNum);
     });     

    
/*     function showList(page){
      
      replyService.getList({bno:bnoValue,page: page|| 1 }, function(list) {
        
        var str="";
       if(list == null || list.length == 0){
        
        replyUL.html("");
        
        return;
      }
       for (var i = 0, len = list.length || 0; i < len; i++) {
           str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
           str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>"; 
           str +="    <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
           str +="    <p>"+list[i].reply+"</p></div></li>";
         }


    replyUL.html(str);

      });//end function
      
   }//end showList */
   
    var modal = $(".modal");
    var modalInputReply = modal.find("input[name='reply']");
    var modalInputReplyer = modal.find("input[name='replyer']");
    var modalInputReplyDate = modal.find("input[name='replyDate']");
    
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");
    
    $("#modalCloseBtn").on("click", function(e){
    	
    	modal.modal('hide');
    });

    //댓글 등록모달 팝업 뛰우기
    $("#addReplyBtn").on("click", function(e){
      
      modal.find("input").val("");
      modalInputReplyDate.closest("div").hide();
      modal.find("button[id !='modalCloseBtn']").hide();
      
      modalRegisterBtn.show();
      
      $(".modal").modal("show");
      
    });
    
  //댓글 등록 모달 팝업 창에서 댓글 입력 후 등록 버튼 누름 이벤트 처리
    modalRegisterBtn.on("click",function(e){
      //JSON 객체 생성
      var reply = {
            reply: modalInputReply.val(),
            replyer:modalInputReplyer.val(),
            bno:bnoValue
          };
      replyService.add(reply, function(result){
        
        alert(result);
        
        modal.find("input").val("");//모달의 input태그 값 초기화
        modal.modal("hide");//모달 숨기기
        
        //showList(1);
        showList(-1);//댓글 등록후 페이지 번호를 -1로 전달하여 전체 건수 및 페이징 재처리 요청.
        
      });
      
    });


  //댓글 조회 클릭 이벤트 처리 
    $(".chat").on("click", "li", function(e){
      
      var rno = $(this).data("rno");
      
      replyService.get(rno, function(reply){
      
        modalInputReply.val(reply.reply);
        modalInputReplyer.val(reply.replyer);
        modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
        .attr("readonly","readonly");
        modal.data("rno", reply.rno);
        
        modal.find("button[id !='modalCloseBtn']").hide();
        modalModBtn.show();
        modalRemoveBtn.show();
        
        $(".modal").modal("show");
            
      });
    });
  
    
/*     modalModBtn.on("click", function(e){
      
      var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
      
      replyService.update(reply, function(result){
            
        alert(result);
        modal.modal("hide");
        showList(1);
        
      });
      
    });

    modalRemoveBtn.on("click", function (e){
    	  
  	  var rno = modal.data("rno");
  	  
  	  replyService.remove(rno, function(result){
  	        
  	      alert(result);
  	      modal.modal("hide");
  	      showList(1);
  	      
  	  });
  	  
  	}); */

    //댓글 수정 이벤트 처리
    modalModBtn.on("click",function(e){
        //JSON객체 생성
		var reply={rno:modal.data("rno"), reply:modalInputReply.val(), bno:bnoValue};


        //update(객체,콜백함수) 2개만 매개변수로 넘김.
		replyService.update(reply,function(result){
					alert(result);

					modal.modal("hide");//팝업창 숨기기
					showList(pageNum);//페이징 처리 후 페이지 재생성 
			});

        });


  	
		//댓글 삭제 이벤트 처리
		modalRemoveBtn.on("click",function(){
			var rno=modal.data("rno");

			//alert(rno);

			replyService.remove(rno, function(result){
				alert(result);//얼럿창 보이기

				modal.modal("hide");//모달 숨기기
				showList(pageNum);//페이지 다시 생성
				});
			});
		
});//$().ready(function(){}) 끝.
</script>



<script>

/* console.log("===============");
console.log("JS TEST");

var bnoValue = '<c:out value="${board.bno}"/>'; */

//for replyService add test
/* replyService.add(
    
    {reply:"JS Test", replyer:"tester", bno:bnoValue}
    ,
    function(result){ 
      alert("RESULT: " + result);
    }
); */


//reply List Test
/* replyService.getList({bno:bnoValue, page:1}, function(list){
    
	  for(var i = 0,  len = list.length||0; i < len; i++ ){
	    console.log(list[i]);
	  }
});
 */

 
/*  //17번 댓글 삭제 테스트 
 replyService.remove(17, function(count) {

   console.log(count);

   if (count === "success") {
     alert("REMOVED");
   }
 }, function(err) {
   alert('ERROR...');
 });
 */
 

//12번 댓글 수정 
/* replyService.update({
  rno : 12,
  bno : bnoValue,
  reply : "Modified Reply...."
}, function(result) {

  alert("수정 완료...");

});  
 */

</script>  


<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/board/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/board/list")
    operForm.submit();
    
  });  
});
</script>

<%@ include file="../includes/footer.jsp"%>