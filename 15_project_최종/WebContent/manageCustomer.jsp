<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리게시판</title>
<!-- 메뉴바 외 코드 -->
	<link href="css/style.css" rel="stylesheet" />
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css" integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
 <script>
 <%@ include file="include/popup.js" %>
 <%@ include file="include/search.js" %>
 </script>
</head>
<body>
<%@ include file="include/managerHeader.jspf" %>
  	
  	<!-- ------------------------------------------------------------------------ -->
<br><br>
	<div  class="container">
	<h3>회원 관리 게시판</h3>
	<table class="table table-hover">
		  <thead>
		    <tr class="table-active">  
		      <th scope="col" style="width: 10%;">고객번호</th>
			  <th scope="col" style="width: 10%;">ID</th>
			  <th scope="col" style="width: 10%;">비밀번호</th>
			  <th scope="col" style="width: 10%;">이름</th>
			  <th scope="col" style="width: 10%;">닉네임</th>
			  <th scope="col" style="width: 20%;">이메일</th>
			  <th scope="col" style="width: 15%;">전화번호</th>
			  <th scope="col" style="width: 20%;">가입일자</th>
		    </tr>
		  </thead>
	  <tbody class="table-group-divider">
	  <c:choose>
		<c:when test="${empty allCustomerList }">
			<tr>
				<td colspan="5">
					<h2>가입 고객이 없습니다.</h2>
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="vo" items="${allCustomerList }">
				<tr>
					<th>${vo.cusNum }</th>
					<th>${vo.cusId }</th>
					<th>${vo.cusPassword }</th>
					<th>${vo.cusName }</th>					
					<th>${vo.cusNickName }</th>
					<th>${vo.cusEmail }</th>
					<th>${vo.cusPhoneNum }</th>
					<th>${vo.cusRegDate }</th>
				</tr>
			</c:forEach>
			</c:otherwise>
		
		</c:choose>
	  
	    
	  </tbody>

			
	<!-- ------------------------------------------------------------------------ -->
	<tfoot>
			<tr>
				<td colspan="4">
					<ol class="paging">
					<%--[이전으로]에 대한 사용여부 처리 --%>
					<%-- 메소드 사용시 pvo.getBeginPage () => 번잡 --%>
					<c:if test="${pvo.beginPage == 1 }">
						<li class="disable">이전으로</li> 
					</c:if>
					<c:if test="${pvo.beginPage != 1 }">
						<li>
							<a href="controller?type=manageCoustomer&cPage=${pvo.beginPage - 1 }">이전으로</a>
						</li>
					</c:if>
					
					<%--블록내에 표시할 페이지 태그 작성(시작페이지 ~ 끝페이지) --%>
					<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
					<c:if test="${pageNo == pvo.nowPage }">	
						<li class="now">${pageNo }></li>
					</c:if>
					<c:if test="${pageNo != pvo.nowPage }">
						<li>
							<a href="controller?type=manageCoustomer&cPage=${pageNo }">${pageNo }</a>
						</li>
					</c:if>
					
					</c:forEach>
										
					 <%--[다음으로]에 대한 사용여부 처리 --%>
					 <c:if test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable">다음으로<li> 
					</c:if>
					<c:if test="${pvo.endPage < pvo.totalPage }">
						<li>
							<a href="controller?type=manageCoustomer&cPage=${pvo.endPage + 1 }">다음으로</a>
						</li>
					</c:if>
					</ol>
					
				</td>
				
			</tr>
		</tfoot>
		</table>
	</div>
	<br>
	
	<!-- ------------------------------------------------------------------------ -->
      
      <%@ include file="include/managerFooter.jspf" %>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>