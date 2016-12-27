<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<div class="container-fluid">
<div class="col-md-4"></div>
	<div class="col-md-4">
		<h4>의원 검색</h4>
		<hr/>
		<div class="well">
		<form action="" class="form-horizontal">
			 <div class="form-group">
    			<label class="control-label col-sm-3" for="empNm">이름</label>
	    		<div class="col-sm-8">
	      			<input type="text" class="form-control" id="empNm" placeholder="이름을 입력하세요">
	    		</div>
 			 </div>
		
			 <div class="form-group">
    			<label class="control-label col-sm-3" for="polyNm">정당</label>
	    		<div class="col-sm-8">
	      			<select class="form-control" id="polyNm">
	      				<option>전체</option>
	      				<option>민주당</option>
	      			</select>
	    		</div>
 			 </div>
 			 
 			 <div class="form-group">
    			<label class="control-label col-sm-3" for="sharNm">소속 위원회</label>
	    		<div class="col-sm-8">
	      			<select class="form-control" id="sharNm">
	      				<option>전체</option>
	      				<option>뭔데</option>
	      			</select>
	    		</div>
 			 </div>
 			 
 			 <div class="form-group">
    			<label class="control-label col-sm-3" for="reeleGbnNm">당선 회수</label>
	    		<div class="col-sm-8">
	      			<select class="form-control" id="reeleGbnNm">
	      				<option>전체</option>
	      				<option>초선</option>
	      			</select>
	    		</div>
 			 </div>
 			 
 			  <div class="form-group">
    			<label class="control-label col-sm-3" for="origNm">선거구</label>
	    		<div class="col-sm-8">
	      			<select class="form-control" id="origNm">
	      				<option value="all">전체</option>
	      				<option value="seoul">서울</option>
	      			</select>
	    		</div>
 			 </div>
 			 
 			 <div class="form-group">
 			 	<div class="col-sm-offset-3 col-sm-2">
    				<input type="button" id="searchBtn" class="btn btn-primary" value="검색">
    			</div>
    			<div class="col-sm-4">
    				<input type="button" class="btn btn-danger" value="검색 초기화">
    			</div>
 			 </div>
		</form>
		
		</div>
	</div>
	<div class="col-md-4"></div>
</div>
<hr/>
<br/><br/><br/>
	<!--검색 결과 나올 Div 영역-->
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2">
				<div class="well text-center">
					<img src="img/gom.png" class="img-thumbnail" alt="Cinque Terre" width="150" height="150"><br/><br/>
					<p>이름 : <span>이정현</span></p>
					<p>정당 : <span>새누리당</span></p>
					<input type="button" class="btn btn-success detailBtn" value="상세보기">
				</div>
			</div>
			<div class="col-sm-2">
				<div class="well text-center">
					<img src="img/gom.png" class="img-thumbnail" alt="Cinque Terre" width="150" height="150"><br/><br/>
					<p>이름 : <span>최순실</span></p>
					<p>정당 : <span>무소속</span></p>
					<input type="button" class="btn btn-success detailBtn" value="상세보기">
				</div>
			</div>
			<div class="col-sm-2">
				<div class="well text-center">
					<img src="img/gom.png" class="img-thumbnail" alt="Cinque Terre" width="150" height="150"><br/><br/>
					<p>이름 : <span>홍길동</span></p>
					<p>정당 : <span>국민의당</span></p>
					<input type="button" class="btn btn-success detailBtn" value="상세보기">
				</div>
			</div>
			<div class="col-sm-2">
				<div class="well text-center">
					<img src="img/gom.png" class="img-thumbnail" alt="Cinque Terre" width="150" height="150"><br/><br/>
					<p>이름 : 이정현</p>
					<p>정당 : 새누리당</p>
					<input type="button" class="btn btn-success" value="상세보기">
				</div>
			</div>
			<div class="col-sm-2">
				<div class="well text-center">
					<img src="img/gom.png" class="img-thumbnail" alt="Cinque Terre" width="150" height="150"><br/><br/>
					<p>이름 : 이정현</p>
					<p>정당 : 새누리당</p>
					<input type="button" class="btn btn-success" value="상세보기">
				</div>
			</div>
			<div class="col-sm-2">
				<div class="well text-center">
					<img src="img/gom.png" class="img-thumbnail" alt="Cinque Terre" width="150" height="150"><br/><br/>
					<p>이름 : 이정현</p>
					<p>정당 : 새누리당</p>
					<input type="button" class="btn btn-success" value="상세보기">
				</div>
			</div>
		</div>
	</div>