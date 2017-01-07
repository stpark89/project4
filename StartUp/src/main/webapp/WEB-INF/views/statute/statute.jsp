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
			    <label for="statuteName">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;의안명</label>
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
			
	<div id="wrap">	
	
		<ul id="tabMenu">
		    <li>최근 통과의안</li>
			<li>최근 접수의안</li>
			<li>처리의안</li>
			<li>계류의안</li>
		</ul>	
			<div id="statuteTable">
			
			</div>
			
		</div>
		
		<div class="col-sm-2"></div>
	
	</div>
	
	</div>
	
</div>