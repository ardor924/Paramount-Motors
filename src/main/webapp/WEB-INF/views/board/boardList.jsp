<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<%@ include file="../inc/header.jsp" %>


<script type="text/javascript">
	/* 자바스크립트 코드는 웹 브라우저가 문서의 모든 요소를 로드한 뒤에 실행해야 한다. : $(document).ready(function())
		- js함수를 사용하기 전에 브라우저가 준비가 되어야 한다는 뜻?(페이지 로딩중..) */
	$(document).ready(function(){
		
	/* 181줄 코드, (글쓰기 버튼)id btn-write를 클릭 했을 때 페이지 이동, location.href = "이동할 페이지 주소"; */
	if(${sessionScope.userId == 'admin'}){
		
	$("#btn-write").click(() => {
         location.href="<c:url value='boardRegister.do?viewPage=${bp.viewPage}'/>";
      })
	}else if(${sessionScope.userId != 'admin'}){
		$("#btn-write").click(() => {
			alert("관리자가 아닙니다.");
	      })
	}
	
	
      /* 
      jQuery
      - 부트스트랩 같이 jQuery에서 제공하는 $()같은 코드나 함수를 사용하면 특정 기능을 짧은 문법으로 사용할 수 있다.
      # : id 속성
      $() : ()안을 HTML요소, css선택자 등등.. 매개변수로 지정하여 동작한다.
      */
      /************* 페이징 ***************/
      var moveForm =$("#moveForm"); /* moveForm 선언 */
      
      /* class="page-item"과 <a>을 클릭 했을 때 이벤트 처리 후 이벤트 중단 */
      $(".page-item a").on("click", function(e){
         e.preventDefault();/* 이벤트 동작 중단 함수 */
         
         
        /*
         	val() : value 값
        	attr() : 속성 추가 및 제거		
        find : input의 하위요소 name 을 찾는 역할
        input태그의 name(viewPage)을 찾아서 
        val()함수로 value값 : this(url 정보)를 가져와서 
        $(this)에 href 속성 추가
        submit 전송
         
        this : viewPage
        */
        
        
         moveForm.find("input[name='viewPage']").val($(this).attr("href"));
         moveForm.submit();
      }); 
       
      /************* 글 상세보기 ***********/
      /* 149줄 */
      /* class="goView"에 on("clilck")으로 동적 바인딩(묶음) 후 클릭 이벤트 처리 */
      
      if(${sessionScope.userId !=null || sessionScope.userId != ''}){
    	  
	      $(".goView").on("click", function(e){ // goView 클릭 시 ~ 이벤트 실행
	         e.preventDefault();
	         
	         moveForm.append("<input type='hidden' name='bid' value='"+
	               $(this).attr("href")+"'>");
	         moveForm.attr("action", "boardView.do"); 
	         /*
	         moveform에 action 속성 추가, 속성값: view.do로 이동
	     	 action : 폼 데이터(form data)를 서버로 보낼 때 해당 데이터가 도착할 url을 입력
	       	 */
	         moveForm.submit();
	      });
	      
	      
	      
	      
      }
      
      /************* 검색 ****************/
      var sf = $("#searchForm");/* 88줄 */
      
      /* 107줄 */
      $("#btn-search").on("click", function(e){
         if(!sf.find("input[name='keyWord']").val()){
            alert("키워드를 입력하세요!!");
            $("#keyWord").focus();
            return false;
         }
         
         sf.submit();
      });
   });
</script>


<div class="container mt-5 p-3 border bg-dark">
<h3 style="color:white">공지사항</h3>
	<div>
		<form action="boardList.do" method="get" id="moveForm"><!-- 검색 데이터 객체 -->
		   <input type="hidden" name="viewPage" value="${bp.viewPage}"/>
		   <input type="hidden" name="searchType" value="${vo.searchType}"/>
		   <input type="hidden" name="keyWord" value="${vo.keyWord}"/>
		</form>
		
 		<form id="searchForm" method="post" action="boardList.do">
		   <div class="d-flex justify-content-end">
		   
		      <!-- 검색 >> BoardMapper.java -->
 		      <select class="form-select me-2" name="searchType" 
		         style="width:100px; background:#212529; color:white;">
		         <option
		            <c:out value="${vo.searchType == null ? 'selected':''}"/>>선택</option>
		         <option value="S"
		            <c:out value="${vo.searchType == 'S' ? 'selected':''}"/>>제목</option>
		         <option value="C"
		            <c:out value="${vo.searchType eq 'C' ? 'selected':''}"/>>내용</option>
		         <option value="W"
		            <c:out value="${vo.searchType eq 'W' ? 'selected':''}"/>>글쓴이</option>
		      </select>
		      
		      <!-- 검색창 -->
		      <input class="form-control rounded-0 rounded-start" type="text" 
		         id="keyWord" name="keyWord" placeholder="Search" 
		         style="width:250px; background:#212529; color:white;" value="${vo.keyWord}"> <!-- DB에 저장된 데이터와 비교 -->
		         
		      <!-- 검색버튼 -->
		      <button id="btn-search " class="btn btn-outline-success rounded-0 rounded-end" 
		         style="width:40px; background:#212529; color:white" ><i class="fa fa-search"></i></button> 
		   </div>
		</form>
	</div>
