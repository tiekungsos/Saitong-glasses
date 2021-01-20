@extends('frontend.layouts.tryGlassesHeader')

@section('title',' Try Glasses')

@section('main-content')

	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="index1.html">หน้าแรก<i class="ti-arrow-right"></i></a></li>
							<li class="active"><a href="blog-single.html">Try Glasses</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->


	<!-- Glasses -->
	<section class="try-glasses section">
	<script  type="text/template" id="tryon-template">    
		<input type="hidden" name="tryon-glasses" id="glasses" value="content/glasses/brille_B10805_C9.png"/>
		<div class="trying clearfix">
					<div class="col-lg-8">
						<div class="trying__view-wrapper">                                
							<div id="container">
								<canvas id="image" width="625"></canvas>
								<video class="trying__hidden" id="video" preload="auto" loop> </video>
								<canvas id="overlay" width="625" ></canvas>

							</div>

						</div>
					</div>
					<div class="col-lg-4">
						<div class="trying__checkers-container">
							<h3 class="trying__checker-title">
							ระบบทดสอบการสวมแว่นตา เลือกเพศ : 
							</h3>
							<%if (menModels || womenModels){%>
							<ul class="trying__gender-checker clearfix">
								<%if (menModels){%>
								<li>                        
									<input type="radio" class="pink-radio trying__choose-gender" data-value-id="men" name="gender" value="Мужской" checked="" id="gender-men">
									<label for="gender-men">ผู้ชาย</label>
								</li>
								<%}%>
								<%if (womenModels){%>
								<li>
									<input type="radio" class="pink-radio trying__choose-gender" data-value-id="women" name="gender" value="Женский" id="gender-women">
									<label for="gender-women">ผู้หญิง</label>
								</li>
								<%}%>
							</ul>                    
							<div class="trying__checker-title">
								เลือกโมเดล:
							</div>
							<%if (menModels){%>
							<div data-container-type="men" id="tryon-men-container" class="trying__little-photo-container">
								<div class="trying__little-photo-wrapper swiper-wrapper">
									<%var firstModel = menModels[0]%>                            

									<div data-position-left="<%=firstModel.eyePositions.length ? firstModel.eyePositions[0][0] + ',' + firstModel.eyePositions[0][1]:''%>" 
										data-position-right="<%= firstModel.eyePositions.length ? firstModel.eyePositions[1][0] + ',' + firstModel.eyePositions[1][1] : ''%>" 
										class="trying__little-photo-slide trying__little-photo-slide_active swiper-slide">
										<a href="#" title="" alt="">
											<img src="<%=firstModel.filePath%>">
										</a>
									</div>
									<%for (var i = 1; i < menModels.length; i++){%>
									<div data-position-left="<%=menModels[i].eyePositions.length ? menModels[i].eyePositions[0][0] + ',' + menModels[i].eyePositions[0][1] : ''%>" 
										data-position-right="<%= menModels[i].eyePositions.length ? menModels[i].eyePositions[1][0] + ',' + menModels[i].eyePositions[1][1] : '' %>"  
										class="trying__little-photo-slide swiper-slide">
										<a href="#" title="" alt="">
											<img src="<%=menModels[i].filePath%>">
										</a>
									</div>
									<%}%>
								</div>
								<div id="man_photo_scrollbar" class="trying__little-photo-scrollbar swiper-scrollbar">
									
								</div>
							</div>
							<%}%>
							<%if (womenModels){%>
							<div data-container-type="women" id="tryon-women-container" class="trying__little-photo-container">
								<div class="trying__little-photo-wrapper swiper-wrapper">                        
									<%for (var i = 0; i < womenModels.length; i++){%>
									<div data-position-left="<%= womenModels[i].eyePositions.length ? womenModels[i].eyePositions[0][0]  + ',' + womenModels[i].eyePositions[0][1] : ''%>" 
										data-position-right="<%= womenModels[i].eyePositions.length ?  womenModels[i].eyePositions[1][0]  + ',' +  womenModels[i].eyePositions[1][1] : ''%>"  
										class="trying__little-photo-slide swiper-slide">
										<a href="#" title="Фотография модели">
											<img src="<%=womenModels[i].filePath%>">
										</a>
									</div>
									<%}%>
								</div>
								<div id="woman_photo_scrollbar" class="trying__little-photo-scrollbar swiper-scrollbar">
								</div>
							</div>
							<%}%>
							<%}%>
							<!-- <%if (localPhotos){%>
							<div class="trying__checker-title">
								อัพโหลดใบหน้าของคุณ:
							</div>
							<div class="trying__file-load-wrapper">
								<div class="trying__input-file-wrap">
									<input type="file" class="upload" id="tryon-photo-upload"/>
									<label for="tryon-photo-upload"> เลือกภาพ </label>
								</div>
								<a href="javascript:void(0);" id="tryon-photo-upload-btn" class="text-btn"> อัพโหลด </a>
							</div>
							<%}%> -->
							<%if (webcam){%>
							<div class="trying__camera-btn-wrapper">
								<a href="javascript:void(0);" class="btn webcam-btn">
									ใช้กล้องจำลองแว่นตาจากใบหน้า
								</a>
							</div>
							<%}%>
							
							<%if (rz) {%>
							<div class="trying__rz">
								Для точного соответствия размеров укажите Ваш РЦ <input type="text" class="trying__rz-input">
							</div>
							<%}%>

							<%if (controls) {%>
							<div class="trying__controls-container">
								<a id="tryon-zoom-in" href="#">
									<div class="trying__control-wrap">
										<span class="plus-btn">ขยายแว่น</span>
									</div>
									
									
								</a>
								<a id="tryon-zoom-out" href="#">
									<div class="trying__control-wrap">
										<span class="minus-btn">ลดขนาดแว่น</span>
									</div>
									
									
								</a>
								<a id="tryon-rotate-left" href="#">
									<div class="trying__control-wrap">
										<span class="rotate-left-btn">บิดแว่นลงทางซ้าย</span>
									</div>
									
									
								</a>
								<a id="tryon-rotate-right" href="#">
									<div class="trying__control-wrap">
										<span class="rotate-right-btn">บิดแว่นลงทางขวา</span>
									</div>
									
									
								</a>
							</div>
							<%}%>
						</div>
					</div>

		</div>
	</script>


						
	<!-- START TRYON-CONTAINER -->
	<div id="tryon-container" class="container">
		
	</div>
	<!-- END TRYON-CONTAINER -->
	</section>
	<!-- End Glasses -->
	


	<div class="trying__file-load-wrapper" style="padding-left: 10vw;padding-right: 10vw;">
	<div class="trying__checker-title">
		<h2>เลือกแว่นตา:</h2>
	</div>
		@if($productList)
			<div class="trying__little-photo-container">
				<div class="trying__little-photo-wrapper swiper-wrapper" style="overflow: scroll;">
				@foreach($productList as $key=>$product)
					<div  class="image-product" style="width: 50%;padding-left: 10px;padding-right: 10px;">
						<img src="{{$product->photo}}" style="height: auto;">
						<div class="name-product" style="height: 40px;overflow: hidden;">{{$product->title}}</div>
						<a class="btn" href="/product-detail/{{$product->slug}}" style="width: 100%;" target="_blank"> ซื้อสินค้า </a>
						<a class="btn" href="javascript:void(0);" onClick="addUserPhoto('{{$product->photo}}')"  style="width: 100%;"> จำลองแว่น </a>
					</div>
				@endforeach
				</div>
				<div class="trying__little-photo-scrollbar swiper-scrollbar">
			</div>
			</div>
		@endif
		<!-- <div class="trying__input-file-wrap">
			<input type="file" class="upload" id="tryon-photo-upload"/>
			<label for="tryon-photo-upload"> เลือกแว่นตา </label>
		</div> -->
		<!-- <a href="javascript:void(0);" id="tryon-photo-upload-btn" class="text-btn"> แสดง </a> -->
	</div>

	<!-- Start Shop Services Area -->
	<section class="shop-services section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-rocket"></i>
						<h4>จัดส่งฟรี</h4>
						<p>เมื่อสั่งซื้อขั้นต่ำ 1000 บาท</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-reload"></i>
						<h4>รับประกันการคืนสินค้า</h4>
						<p>คืนสินค้าได้ภายใน 30 วัน</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-lock"></i>
						<h4>ชำระเงินอย่างปลอดภัย</h4>
						<p>ปลอดภัยมั่นใจ 100%</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-tag"></i>
						<h4>การันตีราคา</h4>
						<p>การันตีราคาถูกชัวร์</p>
					</div>
					<!-- End Single Service -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Shop Services Area -->
	
	
	<script>
	function addUserPhoto(options) {
				console.log(options);
				document.getElementById("glasses").value = options;
				scriptController.createTryOnElemLoad();
        return true;
    }
	</script>
@endsection