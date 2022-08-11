<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../inc/header.jsp" %>

<!-- Personal CSS -->
<link rel="stylesheet" href="${ctx}/resources/css/myPageList.css">

<script type="text/javascript">
	function showMsg(){
		window.confirm("취소 하시게요?.....");
		document.location.href="revCancle.do";
	}
	function delMsg(){
		alert("삭제.. 할건가요??");
		document.location.href="#";
	}
</script>

<body style="background-color:#111; color:#fff">
<div id="myPageList">
<div class="layout">
	<div class="container">
		<div class="container mt-3" style="">
			<div class="mt-3 mb-3 p-3 text-white rounded" style="background-color: rgba(70, 70, 70, 0.5)">
			  <h1><i class="xi-paper"></i>&nbsp;마이페이지</h1> 
			</div>
		</div>
		<div class="d-flex justify-content-between">
			<div class="card col-md-4 mt-5 h-25" style="background-color: rgba(255, 255, 255, 0.050); width:49%">
				<table class="table table-borderless">
					<thead>
						<tr class="table-dark">
							<th class="col-6"><i class="xi-walk"></i> &nbsp;${sessionScope.userName}님의 정보</th> 
							<th class="col-3">
								<button class="custom-btn btn-5" onclick="location.href='myMemberModify.do?mId=${member.id}'"><span>상세정보 보기</span></button>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>이메일</td>
							<td>${member.email}</td>
						</tr>
						<tr>
							<td>휴대폰</td>
							<td>${member.tel}</td>
						</tr>
						<tr>
							<td>주소</td>
							<td>${member.detailAddr}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="card col-md-4 mt-5 h-25 w-50" style="background-color: rgba(255, 255, 255, 0.050); width:49%">
				<table class="table table-borderless">
					<thead>
						<tr class="table-dark">
							<th class="col-6"><i class="xi-walk"></i> &nbsp;나의 쇼핑정보</th>
							<th class="col-3">
								<button class="custom-btn btn-5" onclick="location.href='myInvoice.do'"><span>최근 구매내역 보기</span></button>
							</th>
						</tr>
					</thead>
						<tbody>
						<tr>
							<td>현재 예약된 차량 : </td>
							<td>${vDto.cName}</td>
						</tr>
						<tr>
							<td>교환/반품 주문</td>
							<td>0건</td>
						</tr>
						<tr>
							<td>나의 Point</td>
							<td>0 P</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		
		
			<c:if test="${hDto == null}">
			<div class="container mt-5">
				<h2><i class="xi-cart-o"></i> &nbsp;주문내역</h2>            
				<table class="table mt-3" style="color:#fff">
					  <thead>
						<tr>
						  <th>사진</th>
						  <th>렌트일자</th>
						  <th>반납일자</th>
						  <th>차량명</th>
						  <th>주문금액</th>
						  <th>취소</th>
						</tr>
					  </thead>
				</table>
						<h2 class="text-center">진행중인 주문내역이 없습니다.</h2>
					<table class="table mt-3" style="color:#fff">
					  <thead>
						<tr>
						  <th></th>				
						</tr>
					  </thead>
				</table>	

				</div>
				</c:if>
				
			<c:if test="${hDto != null}">
			<div class="container mt-5">
				<h2><i class="xi-cart-o"></i> &nbsp;주문내역</h2>            
				<table class="table mt-3" style="color:#fff">
					  <thead>
						<tr>
						  <th>사진</th>
						  <th>렌트일자</th>
						  <th>반납일자</th>
						  <th>차량명</th>
						  <th>주문금액</th>
						  <th>취소</th>
						</tr>
					  </thead>
					  <tbody>
							<tr>
							  <td style="align-items-middle">
								<img style="widows: 160px; height: 140px" src="${ctx}/resources/file_upload/${hDto.fileName}">
						  	  </td>							  
							  <td style="align-items-middle">${hDto.revDate1}</td>
							  <td>${hDto.revDate2}</td>
							  <td>${hDto.cName}</td>
							  <td>${hDto.wtotalPrice}</td>
							  <td>
							     <div id="close_btn">
								 	<button class="close" onclick="location.href='#'; javascript:showMsg()">예약취소</button>
								 </div>
							  </td>
							</tr>
					</tbody>
				</table>
				</div>
				</c:if>

				<div class="container mt-5">
					<div class="wish_header d-flex" style="justify-content: space-between;">
						<h2><i class="xi-heart"></i> &nbsp;위시리스트</h2>
					</div>
					
						<c:if test="${wishList == null}">    
							<div>위시리스트가 없습니다.</div>
						</c:if>		
										          
					<table class="table mt-3" style="color:#fff;">
					  <thead>
						<tr>
						  <th>사진</th>
						  <th>차량정보</th>
						  <th>가격</th>
						  <th>예약하기</th>
						  <th>삭제</th>
						</tr>
					  </thead>
					  <tbody>
						<c:if test="${wishList != null}">
      					<c:forEach var="wDtos" items="${wishList}">					  
						<tr>
						  <td>
							<img style="widows: 60px; height: 40px" src="${ctx}/resources/file_upload/${wDtos.fileName}">
						  </td>
						  <td>
							<p>${wDtos.company} ${wDtos.cName}</p>
						  </td>
						  <td>
						  	￦ ${wDtos.price}원
						  </td>
							<td>
					    		<button class="custom-btn btn-5" onclick="location.href='rentalSelector.do?cNum=${wDtos.cNum}&id=${wDtos.id}'">
					    			<span>예약하기</span>
					    		</button>
						  	</td>
							<td>
								<button  class="remove custom-btn btn-5" onclick="location.href='deleteWishList.do?cNum=${wDtos.cNum}&id=${wDtos.id}'; javascript:delMsg()">
									<span>삭제</span>
								</button>								 
							</td>
						</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>				  
		</div>
	</div>
</div>
</body>

<%@ include file="../inc/footer.jsp" %>







