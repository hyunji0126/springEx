<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>

<section>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 content-wrap">
				<div class="titlebox">
					<p>자유게시판</p>
				</div>
				
				<form action="<c:url value='/freeBoard/registForm' />" name="registForm" method="post">
					<table class="table">
						<tbody class="t-control">
							<tr>
								<td class="t-title">NAME</td>
								<td><input type="text" class="form-control" name="writer"></td>
							</tr>
							<tr>
								<td class="t-title">TITLE</td>
								<td><input type="text" class="form-control" name="title"></td>
							</tr>
							<tr>
								<td class="t-title">CONTENT</td>
								<td><textarea class="form-control" rows="7" name="content"></textarea>
							</tr>
						</tbody>
					</table>
				</form>
				
				<div class="titlefoot">
					<button class="btn" id="registBtn">등록</button>
					<button class="btn" id="listBtn">목록</button>
				</div>

			</div>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp"%>

<script>
	const $registBtn = document.getElementById('registBtn');
	$registBtn.onclick = function() {
		// form태그는 document.폼 네임으로 바로 접근이 가능
		if(document.registForm.writer.value === '') {
			//문서 노드에서registform이라는 이름에 writer라는 이름을 가진 값이 비었니?
			alert('작성자는 필수 항목입니다.');		
			document.registForm.writer.focus();
			return; //강제종료
		} else if(document.registForm.title.value === '') {
			alert('제목은 필수 항목입니다.');		
			document.registForm.title.focus();
			return;
		} else if(document.registForm.content.value === '') {
			alert('내용은 필수 항목입니다.');		
			document.registForm.content.focus();
			return;
		} else {
			document.registForm.submit(); //registForm을 제출(submit)해라
		}
	}
		$('#listBtn').click(function() {
			if(confirm('목록으로 돌아가시겠습니까?')){
				location.href='<c:url value="/freeBoard/freeList" />'
			} else return;
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
</script>