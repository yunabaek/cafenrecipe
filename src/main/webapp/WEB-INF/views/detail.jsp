<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>	
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Cafe recipes</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="resources/css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="resources/css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="resources/images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="resources/css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <!-- owl stylesheets --> 
      <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
      <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
   	  <style>
   	  table, th, td {
		border: 1px solid #A4A4A4;
		border-collapse: collapse;
		padding : 5px 10px; 
		}
   	  </style>	
   </head>
<body>
     <!--header section start -->
     <div class="header_section">
        <div class="container-fluid">
           <nav class="navbar navbar-expand-lg navbar-light bg-light">
		   <div class=""><a href="main"><img src="resources/images/logo.png"></a></div>
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNav"> 
                 <ul class="navbar-nav ml-auto">
                 </ul>
              </div>
           </nav>
        </div>
     </div>
	<div>${loginBox}</div>
	<jsp:include page="loginBox.jsp"/>
	<h2>레시피 상세보기</h2>
		<table>
			<tr>
				<th>글번호</th>
				<td id = "smallContextBox">${info.idx}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td id = "smallContextBox">${info.subject} <b>(${info.bHit})</b></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td id = "smallContextBox">${info.name}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td id = "bicContextBox">${info.content}</td>
			</tr>
		</table><br/>
			<input type="button" onclick="location.href='./list'" value="리스트"/>
			<input type="button" onclick="del()" value="삭제"/>	
      		<br/>
      <!-- footer section start -->
      <div class="footer_section layout_padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-3 col-sm-6">
                  <h3 class="useful_text">About</h3>
                  <p class="footer_text">안녕하세요. </br> 카페 레시피를 공유하는 </br> "Cafe & recipes," 입니다.</p>
               </div>             
               <div class="col-lg-3 col-sm-6">
                  <h1 class="useful_text">Personal</h1>
                  <div class="footer_menu">
                     <ul>
                        <li><a href="#">개인정보 처리 방침</a></li>
                        <li><a href="#">서비스 이용 약관</a></li>
                        <li><a href="#">홈페이지 이용 약관</a></li>
                     </ul>
                  </div>
               </div>      
                <div class="col-lg-3 col-sm-6">
                  <h1 class="useful_text">Online Community</h1>
                  <div class="footer_menu">
                     <ul>
                        <li><a href="#">인스타그램</a></li>
                        <li><a href="#">페이스북</a></li>
                        <li><a href="#">유튜브</a></li>
                     </ul>
                  </div>
               </div>                                       
               <div class="col-lg-3 col-sm-6">
                  <h1 class="useful_text">Contact Us</h1>
                  <div class="location_text">
                     <ul>
                        <li><a href="">Address : 경기도 안양시 만안구 백유나로 900번길, 206</a></li>
                        <li><a href="">Call : +82 010.2324.3523</a></li>
                        <li><a href="">Email : baekyouna47@gmail.com</a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- footer section end -->
      <!-- copyright section start -->
      <div class="copyright_section">
         <div class="container">
            <p class="copyright_text">ⓒ 2022 Cafe recipe Company.<a href="https://html.design"> All Rights Reserved.</a></p>
         </div>
      </div>    
      <!-- copyright section end -->
      <!-- Javascript files-->
      <script src="resources/js/jquery.min.js"></script>
      <script src="resources/js/popper.min.js"></script>
      <script src="resources/js/bootstrap.bundle.min.js"></script>
      <script src="resources/js/jquery-3.0.0.min.js"></script>
      <script src="resources/js/plugin.js"></script>
      <!-- sidebar -->
      <script src="resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="resources/js/custom.js"></script>  
</body>
<script>
function del(){
	var yn = confirm("정말 이 글을 삭제 하시겠습니까?");
	
	if(yn){
		location.href='./delete?idx=${info.idx}';
	}
	
}
</script>
</html>