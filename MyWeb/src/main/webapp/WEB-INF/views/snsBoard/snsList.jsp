<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- 
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>인덱스를 만들어 보자</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    개인 디자인 추가
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
 -->
   <style type="text/css">
   section {
      margin-top: 70px;
   }
   
   /*부트스트랩 li의 drophover클래스 호버시에 드롭다운 적용코드*/
   ul.nav li.drophover:hover>ul.dropdown-menu {
      display: block;
      margin: 0;
   }
   
   .aside-inner {
      position: fixed;
      top: 70px;
      width: 180px;
   }
   
   .section-inner {
      border-right: 1px solid #ddd;
      border-left: 1px solid #ddd;
      background-color: white;
   }
   
   .section-inner p, .aside-inner p {
      margin: 0;
   }
   
   .title-inner {
      position: relative;
      padding: 15px 0;
   }
   
   .title-inner .profile {
      position: absolute; /*부모기준으로 위치지정 릴레이티브*/
      top: 15px;
      left: 0;
   }
   
   .title-inner .title {
      padding-left: 50px;
   }
   /*내용*/
   .content-inner {
      padding: 10px 0;
   }
   /* 이미지영역  */
   .image-inner img {
      width: 100%;
   }
   /*좋아요*/
   .like-inner {
      padding: 10px 0;
      border-bottom: 1px solid #ddd;
      border-top: 1px solid #ddd;
      margin-top: 10px;
   }
   
   .like-inner img {
      width: 20px;
      height: 20px;
   }
   
   .link-inner {
      overflow: hidden;
      padding: 10px 0;
   }
   
   .link-inner a {
      float: left;
      width: 33.3333%;
      text-align: center;
      text-decoration: none;
      color: #333333;
   }
   
   .link-inner i {
      margin: 0 5px;
   }
   
   /*767미만 사이즈에서 해당 css가 적용됨*/
   /*xs가 767사이즈   */
   @media ( max-width :767px) {
      aside {
         display: none;
      }
   }
   /* 파일업로드 버튼 바꾸기 */
   .filebox label {
      display: inline-block;
      padding: 6px 10px;
      color: #fff;
      font-size: inherit;
      line-height: normal;
      vertical-align: middle;
      background-color: #5cb85c;
      cursor: pointer;
      border: 1px solid #4cae4c;
      border-radius: none;
      -webkit-transition: background-color 0.2s;
      transition: background-color 0.2s;
   }
   
   .filebox label:hover {
      background-color: #6ed36e;
   }
   
   .filebox label:active {
      background-color: #367c36;
   }
   
   .filebox input[type="file"] {
      position: absolute;
      width: 1px;
      height: 1px;
      padding: 0;
      margin: -1px;
      overflow: hidden;
      clip: rect(0, 0, 0, 0);
      border: 0;
   }
   
   /* sns파일 업로드시 미리보기  */
   .fileDiv {
      height: 100px;
      width: 200px;
      display: none;
      margin-bottom: 10px;
   }
   
   .fileDiv img {
      width: 100%;
      height: 100%;
   }
   /* 모달창 조절 */
   .modal-body {
      padding: 0px;
   }
   
   .modal-content>.row {
      margin: 0px;
   }
   
   .modal-body>.modal-img {
      padding: 0px;
   }
   
   .modal-body>.modal-con {
      padding: 15px;
   }
   
   .modal-inner {
      position: relative;
   }
   
   .modal-inner .profile {
      position: absolute; /*부모기준으로 위치지정 릴레이티브*/
      top: 0px;
      left: 0px;
   }
   
   .modal-inner .title {
      padding-left: 50px;
   }
   
   .modal-inner p {
      margin: 0px;
   }
   </style>
   
