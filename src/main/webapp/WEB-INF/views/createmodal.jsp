<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Create Modal -->
	<div class="wrap-modal-bucket js-modal-create p-t-60 p-b-20 font-DoHyeon">
		<div class="overlay-modal js-hide-modal-create"></div>

		<div class="container">			
			<div class="bg0 p-t-30 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal-create">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>				
					<div class="row p-all-10">
						<div class="col-md-6">
							<input type="text" id="create-title" class="form-control mb-4" placeholder="제목" maxlength="30">
				            <div class="image-field">
				              <div class="mb-4 txt-center"><!--image field-->
				                <img id="image" class="createimage " src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg"
				                  alt="example placeholder">
				              </div>
				              <div class="d-flex justify-content-center"><!--upload button-->
				                  <input type="file" id="inputimage" class="file-btn" onchange="readURL(this);" accept=".png, .jpg, .jpeg">
				              </div>
				            </div>
				            <textarea id="create-content" class="md-textarea form-control p-t-10" rows="2" placeholder="내용"></textarea>		
							<div class="keep_login_container">
		                    	<div class="stext-102 cl3 p-t-23">태그</div>
		                    	<div id="create-tag-dom" class="flex-w m-r--5"></div>
		                	</div>
					    </div>
					    <div class="col-md-6">
			                <div class="stext-102 cl3 p-t-40 mb-1">그룹</div>
					        <select id="create-groups-dom" class="browser-default custom-select mb-3"></select>
			            	<div class="stext-102 cl3 p-t-10">d-Day</div>
			                <input id="create-d-day" class="d-day" type="text" name="date" placeholder="Select Date.." data-input>
			                <div class="stext-102 cl3 p-t-23">위치</div>
			                <div class="mapid"></div>
			                <div class="create-warntest"></div>
							<div class="txt-center">
	       						<button id="create-submit" class="button-modal cl0 bg10">생성</button>
							    <button class="js-hide-modal-create button-modal cl13 bg0 btn-bd" data-dismiss="modal">취소</button>
						    </div>
			            </div>
					</div>
			</div>
		</div>				
	</div>
