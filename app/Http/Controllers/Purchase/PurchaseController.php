<?php

namespace App\Http\Controllers\Purchase;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PurchaseController extends Controller
{
   public function vendors(){
      return view('purchase.vendors');
   }
   public function orders(){
    return view('purchase.orders');
   }
}