<!-- BoardController : BoardPaging bp = new BoardPaging(totalCnt, viewPage, cntPerPage); -->
<div class="m-0 my-1"><b>${bp.viewPage}</b> / ${bp.totalPage} pages</div><!-- 현재 페이지 -->
	<table class="boardtable table table-hover">
	   <thead style="background:#1111; color:white">
	      <tr>
	         <th>번호</th>
	         <th>제목</th>
	         <th>글쓴이</th>
	         <th>등록일</th>  
	         <th>조회수</th>
	         
	      </tr>
	   </thead>
	   <tbody style="color:white"><!-- 게시판 글 리스트 제공  -->
	      <c:set var="bno" value="${bp.startRowNum}"/>
	      <c:forEach var="lvo" items="${list}"><!-- 선언 -->
	      <tr>
	<%-- <td>${vo.bid}</td> --%>
	
		<!-- 테이블: 번호 제목 글쓴이 등록일 조회수 -->
	         <td>${bno}</td>
	         <td><a class="goView" style="color:#c36f51" href="<c:url value='${lvo.bid}'/>">${lvo.subject}</a></td>
	         <td>${lvo.writer}</td>
	         <td><fmt:formatDate pattern="yyyy-MM-dd" value="${lvo.regDate}"/></td>
	         <td>${lvo.hit}</td>
<%-- 	         <td> 
		         <c:if test="${sessionScope.userId !=null && sessionScope.userId !=''}">
		         	<c:if test="${sessionScope.userId == 'admin'}">
		         		<button type="button" id="btn-delete" class="btn btn-primary me-2">삭제</button>
		         	</c:if>
		         </c:if>
		         <c:if test="${sessionScope.userId != 'admin'}">
               <button type="button" id="btn-delete" class="btn btn-primary me-2" hidden>삭제</button>
            </c:if>
	         </td> --%>
	      </tr>
	      <c:set var="bno" value="${bno-1}"/>
	      </c:forEach>
	   </tbody>
	</table>
	
	<!-- 페이지 네비게이션(블럭) -->
	<ul class="pagination justify-content-center my-5 ">
	  <li class="page-item ${bp.prevPage <=0 ? 'disabled' : ''}"><!--이전 페이징 블럭이 0이하 일 경우, 이전 버튼 비활성화-->
		     <a class="page-link" href="${bp.prevPage}" style="color:black" ><<</a>
	  </li>
	  
	  <c:forEach var="i" begin="${bp.blockStart}" end="${bp.blockEnd}">
	  <!-- 선언된 i범위 : begin부터 end까지 
		begin : 반복(c:forEach)에 사용될 첫 번째 항목의 index 
		end : 반복에 사용될 마지막 항목의 index -->
	  
	     <li class="page-item ${bp.viewPage == i ? 'active':''}"><!-- 현재 페이지가 i일 경우 active(현재위치표시역할) -->
	        <a class="page-link" style="color:white" href="${i}">${i}</a><!-- i로 페이지 이동 -->
	     </li>
	  </c:forEach>
	  
	  <li class="page-item ${bp.blockEnd >= bp.totalPage ? 'disabled': ''}">
	  					<!-- 전체게시글 수가 페이징 블럭의 끝번호 보다 작을 경우 disabled(버튼 비활성화) -->
	  
	     <a class="page-link" style="color:white" href="${bp.nextPage}">>></a>
	  </li>
	</ul>
	
	<div class="text-center">
		<button class="btn btn-outline-white" id="btn-write">글쓰기</button>
	</div>
</div>

<%@ include file="../inc/footer.jsp" %>