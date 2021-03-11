@extends('frontend.layouts.master')

@section('title',' Register Page')

@section('main-content')
	<!-- Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="bread-inner">
                        <ul class="bread-list">
                            <li><a href="{{route('home')}}">หน้าแรก<i class="ti-arrow-right"></i></a></li>
                            <li class="active"><a href="javascript:void(0);">ลงทะเบียน</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
            
    <!-- Shop Login -->
    <section class="shop login checkout section">
        <div class="container">
            <div class="row"> 
                <div class="col-lg-6 offset-lg-3 col-12">
                    <div class="login-form">
                        <h2>ลงทะเบียน</h2>
                        
                        <!-- Form -->
                        <form class="form checkout-form" method="post" action="{{route('register.submit')}}">
                            @csrf
                            <div class="checkout-form">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>ชื่อ - นามสกุล<span>*</span></label>
                                            <input type="text" name="name" placeholder="" required="required" value="{{old('name')}}">
                                            @error('name')
                                                <span class="text-danger">{{$message}}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>อีเมล<span>*</span></label>
                                            <input type="text" name="email" placeholder="" required="required" value="{{old('email')}}">
                                            @error('email')
                                                <span class="text-danger">{{$message}}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>รหัสผ่าน<span>*</span></label>
                                            <input type="password" name="password" placeholder="" required="required" value="{{old('password')}}">
                                            @error('password')
                                                <span class="text-danger">{{$message}}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>ยืนยันรหัสผ่าน<span>*</span></label>
                                            <input type="password" name="password_confirmation" placeholder="" required="required" value="{{old('password_confirmation')}}">
                                            @error('password_confirmation')
                                                <span class="text-danger">{{$message}}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-6 col-12">
                                        <div class="form-group">
                                            <label>เบอร์โทรติดต่อ <span>*</span></label>
                                            <input type="text" name="phone" placeholder="" required value="{{old('phone')}}" required>
                                            @error('phone')
                                                <span class='text-danger'>{{$message}}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-6 col-12">
                                        <div class="form-group">
                                            <label>ประเทศ<span>*</span></label>
                                            <select name="country" id="country" required>
                                                <option value="TH" selected="selected">ประเทศไทย</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-6 col-12">
                                        <div class="form-group">
                                            <label>ที่อยู่<span>*</span></label>
                                            <input type="text" name="address1" placeholder="" value="{{old('address1')}}">
                                            @error('address1')
                                                <span class='text-danger'>{{$message}}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-6 col-12">
                                        <div class="form-group">
                                            <label>รหัสไปรษณีย์<span>*</span></label>
                                            <input type="text" name="post_code" placeholder="" value="{{old('post_code')}}">
                                            @error('post_code')
                                                <span class='text-danger'>{{$message}}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    
                                    <div class="col-12">
                                        <div class="form-group login-btn">
                                            <button class="btn" type="submit">ลงทะเบียน</button>
                                            <a href="{{route('login.form')}}" class="btn">เข้าสู่ระบบ</a>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </form>
                        <!--/ End Form -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/ End Login -->
@endsection

@push('styles')
<style>
    .shop.login .form .btn{
        margin-right:0;
    }
    .btn-facebook{
        background:#39579A;
    }
    .btn-facebook:hover{
        background:#073088 !important;
    }
    .btn-github{
        background:#444444;
        color:white;
    }
    .btn-github:hover{
        background:black !important;
    }
    .btn-google{
        background:#ea4335;
        color:white;
    }
    .btn-google:hover{
        background:rgb(243, 26, 26) !important;
    }
</style>
@endpush