</head>
<body>
   <%@ include file="../include/header.jsp" %>
   <section>
      <div class="container">
         <div class="row">
            <aside class="col-sm-2">
               <div class="aside-inner">
                  <div class="menu1">
                     <c:choose>
                        <c:when test="${login != null}">
                           <p>
                              <img src="../resources/img/profile.png">&nbsp;&nbsp;${login.userName}님
                           </p>
                           <ul>
                              <li>내정보</li>
                              <li>내쿠폰</li>
                              <li>내 좋아요 게시물</li>
                           </ul>
                        </c:when>
                        <c:otherwise>
                           <button type="button" class="btn btn-info" onclick="location.href='<c:url value="/user/userLogin" />'">로그인</button>
                        </c:otherwise>
                     </c:choose>
                  </div>
                  <div class="menu2">
                     <p>둘러보기</p>
                     <ul>
                        <li>기부 캠페인</li>
                        <li>페이지</li>
                        <li>그룹</li>
                        <li>이벤트</li>
                        <li>친구리스트</li>
                     </ul>
                  </div>
               </div>
            </aside>
            <div class="col-xs-12 col-sm-8 section-inner">
               <h4>게시물 만들기</h4>
               <!-- 파일 업로드 폼입니다 -->
               <div class="fileDiv">
                  <img id="fileImg" src="<c:url value='/img/img_ready.png' />" />
               </div>
               <div class="reply-content">
                  <textarea class="form-control" rows="3" name="content"
                     id="content" placeholder="무슨 생각을 하고 계신가요?"></textarea>
                  <div class="reply-group">
                     <div class="filebox pull-left">
                        <label for="file">이미지업로드</label> 
                        <input type="file" name="file" id="file">
                     </div>
                     <button type="button" class="right btn btn-info" id="uploadBtn">등록하기</button>
                  </div>
               </div><!-- 파일 업로드 폼 끝 -->
               <div id="contentDiv">
               <div class="title-inner">
                  <!--제목영역-->
                  <div class="profile">
                     <img src="../resources/img/profile.png">
                  </div>
                  <div class="title">
                     <p>테스트</p>
                     <small>21시간</small>
                  </div>
               </div>
               <div class="content-inner">
                  <!--내용영역-->
                  <p>삶이 우리를 끝없이 시험하기에 고어텍스는 한계를 테스트합니다</p>
               </div>
               <div class="image-inner">
                  <!-- 이미지영역 -->
                  <img src="../resources/img/facebook.jpg">
                  
               </div>
               <div class="like-inner">
                  <!--좋아요-->
                  <img src="../resources/img/like.png"> <span>522</span>
               </div>
               <div class="link-inner">
                  <a href="##"><i class="glyphicon glyphicon-thumbs-up"></i>좋아요</a>
                  <a href="##"><i class="glyphicon glyphicon-comment"></i>댓글달기</a> 
                  <a href="##"><i class="glyphicon glyphicon-remove"></i>삭제하기</a>
               </div>
               </div>
            </div>
            <!--우측 어사이드-->
            <aside class="col-sm-2">
               <div class="aside-inner">
                  <div class="menu1">
                     <p>목록</p>
                     <ul>
                        <li>목록1</li>
                        <li>목록2</li>
                        <li>목록3</li>
                        <li>목록4</li>
                        <li>목록5</li>
                     </ul>
                  </div>
               </div>
            </aside>
         </div>
      </div>
   </section>
   <%@ include file="../include/footer.jsp" %>
   <!-- 모달 -->
   <div class="modal fade" id="snsModal" role="dialog">
         <div class="modal-dialog modal-lg">
         <div class="modal-content">
            <div class="modal-body row">
               <div class="modal-img col-sm-8 col-xs-6" >
                  <img src="../resources/img/img_ready.png" id="snsImg" width="100%">
               </div>
               <div class="modal-con col-sm-4 col-xs-6">
                  <div class="modal-inner">
                  <div class="profile">
                     <img src="../resources/img/profile.png">
                  </div>
                  <div class="title">
                     <p id="snsWriter">테스트</p>
                     <small id="snsRegdate">21시간전</small>
                  </div>
                  <div class="content-inner">
                     <p id="snsContent">다람쥐 헌 쳇바퀴에 타고파. sns Content 내용입니다.</p>
                  </div>
                  <div class="link-inner">
                     <a href="##"><i class="glyphicon glyphicon-thumbs-up"></i>좋아요</a>
                     <a href="##"><i class="glyphicon glyphicon-comment"></i>댓글달기</a> 
                     <a href="##"><i class="glyphicon glyphicon-share-alt"></i>공유하기</a>
                  </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
  <script>
   
   $(function() {
      
      //등록하기 버튼 클릭 이벤트
      $('#uploadBtn').click(function() {
         regist();
      });
      
      //등록을 담당하는 함수
      function regist() {
         // 세션에서 현재 로긘 중인 사용자 정보(아이디)를 얻어오자
         const user_id = '${sessionScope.login.userId}';//sessionScope는 생략가능
         // 자바스크립트의 파일 확장자 체크 검색
         let file = $('#file').val();
         
         console.log(user_id);
         console.log(file);
         
         // .을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경
         file = file.slice(file.indexOf('.') + 1).toLowerCase();
         if(file !== 'jpg' && file !== 'png' &&file !== 'jpeg' &&file !== 'bmp'){
        	 alert('이미지 파일(jpg,png,jpeg,bmp)만 등록이 가능합니다.');
        	 $('#file').val('');
        	 return;
         } else if(user_id ===''){ // 세션 데이터가 없다 -> 로긘 x
        	 alert('로긘 필요함');
        	 return;
         }
         
         //ajax 폼 전송의 핵심 FormData 객체
         const formData = new FormData(); // ajax에서 폼 전송하려면 formdata가 필요함
         const data = $('#file');//이미지 업로드 input 태그 id
         console.log('폼 데이터 : ' + formData);
         console.log('데이터 : ' + data);
         console.log(data[0]);
         console.log(data[0].files);//파일태그에 담긴 파일 정보를 확인하는 키값
         console.log(data[0].files[0]); // 이걸 formData에 넣어서 ajax
         
		// data{index} -> 파일 업로드 버튼이 여러개 존재할 경우 요소의 인덱스를 지목해서 가져오는 법
		// 우리는 요소를 id로 취득했기 떄문에 하나만 찍히지만, class이름 같은거로 지목하면 여러개가 취득되겠죠?
		// files[index] -> 파일이 여러개 전송되는 경우, 몇번째 파일인지를 지목
		// 우리는 multiple 속성을 주지 않았기 떄문에 0번 인덱스 밖에 없는 겁니다..
		
		// FormData 객체에 사용자가 업로드한 파일의 정보들이 들어있는 객체를 전달
		formData.append('file', data[0].files[0]);
		//content(글내용) 값을 얻어와서 폼 데이터에 추가
		const content = $('#content').val();
		formData.append('content',content);
		
		// 비동기 방식으로 파일 업로드 및 게시글 등록을 진행.
		$.ajax({
			url : '<c:url value="/snsBoard/upload" />',
			type : 'post',
			data : formData, // 폼데이터 객체를 넘깁니다.
			contentType : false, // ajax방식에서 파이릉ㄹ 넘길때는 반드시 false로 처리하면 폼태그에 "multipart/form-data"로 선언됨
			processData : false, // 폼 데이터를 &변수=값&변수=값...형식으로 변경되는 것을 막는 요소
			success : function(rs) {
				if(rs === 'success') {
					$('#file').val(''); // 파일 선택지 비우기
					$('#content').val(''); // 글 영역 비우기
					$('.fileDiv').css('display', 'none'); // 미리보기 감추기
					getList(1, true); // 글 목록을 호출
				} else {
					alert('업로드 실패 관리자에 문의 ㄱ');
				}
			},
			error : function(request, status, error) {
				console.log('code:' + request + '\n' + request.responseText + '\n' + 'error : ' + error);
				alert('업로드에 실패. 관리자 문의 ㄱㄱㄱ');
			}
		});//ajax end
		
		
      } // end regist()
      //리스트 작업
      let str = '';
      let page = 1;
      getList(1, true);
      
      function getList(page, reset) {
    	  if(reset === true){
    		  str = ''; //화면 리셋 여부가 true라면 str변수를 초기화
    	  }
    	  
    	  $.getJSON(
    			  '<c:url value="/snsBoard/getList?pageNum=' + page +'" />',
    		function(list) { 
    		//컨트롤러가 넘겨주는 list
				console.log(list);
    			for(let i=0; i<list.length; i++){
    				str += "<div class='title-inner'>";
                    str += "<div class='profile'>";
                    str += "<img src='../resources/img/profile.png' >";    
                    str += "</div>";
                    str += "<div class='title'>";
                    str += "<p>"+ list[i].writer +"</p>";
                    str += "<small>"+ timeStamp(list[i].regdate) +"</small> &nbsp;&nbsp;";
                    //파일다운로드
                    str += "<a href='download?fileLoca=" + list[i].fileloca + "&fileName=" + list[i].filename +" '>이미지 다운로드</a>";
                    //파일다운로드끝
                    str += "</div>";
                    str += "<div class='content-inner'>"
                    str += "<p>"+ (list[i].content === null ? '' : list[i].content) +"</p>";
                    str += "</div>";
                    /* 이미지 영역 */
                    str += "<div class='image-inner'>";
                    str += "<a href=' " + list[i].bno + "'>"; ///////글번호 붙여서 a태그 추가
                    str += "<img src='display?fileLoca=" + list[i].fileloca + "&fileName=" + list[i].filename + "' />";
                    str += "</a>" ////////추가
                    str += "</div>";
                    str += "<div class='like-inner'>";                   
                    str += "<img src='../resources/img/like.png'><span>522</span>";                  
                    str += "</div>";
                    str += "<div class='link-inner'>";                     
                    str += "<a href='##'><i class='glyphicon glyphicon-thumbs-up'></i>좋아요</a>";
                    str += "<a href='##'><i class='glyphicon glyphicon-comment'></i>댓글달기</a>";
                    str += "<a href='" + list[i].bno + "'><i class='glyphicon glyphicon-remove'></i>삭제하기</a>";
                    str += "</div>";
                    $('#contentDiv').html(str);//이걸써야 str추가하겠다 요 의미
    			}
    		
			}
    	  ); //end getJSON
	}//end gtList()
      	
	// 상세보기 처리(모달창 열어줄 겁니다.)
	$('#contentDiv').on('click','.image-inner a', function(e) {
		e.preventDefault();
		
		// 글 번호 얻어오기
		const bno = $(this).attr('href');
		
		$.getJSON(
			"<c:url value='/snsBoard/getDetail/' />" + bno,
			function(data) {
				console.log(data);
				
				const img = 'display?fileLoca=' + data.fileloca + '&fileName=' + data.filename;
				$('#snsImg').attr('src', img);//이미지 경로 처리
				$('#snsWriter').html(data.writer);//작성자 처리
				$('#snsRegdate').html(timeStamp(data.regdate)); //날짜 처리
				$('#snsContent').html(data.content);//내용처리
				$('#snsModal').modal('show');//모달열기
			}
		);
	}); //상세보기 이벤트 끝
	
	// 삭제처리
	// 삭제하기 링크를 클릭했을때 이벤트를 발생시켜서
	// 비동기 방식으로 삭제를 ㅣㄴ행해주세요(삭제버튼은 한 화면에 여러개 겠죠?)-- 부모타입에 걸어서 자식지목
	// 서버쪽에서 권한을 확인해 주세요(작성자와 로긘 중이 ㄴ사용자의 id를 비교해서)
	// 일치하지 않으면 문자열"noAuth" 리턴, 성공하면"Success"리턴
	// url : /snsBoard/delete, method:post
      $('#contentDiv').on('click', '.link-inner a', function(e) {
		e.preventDefault();
		
		const bno = $(this).attr('href');
			
		$.ajax({
			url : "<c:url value='/snsBoard/delete' />",
			method: "post",
			data : bno,
			contentType : "application/json",
			success : function(rs) {
				if(rs === 'noAuth'){
					alert('권한 ㄴㄴ. 로긘하고 오렴');
				} else if(rs==='fail') {
					alert('삭제실패 fail');
					
				}
				else { 
					alert('잘 삭제 ㅇㅇ');
					getList(1, true);
					
				}
			},
			error : function() {
				alert('삭제실패 다시 ㄱ , error');
			}
		});
		
      });
      
	//무한 스크롤
	      
     $(window).scroll(function() {
		// 윈도우(device)의 높이와 현재 스크롤 위치 값을 더한 뒤, 문서(컨텐츠) 높이와 비교해서 같다면 로직을 수행
		// 문서 높이 - 브라우저 창 높이 = 스크롤 창의 끝 높이와 같다면 -> 새로운 내용을 불러오자
		if(Math.round($(window).scrollTop()) == $(document).height() - $(window).height()){
			console.log('스크롤 추가!');
			//console.log(++paging);
			//$('#contentDiv').append("<h1> Page: " + page + "</h1>");
	        //$('#contentDiv').append("<br>무한<br>페이징<br>로드<br>중입니다~~~<br><br>무한<br>페이징<br>로드<br>중입니다~~~<br><br>무한<br>페이징<br>로드<br>중입니다~~~<br><br>무한<br>페이징<br>로드<br>중입니다~~~<br>");
		
           // 목록 불러오기의 sql문을페이징 쿼리를 사용해서 작성을 해 주시는 겁니다.
           // 사용자의 스크롤이 바닥에 닿았을 떄, 페이지 변수의 값을 하나 올리고
           // getList(false)를 주셔서 누적해서 계속 열어 주시면 됩니다.
           // 게시글을 몇 개씩 불러 올지는 페이징 알고리즘에서 알아서 정해 주시면 됩니다.
           getList(++page, false);
		}
			
	});
    	 
	
   }); // end jquery
   
   
