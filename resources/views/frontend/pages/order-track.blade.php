@extends('frontend.layouts.master')

@section('title',' ติดตามคำสั่งซื้อ')

@section('main-content')
    <!-- Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="bread-inner">
                        <ul class="bread-list">
                            <li><a href="{{route('home')}}">หน้าแรก<i class="ti-arrow-right"></i></a></li>
                            <li class="active"><a href="javascript:void(0);">ติดตามคำสั่งซื้อ</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
<section class="tracking_box_area section_gap py-5">
    <div class="container">
        <div class="tracking_box_inner">
            <p>กรอกหมายเลขติดตามคำสั่งซื้อในช่องว่าง</p>
            <form class="row tracking_form my-4" action="{{route('product.track.order')}}" method="post" novalidate="novalidate">
              @csrf
                <div class="col-md-8 form-group">
                    <input type="text" class="form-control p-2"  name="order_number" placeholder="กรอกหมายเลขออเดอร์">
                </div>
                <div class="col-md-8 form-group">
                    <button type="submit" value="submit" class="btn submit_btn">ติดต่ามคำสั่งซื้อ</button>
                </div>
            </form>
        </div>
    </div>
</section>
@endsection