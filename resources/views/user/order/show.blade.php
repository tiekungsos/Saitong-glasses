@extends('user.layouts.master')

@section('title', 'Order Detail')

@section('main-content')
    <div class="card">
        <h5 class="card-header">Order <a href="{{ route('order.pdf', $order->id) }}"
                class=" btn btn-sm btn-primary shadow-sm float-right"><i class="fas fa-download fa-sm text-white-50"></i>
                Generate PDF</a>
        </h5>
        <div class="card-body">
            @if ($order)
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>S.N.</th>
                            <th>Order No.</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Quantity</th>
                            <th>Charge</th>
                            <th>Total Amount</th>
                            <th>Status</th>
                            <th>Update Status Time</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            @php
                                $shipping_charge = DB::table('shippings')
                                    ->where('id', $order->shipping_id)
                                    ->pluck('price');
                            @endphp
                            <td>{{ $order->id }}</td>
                            <td>{{ $order->order_number }}</td>
                            <td>{{ $order->first_name }} {{ $order->last_name }}</td>
                            <td>{{ $order->email }}</td>
                            <td>{{ $order->quantity }}</td>
                            <td>
                                @foreach ($shipping_charge as $data) $
                                    {{ number_format($data, 2) }} @endforeach
                            </td>
                            <td>${{ number_format($order->total_amount, 2) }}</td>
                            <td>
                                @if ($order->status == 'new')
                                    <span class="badge badge-primary">{{ $order->status }}</span>
                                @elseif($order->status=='process')
                                    <span class="badge badge-warning">{{ $order->status }}</span>
                                @elseif($order->status=='delivered')
                                    <span class="badge badge-success">{{ $order->status }}</span>
                                @elseif($order->status=='receive')
                                    <span class="badge badge-success">{{ $order->status }}</span>
                                @elseif($order->status=='no_receiver')
                                    <span class="badge badge-danger">{{ $order->status }}</span>
                                @else
                                    <span class="badge badge-danger">{{ $order->status }}</span>
                                @endif
                            </td>
                            <td>{{ $order->updated_at }}</td>
                            <td>
                                <form method="POST" action="{{ route('order.destroy', [$order->id]) }}">
                                    @csrf
                                    @method('delete')
                                    <button class="btn btn-danger btn-sm dltBtn" data-id={{ $order->id }}
                                        style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip"
                                        data-placement="bottom" title="Delete"><i class="fas fa-trash-alt"></i></button>
                                </form>
                            </td>

                        </tr>
                    </tbody>
                </table>

                <section class="confirmation_part section_padding">
                    <div class="order_boxes">
                        <div class="row">
                            <div class="col-lg-6 col-lx-4">
                                <div class="order-info">
                                    <h4 class="text-center pb-4">ORDER INFORMATION</h4>
                                    <table class="table">
                                        <tr class="">
                                            <td>Order Number</td>
                                            <td> : {{ $order->order_number }}</td>
                                        </tr>
                                        <tr>
                                            <td>Order Date</td>
                                            <td> : {{ $order->created_at->format('D d M, Y') }} at
                                                {{ $order->created_at->format('g : i a') }} </td>
                                        </tr>
                                        <tr>
                                            <td>Quantity</td>
                                            <td> : {{ $order->quantity }}</td>
                                        </tr>
                                        <tr>
                                            <td>Order Status</td>
                                            <td> : {{ $order->status }}</td>
                                        </tr>
                                        <tr>
                                            @php
                                                $shipping_charge = DB::table('shippings')
                                                    ->where('id', $order->shipping_id)
                                                    ->pluck('price');
                                            @endphp
                                            <td>Shipping Charge</td>
                                            <td> : $ {{ number_format($shipping_charge[0], 2) }}</td>
                                        </tr>
                                        <tr>
                                            <td>Total Amount</td>
                                            <td> : $ {{ number_format($order->total_amount, 2) }}</td>
                                        </tr>
                                        <tr>
                                            <td>Update Status Time</td>
                                            <td> : {{ $order->updated_at }}</td>
                                        </tr>
                                        <tr>
                                            <td>Payment Method</td>
                                            <td> : @if ($order->payment_method == 'cod')
                                                Cash on Delivery @else Paypal @endif
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Payment Status</td>
                                            <td> : {{ $order->payment_status }}</td>
                                        </tr>
                                        @if (!$order->slip_order)
                                        <tr>
                                            <td>Upload Slip Payment</td>
                                            <td>
                                                <div class="form-group">

                                                </div>

                                                <form method="POST" action="/user/order/uploadSlip/{{ $order->id }}"
                                                    enctype="multipart/form-data"
                                                    class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                                    @csrf
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <span class="input-group-btn">
                                                                <a id="lfm" data-input="thumbnail" data-preview="holder"
                                                                    class="btn btn-primary">
                                                                    <i class="fa fa-picture-o"></i> Choose
                                                                </a>
                                                            </span>
                                                            <input id="thumbnail" class="form-control" type="text"
                                                                name="file" value="{{ $order->slip_order }}">

                                                        </div>
                                                        @error('slip_order')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>

                                                    <button type="submit" class="btn btn-success btn-sm"
                                                        style="margin-top: 20px">Upload</button>
                                                </form>
                                            </td>
                                        </tr>
                                        @else
                                        <tr>
                                            <td>Slip Payment</td>
                                            <td><a href="{{$order->slip_order}}" target="_blank"><img src="{{$order->slip_order}}" class="img-fluid" width="200px" alt=""></a> </td>
                                        @endif
                                    </table>
                                </div>
                            </div>

                            <div class="col-lg-6 col-lx-4">
                                <div class="shipping-info">
                                    <h4 class="text-center pb-4">SHIPPING INFORMATION</h4>
                                    <table class="table">
                                        <tr class="">
                                            <td>Full Name</td>
                                            <td> : {{ $order->first_name }} {{ $order->last_name }}</td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td> : {{ $order->email }}</td>
                                        </tr>
                                        <tr>
                                            <td>Phone No.</td>
                                            <td> : {{ $order->phone }}</td>
                                        </tr>
                                        <tr>
                                            <td>Address</td>
                                            <td> : {{ $order->address1 }}, {{ $order->address2 }}</td>
                                        </tr>
                                        <tr>
                                            <td>Country</td>
                                            <td> : {{ $order->country }}</td>
                                        </tr>
                                        <tr>
                                            <td>Post Code</td>
                                            <td> : {{ $order->post_code }}</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>

                <section class="confirmation_part section_padding" style="padding-top: 30px">
                    <div class="order_boxes">
                        <div class="row">
                            <div class="col-12">
                                <div class="shipping-info">
                                    <h4 class="text-center pb-4">PRODUCT DETAIL</h4>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Number</th>
                                                <th>photo</th>
                                                <th>Product Name</th>
                                                <th>SKU</th>
                                                <th>QTY</th>
                                                <th>Price</th>
                                                <th>Subtotal</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($product as $productData)
                                                {{-- {{dd($productData)}} --}}
                                                <tr>
                                                    <td>
                                                        {{ $productData->product->id }}
                                                    </td>
                                                    <td>
                                                        <img src="{{ $productData->product->photo }}" class="img-fluid"
                                                            width="100px" alt="">
                                                    </td>
                                                    <td>{{ $productData->product->title }}</td>
                                                    <td>{{ $productData->product->slug }}</td>
                                                    <td> {{ $productData->quantity }}</td>
                                                    <td>{{ $productData->price }}</td>
                                                    <td> {{ $productData->amount }}</td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>

                </section>
            @endif

        </div>
    </div>
@endsection

@push('styles')
    <style>
        .order-info,
        .shipping-info {
            background: #ECECEC;
            padding: 20px;
        }

        .order-info h4,
        .shipping-info h4 {
            text-decoration: underline;
        }

    </style>
@endpush


@push('scripts')
    <script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
    <script>
        $('#lfm').filemanager('image');

    </script>
@endpush