// 날짜 처리 함수
   function timeStamp(millis) {
      
      const date = new Date(); //현재 날짜
      //현재 날짜를 밀리초로 변환 - 등록일 밀리초 -> 시간차
      const gap = date.getTime() - millis;
      
      let time; //리턴할 시간
      if(gap < 60 * 60 * 24 * 1000) { //1일 미만인 경우
         if(gap < 60 * 60 * 1000) { //1시간 미만일 경우
            time = '방금 전';
         } else { //1시간 이상일 경우
            time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
         }
      } else { //1일 이상일 경우
         const today = new Date(millis);
         const year = today.getFullYear(); //년
         const month = today.getMonth() + 1; //월
         const day = today.getDate(); //일
         const hour = today.getHours(); //시
         const minute = today.getMinutes(); //분
         
         time = year + '년 ' + month + '월 ' + day + '일 ' + hour + '시 ' + minute + '분'; 
         
      }
      return time;
   }
   
      //자바 스크립트 파일 미리보기 기능
      function readURL(input) {
           if (input.files && input.files[0]) {
              
               var reader = new FileReader(); //비동기처리를 위한 파일을 읽는 자바스크립트 객체
               //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
              reader.readAsDataURL(input.files[0]); 
               //파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
               $(".fileDiv").css("display", "block");
               
               reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
                   $('#fileImg').attr("src", event.target.result); 
                   console.log(event.target);//event.target은 이벤트로 선택된 요소를 의미
              }
           }
       }
      
      $("#file").change(function() {
           readURL(this); //this는 #file자신 태그를 의미
           
       });
      
       
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   </script>
   
   
   
</body>
</html>
    