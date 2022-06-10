<?php

namespace App\Http\Controllers\Warehousing;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class WarehousesController extends Controller
{
    public function index()
    {
        return view('warehousing.warehouses'); 
    } 
}
