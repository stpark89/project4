<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-fluid">
	
	<div class="row">
		<div class="col-sm-offset-4 col-sm-4 text-center">
			<h2>20대 국회 접수의안 총 <span style="color: blue;">${1000}</span> 개</h2>
			<br/>
			<h3>의안이란?</h3>
			<p>국회는 법률안·예산안·동의안 등의 심의를 통하여 헌법이 요구하는 국회의 기능을 수행하고 국민의 의사를 국정에 반영하게 된다.<br/> 
			이와 같이 국회에서 심의하는 법률안·예산안·동의안 등과 같은 안건을 의안이라고 부른다.</p> 
		</div>
	</div>
	
	<hr/>
	<br/><br/>
	<div class="row">
		
		<div class="col-sm-offset-2 col-sm-8">
			
			<form class="form-inline">
			  <div class="form-group">
			    <label for="statuteName">의안명</label>
			    <input type="text" class="form-control" id="statuteName">&nbsp;&nbsp;
			  </div>
			  <div class="form-group">
			    <label for="statutePeople">발의자 </label>
			    <input type="text" class="form-control" id="statutePeople">&nbsp;&nbsp;
			  </div>
			  <div class="form-group">
			    <label for="committee">위원회 </label>
			    <input type="text" class="form-control" id="committee">&nbsp;&nbsp;
			  </div>
			  
			  <div class="form-group">
			  	<select class="form-control" id="statuteIng">
			  		<option>선택</option>
			  		<option>계류</option>
			  		<option>대안반영폐기</option>
			  		<option>수정가결</option>
			  		<option>원안가결</option>
			  		<option>철회</option>
			  		<option>폐기</option>
			  	</select>
			  </div>
			  <button type="button" id="searchStatuteBtn" class="btn btn-primary">검색</button>
			</form>
			<br/><br/>
			<table class="table hover-table">
				<tr>
					<th>제안일</th>
					<th>의안명</th>
					<th>발의자</th>
					<th>상임위원회</th>
					<th>진행상황</th>
				</tr>
				<tr>
					<td>2016-12-10</td>
					<td>테스트</td>
					<td>박성준</td>
					<td></td>
					<td>계류</td>
				</tr>
			</table>
			
		</div>
		
		<div class="col-sm-2"></div>
	
	</div>
	
</div>