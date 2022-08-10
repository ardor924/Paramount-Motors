<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/header.jsp" %>

   <style>
       .ui-widget-header { border: 0px solid #dddddd; background: #fff; } 
      
      .ui-datepicker-calendar>thead>tr>th { font-size: 14px !important; } 
      
      .ui-datepicker .ui-datepicker-header { position: relative; padding: 10px 0; } 
      
      .ui-state-default,
      .ui-widget-content .ui-state-default,
      .ui-widget-header .ui-state-default,
      .ui-button,
      html .ui-button.ui-state-disabled:hover,
      html .ui-button.ui-state-disabled:active { border: 0px solid #c5c5c5; background-color: transparent; font-weight: normal; color: #454545; text-align: center; } 
      
      .ui-datepicker .ui-datepicker-title { margin: 0 0em; line-height: 16px; text-align: center; font-size: 14px; padding: 0px; font-weight: bold; } 
      
      .ui-datepicker { display: none; background-color: #fff; border-radius: 4px; margin-top: 10px; margin-left: 0px; margin-right: 0px; padding: 20px; padding-bottom: 10px; width: 300px; box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1); } 
      
      .ui-widget.ui-widget-content { border: 1px solid #eee; } 
      
      #datepicker:focus>.ui-datepicker { display: block; } 
      
      .ui-datepicker-prev,
      .ui-datepicker-next { cursor: pointer; } 
      
      .ui-datepicker-next { float: right; } 
      
      .ui-state-disabled { cursor: auto; color: hsla(0, 0%, 80%, 1); } 
      
      .ui-datepicker-title { text-align: center; padding: 10px; font-weight: 100; font-size: 20px; } 
      
      .ui-datepicker-calendar { width: 100%; } 
      
      .ui-datepicker-calendar>thead>tr>th { padding: 5px; font-size: 20px; font-weight: 400; } 
      
      .ui-datepicker-calendar>tbody>tr>td>a { color: #000; font-size: 12px !important; font-weight: bold !important; text-decoration: none;}
      
      .ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover { cursor: auto; background-color: #fff; } 
      
      .ui-datepicker-calendar>tbody>tr>td { border-radius: 100%; width: 44px; height: 30px; cursor: pointer; padding: 5px; font-weight: 100; text-align: center; font-size: 12px; } 
      
      .ui-datepicker-calendar>tbody>tr>td:hover { background-color: transparent; opacity: 0.6; } 
      
      .ui-state-hover,
      .ui-widget-content .ui-state-hover,
      .ui-widget-header .ui-state-hover,
      .ui-state-focus,
      .ui-widget-content .ui-state-focus,
      .ui-widget-header .ui-state-focus,
      .ui-button:hover,
      .ui-button:focus { border: 0px solid #cccccc; background-color: transparent; font-weight: normal; color: #2b2b2b; } 
      
      .ui-widget-header .ui-icon { background-image: url('./btns.png'); } 
      
      .ui-icon-circle-triangle-e { background-position: -20px 0px; background-size: 36px; } 
      
      .ui-icon-circle-triangle-w { background-position: -0px -0px; background-size: 36px; } 
      
      .ui-datepicker-calendar>tbody>tr>td:first-child a { color: red !important; } 
      
      .ui-datepicker-calendar>tbody>tr>td:last-child a { color: #0099ff !important; } 
      
      .ui-datepicker-calendar>thead>tr>th:first-child { color: red !important; } 
      
      .ui-datepicker-calendar>thead>tr>th:last-child { color: #0099ff !important; } 
      
      .ui-state-highlight,
      .ui-widget-content .ui-state-highlight,
      .ui-widget-header .ui-state-highlight { border: 0px; background: #f1f1f1; border-radius: 50%; padding-top: 10px; padding-bottom: 10px; } 
      
      .inp { padding: 10px 10px; background-color: #f1f1f1; border-radius: 4px; border: 0px; } 
      
      .inp:focus { outline: none; background-color: #eee; } 
   </style>
   
   
   
   
   
   
   
   

   <body style="background-color:#111; color:#fff">
   <form action="longdaypayment.do?price=${vDto.price}" method="post">
    <div class="container p-3 my-5 bg-secondary text-white">
        <h1>렌트 예약</h1>
    </div>
    <div class="container">
        <table class="table" style="color: #fff;">
            <thead>
                <tr class="table-dark">
                    <th>장기렌트</th>
                </tr>
            </thead>
            <tbody>
               <tr>
                    <td>차량번호</td>
                    <td><input value="${vDto.cNum}" name="cNum" type="text" class="form-control" id="exampleFormControlInput1" readonly></td>
                </tr>
                <tr>
                    <td>모델</td>
                    
                    <td>
                       <img src="${ctx}/resources/file_upload/${vDto.fileName}"
                        style="max-width: 300px; min-width:150px; max-height:auto; min-height: auto;">
                    </td>
                </tr>
            
                <tr>
                    <td>이름</td>
                    <td><input name="revName" type="name" class="form-control" id="exampleFormControlInput1" placeholder="Input Name"></td>
                </tr>
                <tr>
                    <td>주민번호</td>
                    <td><input name="revJumin1" type="rrn_first" class="form-control" id="exampleFormControlInput" placeholder="Input rrn"></td>
                    <td><input name="revJumin2" type="rrn_second" class="form-control" id="exampleFormControlInput" placeholder="Input rrn"></td>
                </tr>
                <tr>
                    <td>연락처</td>
                    <td><input name="revTel" type="tel" class="form-control" id="exampleFormControlInput1" placeholder="010-xxxx-xxxx"></td>
                </tr>
                <tr>
                    <td>렌트지역</td>
                    <td>
                        <div class="form-check">
                            <input name="revAddr" class="form-check-input" type="radio" id="flexRadioDefault1" value="서구점">
                            <label class="form-check-label" for="flexRadioDefault1">
                              서구지점
                            </label>
                          </div>
                    </td>
<!-- 
                    <td>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                            <label class="form-check-label" for="flexRadioDefault1">
                              유성지점
                            </label>
                          </div>
                    </td>
 -->
                </tr>
                <tr>
                    <td>사용일시</td>
                    <td><i class="fa-solid fa-calendar-days"></i> 배차일 <input type="text" name="datepicker1" id="datepicker1" placeholder="날짜선택"></td>
                    <td><i class="fa-solid fa-calendar-days"></i> 반납일 <input type="text" name="datepicker2" id="datepicker2" placeholder="반납날짜선택(최대90일)"></td> 
                </tr>
               <tr>
                    <td>1일가격</td>
                    <td><span>${vDto.wprice}원</span></td>
                </tr>                  
            </tbody>
        </table> 
        <div class="container" style="margin-top: 100px; color: slategray;">
            <h2 style="color: #FFF;"> 개인정보 수집 및 이용에 대한 동의 </h2>
            개인정보 수집 이용에 대한 본인 동의가 필요한 항목입니다.
                
                개인정보의 수집 및 이용 목적
                (주)5조렌트카는 예약 내용의 확인, 요청사항 처리 및 완료 등 원활한 상담을 제공하기 위해 개인정보를 수집하고 있습니다
                
                수집하는 개인정보 항목
                아래 작성한 모든 개인 정보
                
                개인정보의 보유기간 및 이용기간
                개인정보의 보유기간 및 이용기간상담 예약 접수 시점 및 상담 완료 후 6개월이며, 세부 사항은 ‘개인정보처리방침’을 확인하여 주십시오.
                
                (단, 관련 법령에 의거 보존할 필요성이 있는 경우에는 관련 법령에 따라 보존 가능)
        </div>
                <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
            <label class="form-check-label" for="flexCheckDefault">
            이용약관에 동의합니다(필수)
            </label>
        </div>
        
        <div class="container" style="margin-top: 100px; color: slategray;">
            <h2 style="color: #FFF;"> 가격 정책 대한 동의 </h2>
    			차량 1대의 가격은 각각의 날짜에 합산하여 가격이 책정됩니다.
    			
        </div>
        
        <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
            <label class="form-check-label" for="flexCheckDefault">
            가격 정책에 동의합니다(필수)
            </label>
        </div>
        
            <div colspan='2' align='center'>               
                <input type='submit' value='예약하기' class='btn btn-primary'/>    
                <input type='reset' value='취소' class='btn btn-danger'/>    
            </div>   

            <script>
            $(function(){
             
                $.datepicker.regional['ko'] = {
                 closeText: '닫기',
                 prevText: '이전달',
                 nextText: '다음달',
                 currentText: '오늘',
                 monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
                 '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월',
                 '7월','8월','9월','10월','11월','12월'],
                 dayNames: ['일','월','화','수','목','금','토'],
                 dayNamesShort: ['일','월','화','수','목','금','토'],
                 dayNamesMin: ['일','월','화','수','목','금','토'],
                 weekHeader: 'Wk',
                 dateFormat: 'yy-mm-dd',
                 firstDay: 0,
                 isRTL: false,
                 showMonthAfterYear: true,
                 yearSuffix: '',
                 showOn: 'both',
                 buttonText: "달력",
                 changeMonth: true,
                 changeYear: false,
                 showButtonPanel: true,
                 yearRange: 'c-99:c+99',
                 
                
                /*  maxDate: new Date('2022-10-31')   */
             };
             $.datepicker.setDefaults($.datepicker.regional['ko']);
                  
          
               
                $('#datepicker1').datepicker();
               
                $('#datepicker1').datepicker("option", "minDate", 0 );
                $('#datepicker1').datepicker("option", "onClose", function (selectedDate) {
                    $("#datepicker2").datepicker( "option", "minDate", selectedDate );
                    
                    var date = $(this).datepicker('getDate');                                                                 
                    date.setDate(date.getDate() +90);
                    $('#datepicker2').datepicker("option", "maxDate", date);
                 });
                
               $('#datepicker2').datepicker(); 
 
               
               
            });  
            </script>
            
            
            
            
            
        </div> 
<!--         </form> -->
    </body>
<%@ include file="../inc/footer.jsp" %>