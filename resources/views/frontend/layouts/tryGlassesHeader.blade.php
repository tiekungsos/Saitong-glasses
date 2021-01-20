<!DOCTYPE html>
<html lang="zxx">
<head>
<?php header('Access-Control-Allow-Origin: *'); ?>
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    @include('frontend.layouts.head')	
    
    <link rel="stylesheet"  href="{{asset('frontend/js/libs/font-awesome-4.4.0/css/font-awesome.css')}}"/>
    <link rel="stylesheet"  href="{{asset('frontend/js/libs/bootstrap/bootstrap-grid-3.3.1.min.css')}}">
    <link rel="stylesheet"  href="{{asset('frontend/css/try-style.css')}}"/>
    <link rel="stylesheet" href="{{asset('frontend/js/libs/swiper/css/swiper.min.css')}}"/>

</head>
<body class="js">
	
	<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span>
				<span></span>
			</div>
		</div>
	</div>
	<!-- End Preloader -->
	
	@include('frontend.layouts.notification')
	<!-- Header -->
	@include('frontend.layouts.header')
	<!--/ End Header -->
	@yield('main-content')
	
	@include('frontend.layouts.footer')


<script src="{{asset('frontend/js/polyfills.js')}}"></script>
<script src="{{asset('frontend/js/lodash.js')}}"></script>
<script src="{{asset('frontend/js/try-on.js')}}"></script>
<script src="{{asset('frontend/js/script.js')}}"></script>
<script src="{{asset('frontend/js/face-tracker.js')}}"></script>
<script src="{{asset('frontend/js/template.js')}}"></script>
<script src="{{asset('frontend/js/libs/swiper/js/swiper.min.js')}}"></script>
<script src="{{asset('frontend/js/libs/clmtrackr/clmtrackr.js')}}"></script>
<script src="{{asset('frontend/js/libs/clmtrackr/models/model_pca_20_svm.js')}}"></script>



</body>
</html>