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
           </nav>
        </div>
     </div>
	<div class = "main table"> 
	<table>
		<tr>
			<th>아이디 찾기</th>
		</tr>
		<tr>
			<th>NAME</th>
			<td>
    		<input type = "text" name = "name"/> 
			</td>   
		</tr>
		<tr>
			<th>BIRTH DAY</th>
			<td>
				<input type = "text" name = "birth"/>
			</td>
		</tr>
		<tr>
			<th>EMAIL</th>
			<td>
				<input type = "text" name = "email"/>
			</td>
		</tr>	
			<tr>
				<th colspan="2">
				<input type = "button" id = "idfind" value = "아이디찾기"/>
				<input type = "button" id = "" value = "취소" 
					onclick = "location.href='loginForm'"/>
				</th>
			</tr>
		</table>
	</div>
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
</body>
<script>
 $('#idfind').click(function() {

	var name = $('input[name="name"]').val();
	var birth = $('input[name="birth"]').val();   
	var email = $('input[name="email"]').val();
	console.log(name+'/'+birth +'/'+email);
	
	$.ajax({
		type:'POST',
		url : 'findid',
		data:{'name':name,
				'birth':birth, 
				'email':email},
		dataType : 'JSON',
		success : function (data) {
			if (data.success != '입력하신 정보와 일치하는 아이디가 없습니다.') {
				alert('고객님의 아이디는 '+ data.success+'입니다.');
				location.href = './loginForm';
			}else{
				alert('입력하신 정보가 일치 하지 않습니다. 다시 확인 후 입력바랍니다.');
			}
		},
		error : function (e) {
			console.log(e);
		}  
	});
 }); 	
</script>
</html>