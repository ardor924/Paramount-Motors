<%@page import="kr.mr.model.VehicleDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/> --%>
<%@ include file="../inc/header.jsp" %>





<!-- CSS -->
<link rel="stylesheet" href="${ctx}/resources/css/vehicle_rental.css" />


<main>
  <div class="container">
    <%-- <c:forEach var="catList" items="${catList}"> --%>
    <%-- <c:forEach var="vDto" items="${vehicleList}"> --%>
    <div class="grid second-nav">
      <div class="column-xs-12">

        
      </div>
    </div>
    <div class="grid product">
      <div class="column-xs-12 column-md-7">
        <div class="product-gallery">
          <div class="product-image">
            <img class="active" src="${ctx}/resources/file_upload/${vDto.fileName}">
          </div>
          <ul class="image-list">      	
            <li class="image-item"><img src="${ctx}/resources/file_repo/${iDto.iName1}"></li>
            <li class="image-item"><img src="${ctx}/resources/file_repo/${iDto.iName2}"></li>
            <li class="image-item"><img src="${ctx}/resources/file_repo/${iDto.iName3}"></li>
            <li class="image-item"><img src="${ctx}/resources/file_repo/${iDto.iName4}"></li>
            <li class="image-item"><img src="${ctx}/resources/file_repo/${iDto.iName5}"></li>
            <li class="image-item"><img src="${ctx}/resources/file_repo/${iDto.iName6}"></li>
            <li class="image-item"><img class="active" src="${ctx}/resources/file_upload/${vDto.fileName}"></li>
          </ul>
        </div>
      </div>
      
      <div class="column-xs-12 column-md-5">
        <nav class="row">
		      <h4 class="breadcrumb-item">
		      	<c:if test="${vDto.category_fk eq '100'}">                                     
		        		<h4>차종 : 스포츠카</h4>
		        </c:if>
		      	<c:if test="${vDto.category_fk eq '200'}">                                     
		        		<h4>차종 : 세단</h4>
		        </c:if>
		      	<c:if test="${vDto.category_fk eq '300'}">                                     
		        		<h4>차종 : SUV</h4>
		        </c:if>
		      	<c:if test="${vDto.category_fk eq '400'}">                                     
		        		<h4>차종 : 전기차</h4>
		        </c:if>
		      </h4>					
        </nav>         
        <h1>${vDto.company} ${vDto.cName}</h1>     
        <h2>￦ ${vDto.wprice}원</h2>
        <div class="description">
        <p>${vDto.contents}</p>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
      	</div>
      	
 	<c:if test="${mDto.isRented == 'Y'}">
        <button class="add-to-cart" onclick='javascript:alert("차량은 1대만 구매 가능합니다. ")'>
        		렌트카 예약하기
        </button>
        </c:if>
 	<c:if test="${mDto.isRented != 'Y'}">
        <button class="add-to-cart" onclick="location.href='rentalSelector.do?cNum=${vDto.cNum}&id=${sessionScope.userId}'">
        		렌트카 예약하기
        </button>
        </c:if>
        <c:if test="${sessionScope.userId!= null}">
       <button  class="add-to-cart" onclick="location.href='wishList.do?cNum=${vDto.cNum}&id=${sessionScope.userId}'">
        		관심상품
        </button>
        </c:if>
        <c:if test="${sessionScope.userId == null}">
       <button class="add-to-cart" onclick="alert('기능을 이용하기 위해서는 로그인이 필요합니다.')">
        		관심상품
        </button>
        </c:if>
<%--         <button class="add-to-cart">
        	<a href="wishList.do?cNum=${vDto.cNum}&id=${sessionScope.userId}"/>
        	관심상품
        </button> --%>
      </div>
    </div>
    <%-- </c:forEach> --%>
    <%-- </c:forEach> --%>
    
    
    
    <div class="grid related-products" >
      <div class="column-xs-12 m-3" >
        <!-- <h4>관련상품</h4> -->
      <h3>
         <c:if test="${vDto.cSpec eq 'none'}">                                     
              <a href="#">차량 정보 : 일반차량</a>
           </c:if>
         <c:if test="${vDto.cSpec eq 'recommand'}">                                     
              <a href="#">차량 정보 : 추천</a>
           </c:if>
         <c:if test="${vDto.cSpec eq 'discount'}">                                     
              <a href="#">차량 정보 : 할인</a>
           </c:if>
           
           
           
           
           
         <c:if test="${vDto.cSpec eq 'hit'}">                                     
              <a href="#">차량 정보 : 인기</a>
           </c:if>
      </h3>
      </div>
          
   <c:set var="i" value="0" />
   <c:set var="j" value="4" />
   
   
   
   <table>
     <c:forEach var="vehicle" items="${vehicleList}">
       <c:if test="${vehicle.cSpec eq 'hit'}">      
			<a href="#">차량 정보 : 인기</a>
       <c:if test="${i % j == 0 }">
       <tr>
       </c:if>
       <td class="my-5">
      <div class="card mb-5" style="display:flex; max-height:300px ;max-width:350px;min-width: 350px">
              <ul class="image-list"> 
                 <li class="image-item">
                    <a href="vehicleRental.do?cNum=${vehicle.cNum}">
                       <img  src="${ctx}/resources/file_upload/${vehicle.fileName}">
                    </a>
                 </li>
              </ul>   
              <div>
                 <h4>${vehicle.company} - ${vehicle.cName}</h4>
                 <p class="price">${vehicle.price}원</p>
              </div>      
      </div>
      </td>         
       <c:if test="${i%j == j-1}">
       </tr>
       </c:if>
       <c:set var="i" value="${i+1}" />
       </c:if>
     </c:forEach>
   </table>
    </div>    
  </div>   
    


  
  
  
</main>

<%@ include file="../inc/footer.jsp" %>

<!-- JS -->
<script src="${ctx}/resources/js/vehicle_rental.js"></script>