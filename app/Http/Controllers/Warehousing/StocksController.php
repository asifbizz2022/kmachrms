<?php

namespace App\Http\Controllers\Warehousing;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class StocksController extends Controller
{
     public function index()
    {
        return view('warehousing.stock'); 
    }
}
