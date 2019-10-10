<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- Detail Modal -->
	<div class="wrap-modal-bucket js-modal-bucket p-t-60 p-b-20">
		<div class="overlay-modal js-hide-modal-bucket"></div>

		<div class="container">
			<div class="bg0 p-t-30 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal-bucket">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div class="row">
					<div id="left" class="col-md-6">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<h4 id="bucket_title"class="ltext-107 cl2 p-b-14"></h4>
								<div class="gallery-lb">
									<div class="pos-relative txt-center">
										<img class="modal_image" id="detail_image" alt="IMG-PRODUCT">
										<a id="modal_image_expand" class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" >
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							</div>
							<div id="bucket_content" class="mtext-110 cl3 p-t-23 p-b-23"></div>
							<div class="flex-m p-r-10 m-r-11 cl3">
								<a class="modal_heart fs-23 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addlike tooltip100" data-tooltip="Add to Like">
									<i class="zmdi zmdi-favorite"></i>
								</a>
								<p id="likecnt" class="cl6 stext-107" style="width: 40px"></p>
								<a href="#" class="fs-23 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
									<i class="fa fa-plus-square fa-lg"></i> 
								</a>						
							</div>
						</div>			
					</div>
					
					<div id="right" class="col-md-6">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<div class="stext-102 cl3 p-t-40">태그</div>
							<div id="detail_tags" class="flex-w p-t-4 m-r--5">
			                </div>
			                <div class="stext-102 cl3 p-t-23">위치</div>
						    <div id = 'mapid'>
							</div>
						 </div>
							<!--  -->
							<div class="flex-w flex-m p-l-100 p-t-40 respon7">
								
								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
									<i class="fa fa-facebook"></i>
								</a>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
									<i class="fa fa-twitter"></i>
								</a>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
									<i class="fa fa-google-plus"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
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

	<!-- get Modal -->
	<div class="wrap-modal-bucket js-modal-get p-t-60 p-b-20 font-DoHyeon">
		<div class="overlay-modal js-hide-modal-get"></div>

		<div class="container">			
			<div class="bg0 p-t-30 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal-get">
					<img src="images/icons/icon-close.png" alt="CLOSE">
				</button>				
					<div class="row p-all-10">
						<div class="col-md-6">
							<input type="text" id="get_title" class="form-control mb-4" maxlength="30">
				            <div class="gallery-lb">
								<div class="pos-relative txt-center">
									<img class="modal_image" id="get_image" alt="IMG-PRODUCT">
									<a id="modal_image_expand" class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" >
										<i class="fa fa-expand"></i>
									</a>
								</div>
							</div>
				            <textarea id="get_content" class="md-textarea form-control p-t-10" rows="2"></textarea>		
							<div class="keep_login_container">
		                    	<div class="stext-102 cl3 p-t-23">태그</div>
		                    	<div id="get-tag-dom" class="flex-w m-r--5"></div>
		                	</div>
					    </div>
					    <div class="col-md-6">
			                <div class="stext-102 cl3 p-t-40 mb-1">그룹</div>
					        <select id="get-groups-dom" class="browser-default custom-select mb-3"></select>
			            	<div class="stext-102 cl3 p-t-10">d-Day</div>
			                <input id="get-d-day" class="d-day" type="text" name="date" placeholder="Select Date.." data-input>
			                <div class="stext-102 cl3 p-t-23">위치</div>
			                <div class="mapid"></div>
			                <div class="get-warntest"></div>
							<div class="txt-center">
								<input type="hidden" id="bucket_id"/>
	       						<button id="get-submit" class="button-modal cl0 bg10">가져오기</button>
							    <button class="js-hide-modal-get button-modal cl13 bg0 btn-bd" data-dismiss="modal">취소</button>
						    </div>
			            </div>
					</div>
			</div>
		</div>				
	</div>