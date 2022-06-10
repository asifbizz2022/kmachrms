@extends('layout.app')
@section('heading')
Company
@endsection

@section('page-title')
Company
@endsection

@section('page-label')
Company
@endsection
@section('page-body')
<div class="text-right my-3">
     <button type="button" class="btn rounded-0 btn-info add-new-button">
        <i class="fa fa-plus"></i>
       Add New</button>
</div>
 
<div class=" add-form card">
<div class="card-header"> 
  <div class="d-flex justify-content-between">
    <h3 class="card-title">Add New Company</h3>  
  </div>
</div>    
<div class=" card-body" id="add-org-company-form">
    
    <!--Add new  Form -->
    <div id="add-form">
        <form method="post" action="{{ route('company-add') }}" class="company-add-form"> 
            @csrf
            <div class="row">
                <div class="col-md-6">
                <p>
                <label>Company Name</label>
                <input type="text" name="company" class="form form-control" placeholder="Company Name">
                </p> 
                <div class="row">
                    <div class="col-6">
                        <label>Company Type</label>
                        <select name="company-type" class="form form-control  ">
                            @foreach($type as $row)
                            <option value='{{ $row->type_id }}'>{{ $row->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-6">
                        <label>Leagal / Trading Name</label>
                         <input type="text" name="legal-trading-name" class="form form-control" placeholder="Leagl /Trading Name">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-6">
                        <label>Registration Number</label>
                         <input type="text" name="registration-name" class="form form-control" placeholder="Registration Name">
                    </div>
                    <div class="col-6">
                        <label>Contact Number</label>
                         <input type="text" name="contact-number" class="form form-control" plceholder="Contact Number">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-6">
                        <label>Email</label>
                         <input type="email" name="email" class="form form-control" placeholder="Email">
                    </div>
                    <div class="col-6">
                        <label>Website Url</label>
                         <input type="text" name="website-url" class="form form-control" plceholder="Website url">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-6">
                        <label>Username</label>
                         <input type="text" name="username" class="form form-control" placeholder="Username">
                    </div>
                    <div class="col-6">
                        <label>Password</label>
                         <input type="password" name="password" class="form form-control" placeholder="password">
                    </div>
                </div>
                
                </div>
                <div class="col-md-6">
                    
                    <p>
                    <label>Tax Number & EIN</label>
                    <input type="text" name="tax-number" class="form form-control  " placeholder="Tax Number & EIN">
                    </p>
                    
                    <p>
                    <label>Address</label>
                    <input type="text" name="address-one" class="form form-control  " placeholder="Address Line 1">
                    </p>
                    <p>
                    <input type="text" name="address-two" class="form form-control  " placeholder="Address Line 2">
                    </p>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <input name="city" class="form form-control form-sm" placeholder="City">
                        </div>
                        <div class="col-md-4">
                            <input name="state-province" class="form form-control  " placeholder="State/Province">
                        </div>
                        <div class="col-md-4">
                            <input name="zip-code" class="form form-control  " placeholder="Zip Code">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">
                            <label>Company Logo</label>
                            <input type="file" name="company-logo" class="form form-control-file  "> 
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Currency</label>
                            <select class="form form-control" name="currency">
                                <option>
                                    Currency
                                </option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label>Time Zone</label>
                            <select class="form form-control" name="timezone">
                                <option value="Pacific/Midway">(GMT-11:00) Midway Island</option>
                                        <option value="US/Samoa">(GMT-11:00) Samoa</option>
                                        <option value="US/Hawaii">(GMT-10:00) Hawaii</option>
                                        <option value="US/Alaska">(GMT-09:00) Alaska</option>
                                        <option value="US/Pacific">(GMT-08:00) Pacific Time (US &amp; Canada)</option>
                                        <option value="America/Tijuana">(GMT-08:00) Tijuana</option>
                                        <option value="US/Arizona">(GMT-07:00) Arizona</option>
                                        <option value="US/Mountain">(GMT-07:00) Mountain Time (US &amp; Canada)</option>
                                        <option value="America/Chihuahua">(GMT-07:00) Chihuahua</option>
                                        <option value="America/Mazatlan">(GMT-07:00) Mazatlan</option>
                                        <option value="America/Mexico_City">(GMT-06:00) Mexico City</option>
                                        <option value="America/Monterrey">(GMT-06:00) Monterrey</option>
                                        <option value="Canada/Saskatchewan">(GMT-06:00) Saskatchewan</option>
                                        <option value="US/Central">(GMT-06:00) Central Time (US &amp; Canada)</option>
                                        <option value="US/Eastern">(GMT-05:00) Eastern Time (US &amp; Canada)</option>
                                        <option value="US/East-Indiana">(GMT-05:00) Indiana (East)</option>
                                        <option value="America/Bogota">(GMT-05:00) Bogota</option>
                                        <option value="America/Lima">(GMT-05:00) Lima</option>
                                        <option value="America/Caracas">(GMT-04:30) Caracas</option>
                                        <option value="Canada/Atlantic">(GMT-04:00) Atlantic Time (Canada)</option>
                                        <option value="America/La_Paz">(GMT-04:00) La Paz</option>
                                        <option value="America/Santiago">(GMT-04:00) Santiago</option>
                                        <option value="Canada/Newfoundland">(GMT-03:30) Newfoundland</option>
                                        <option value="America/Buenos_Aires">(GMT-03:00) Buenos Aires</option>
                                        <option value="Greenland">(GMT-03:00) Greenland</option>
                                        <option value="Atlantic/Stanley">(GMT-02:00) Stanley</option>
                                        <option value="Atlantic/Azores">(GMT-01:00) Azores</option>
                                        <option value="Atlantic/Cape_Verde">(GMT-01:00) Cape Verde Is.</option>
                                        <option value="Africa/Casablanca">(GMT) Casablanca</option>
                                        <option value="Europe/Dublin">(GMT) Dublin</option>
                                        <option value="Europe/Lisbon">(GMT) Lisbon</option>
                                        <option value="Europe/London">(GMT) London</option>
                                        <option value="Africa/Monrovia">(GMT) Monrovia</option>
                                        <option value="Europe/Amsterdam">(GMT+01:00) Amsterdam</option>
                                        <option value="Europe/Belgrade">(GMT+01:00) Belgrade</option>
                                        <option value="Europe/Berlin">(GMT+01:00) Berlin</option>
                                        <option value="Europe/Bratislava">(GMT+01:00) Bratislava</option>
                                        <option value="Europe/Brussels">(GMT+01:00) Brussels</option>
                                        <option value="Europe/Budapest">(GMT+01:00) Budapest</option>
                                        <option value="Europe/Copenhagen">(GMT+01:00) Copenhagen</option>
                                        <option value="Europe/Ljubljana">(GMT+01:00) Ljubljana</option>
                                        <option value="Europe/Madrid">(GMT+01:00) Madrid</option>
                                        <option value="Europe/Paris">(GMT+01:00) Paris</option>
                                        <option value="Europe/Prague">(GMT+01:00) Prague</option>
                                        <option value="Europe/Rome">(GMT+01:00) Rome</option>
                                        <option value="Europe/Sarajevo">(GMT+01:00) Sarajevo</option>
                                        <option value="Europe/Skopje">(GMT+01:00) Skopje</option>
                                        <option value="Europe/Stockholm">(GMT+01:00) Stockholm</option>
                                        <option value="Europe/Vienna">(GMT+01:00) Vienna</option>
                                        <option value="Europe/Warsaw">(GMT+01:00) Warsaw</option>
                                        <option value="Europe/Zagreb">(GMT+01:00) Zagreb</option>
                                        <option value="Europe/Athens">(GMT+02:00) Athens</option>
                                        <option value="Europe/Bucharest">(GMT+02:00) Bucharest</option>
                                        <option value="Africa/Cairo">(GMT+02:00) Cairo</option>
                                        <option value="Africa/Harare">(GMT+02:00) Harare</option>
                                        <option value="Europe/Helsinki">(GMT+02:00) Helsinki</option>
                                        <option value="Europe/Istanbul">(GMT+02:00) Istanbul</option>
                                        <option value="Asia/Jerusalem">(GMT+02:00) Jerusalem</option>
                                        <option value="Europe/Kiev">(GMT+02:00) Kyiv</option>
                                        <option value="Europe/Minsk">(GMT+02:00) Minsk</option>
                                        <option value="Europe/Riga">(GMT+02:00) Riga</option>
                                        <option value="Europe/Sofia">(GMT+02:00) Sofia</option>
                                        <option value="Europe/Tallinn">(GMT+02:00) Tallinn</option>
                                        <option value="Europe/Vilnius">(GMT+02:00) Vilnius</option>
                                        <option value="Asia/Baghdad">(GMT+03:00) Baghdad</option>
                                        <option value="Asia/Kuwait">(GMT+03:00) Kuwait</option>
                                        <option value="Africa/Nairobi">(GMT+03:00) Nairobi</option>
                                        <option value="Asia/Riyadh">(GMT+03:00) Riyadh</option>
                                        <option value="Europe/Moscow">(GMT+03:00) Moscow</option>
                                        <option value="Asia/Tehran">(GMT+03:30) Tehran</option>
                                        <option value="Asia/Baku">(GMT+04:00) Baku</option>
                                        <option value="Europe/Volgograd">(GMT+04:00) Volgograd</option>
                                        <option value="Asia/Muscat">(GMT+04:00) Muscat</option>
                                        <option value="Asia/Tbilisi">(GMT+04:00) Tbilisi</option>
                                        <option value="Asia/Yerevan">(GMT+04:00) Yerevan</option>
                                        <option value="Asia/Kabul">(GMT+04:30) Kabul</option>
                                        <option value="Asia/Karachi">(GMT+05:00) Karachi</option>
                                        <option value="Asia/Tashkent">(GMT+05:00) Tashkent</option>
                                        <option value="Asia/Kolkata">(GMT+05:30) Kolkata</option>
                                        <option value="Asia/Kathmandu">(GMT+05:45) Kathmandu</option>
                                        <option value="Asia/Yekaterinburg">(GMT+06:00) Ekaterinburg</option>
                                        <option value="Asia/Almaty">(GMT+06:00) Almaty</option>
                                        <option value="Asia/Dhaka">(GMT+06:00) Dhaka</option>
                                        <option value="Asia/Novosibirsk">(GMT+07:00) Novosibirsk</option>
                                        <option value="Asia/Bangkok">(GMT+07:00) Bangkok</option>
                                        <option value="Asia/Jakarta">(GMT+07:00) Jakarta</option>
                                        <option value="Asia/Krasnoyarsk">(GMT+08:00) Krasnoyarsk</option>
                                        <option value="Asia/Chongqing">(GMT+08:00) Chongqing</option>
                                        <option value="Asia/Hong_Kong">(GMT+08:00) Hong Kong</option>
                                        <option value="Asia/Kuala_Lumpur">(GMT+08:00) Kuala Lumpur</option>
                                        <option value="Australia/Perth">(GMT+08:00) Perth</option>
                                        <option value="Asia/Singapore">(GMT+08:00) Singapore</option>
                                        <option value="Asia/Taipei">(GMT+08:00) Taipei</option>
                                        <option value="Asia/Ulaanbaatar">(GMT+08:00) Ulaan Bataar</option>
                                        <option value="Asia/Urumqi">(GMT+08:00) Urumqi</option>
                                        <option value="Asia/Irkutsk">(GMT+09:00) Irkutsk</option>
                                        <option value="Asia/Seoul">(GMT+09:00) Seoul</option>
                                        <option value="Asia/Tokyo">(GMT+09:00) Tokyo</option>
                                        <option value="Australia/Adelaide">(GMT+09:30) Adelaide</option>
                                        <option value="Australia/Darwin">(GMT+09:30) Darwin</option>
                                        <option value="Asia/Yakutsk">(GMT+10:00) Yakutsk</option>
                                        <option value="Australia/Brisbane">(GMT+10:00) Brisbane</option>
                                        <option value="Australia/Canberra">(GMT+10:00) Canberra</option>
                                        <option value="Pacific/Guam">(GMT+10:00) Guam</option>
                                        <option value="Australia/Hobart">(GMT+10:00) Hobart</option>
                                        <option value="Australia/Melbourne">(GMT+10:00) Melbourne</option>
                                        <option value="Pacific/Port_Moresby">(GMT+10:00) Port Moresby</option>
                                        <option value="Australia/Sydney">(GMT+10:00) Sydney</option>
                                        <option value="Asia/Vladivostok">(GMT+11:00) Vladivostok</option>
                                        <option value="Asia/Magadan">(GMT+12:00) Magadan</option>
                                        <option value="Pacific/Auckland">(GMT+12:00) Auckland</option>
                                        <option value="Pacific/Fiji">(GMT+12:00) Fiji</option>
                            </select>
                        </div>
                    </div>
                    <div class="row my-3">
                        <div class="col">
                            <select class="form-control" name="country">
                                <option value="">Select One</option>
                                    <option value="1"> Afghanistan</option>
                                    <option value="2"> Albania</option>
                                    <option value="3"> Algeria</option>
                                    <option value="4"> American Samoa</option>
                                    <option value="5"> Andorra</option>
                                    <option value="6"> Angola</option>
                                    <option value="7"> Anguilla</option>
                                    <option value="8"> Antarctica</option>
                                    <option value="9"> Antigua and Barbuda</option>
                                    <option value="10"> Argentina</option>
                                    <option value="11"> Armenia</option>
                                    <option value="12"> Aruba</option>
                                    <option value="13"> Australia</option>
                                    <option value="14"> Austria</option>
                                    <option value="15"> Azerbaijan</option>
                                    <option value="16"> Bahamas</option>
                                    <option value="17"> Bahrain</option>
                                    <option value="18"> Bangladesh</option>
                                    <option value="19"> Barbados</option>
                                    <option value="20"> Belarus</option>
                                    <option value="21"> Belgium</option>
                                    <option value="22"> Belize</option>
                                    <option value="23"> Benin</option>
                                    <option value="24"> Bermuda</option>
                                    <option value="25"> Bhutan</option>
                                    <option value="26"> Bolivia</option>
                                    <option value="27"> Bosnia and Herzegovina</option>
                                    <option value="28"> Botswana</option>
                                    <option value="29"> Bouvet Island</option>
                                    <option value="30"> Brazil</option>
                                    <option value="31"> British Indian Ocean Territory</option>
                                    <option value="32"> Brunei Darussalam</option>
                                    <option value="33"> Bulgaria</option>
                                    <option value="34"> Burkina Faso</option>
                                    <option value="35"> Burundi</option>
                                    <option value="36"> Cambodia</option>
                                    <option value="37"> Cameroon</option>
                                    <option value="38"> Canada</option>
                                    <option value="39"> Cape Verde</option>
                                    <option value="40"> Cayman Islands</option>
                                    <option value="41"> Central African Republic</option>
                                    <option value="42"> Chad</option>
                                    <option value="43"> Chile</option>
                                    <option value="44"> China</option>
                                    <option value="45"> Christmas Island</option>
                                    <option value="46"> Cocos (Keeling) Islands</option>
                                    <option value="47"> Colombia</option>
                                    <option value="48"> Comoros</option>
                                    <option value="49"> Congo</option>
                                    <option value="50"> Cook Islands</option>
                                    <option value="51"> Costa Rica</option>
                                    <option value="52"> Croatia (Hrvatska)</option>
                                    <option value="53"> Cuba</option>
                                    <option value="54"> Cyprus</option>
                                    <option value="55"> Czech Republic</option>
                                    <option value="56"> Denmark</option>
                                    <option value="57"> Djibouti</option>
                                    <option value="58"> Dominica</option>
                                    <option value="59"> Dominican Republic</option>
                                    <option value="60"> East Timor</option>
                                    <option value="61"> Ecuador</option>
                                    <option value="62"> Egypt</option>
                                    <option value="63"> El Salvador</option>
                                    <option value="64"> Equatorial Guinea</option>
                                    <option value="65"> Eritrea</option>
                                    <option value="66"> Estonia</option>
                                    <option value="67"> Ethiopia</option>
                                    <option value="68"> Falkland Islands (Malvinas)</option>
                                    <option value="69"> Faroe Islands</option>
                                    <option value="70"> Fiji</option>
                                    <option value="71"> Finland</option>
                                    <option value="72"> France</option>
                                    <option value="73"> France, Metropolitan</option>
                                    <option value="74"> French Guiana</option>
                                    <option value="75"> French Polynesia</option>
                                    <option value="76"> French Southern Territories</option>
                                    <option value="77"> Gabon</option>
                                    <option value="78"> Gambia</option>
                                    <option value="79"> Georgia</option>
                                    <option value="80"> Germany</option>
                                    <option value="81"> Ghana</option>
                                    <option value="82"> Gibraltar</option>
                                    <option value="83"> Guernsey</option>
                                    <option value="84"> Greece</option>
                                    <option value="85"> Greenland</option>
                                    <option value="86"> Grenada</option>
                                    <option value="87"> Guadeloupe</option>
                                    <option value="88"> Guam</option>
                                    <option value="89"> Guatemala</option>
                                    <option value="90"> Guinea</option>
                                    <option value="91"> Guinea-Bissau</option>
                                    <option value="92"> Guyana</option>
                                    <option value="93"> Haiti</option>
                                    <option value="94"> Heard and Mc Donald Islands</option>
                                    <option value="95"> Honduras</option>
                                    <option value="96"> Hong Kong</option>
                                    <option value="97"> Hungary</option>
                                    <option value="98"> Iceland</option>
                                    <option value="99"> India</option>
                                    <option value="100"> Isle of Man</option>
                                    <option value="101"> Indonesia</option>
                                    <option value="102"> Iran (Islamic Republic of)</option>
                                    <option value="103"> Iraq</option>
                                    <option value="104"> Ireland</option>
                                    <option value="105"> Israel</option>
                                    <option value="106"> Italy</option>
                                    <option value="107"> Ivory Coast</option>
                                    <option value="108"> Jersey</option>
                                    <option value="109"> Jamaica</option>
                                    <option value="110"> Japan</option>
                                    <option value="111"> Jordan</option>
                                    <option value="112"> Kazakhstan</option>
                                    <option value="113"> Kenya</option>
                                    <option value="114"> Kiribati</option>
                                    <option value="115"> Korea, Democratic People's Republic of</option>
                                    <option value="116"> Korea, Republic of</option>
                                    <option value="117"> Kosovo</option>
                                    <option value="118"> Kuwait</option>
                                    <option value="119"> Kyrgyzstan</option>
                                    <option value="120"> Lao People's Democratic Republic</option>
                                    <option value="121"> Latvia</option>
                                    <option value="122"> Lebanon</option>
                                    <option value="123"> Lesotho</option>
                                    <option value="124"> Liberia</option>
                                    <option value="125"> Libyan Arab Jamahiriya</option>
                                    <option value="126"> Liechtenstein</option>
                                    <option value="127"> Lithuania</option>
                                    <option value="128"> Luxembourg</option>
                                    <option value="129"> Macau</option>
                                    <option value="130"> Macedonia</option>
                                    <option value="131"> Madagascar</option>
                                    <option value="132"> Malawi</option>
                                    <option value="133"> Malaysia</option>
                                    <option value="134"> Maldives</option>
                                    <option value="135"> Mali</option>
                                    <option value="136"> Malta</option>
                                    <option value="137"> Marshall Islands</option>
                                    <option value="138"> Martinique</option>
                                    <option value="139"> Mauritania</option>
                                    <option value="140"> Mauritius</option>
                                    <option value="141"> Mayotte</option>
                                    <option value="142"> Mexico</option>
                                    <option value="143"> Micronesia, Federated States of</option>
                                    <option value="144"> Moldova, Republic of</option>
                                    <option value="145"> Monaco</option>
                                    <option value="146"> Mongolia</option>
                                    <option value="147"> Montenegro</option>
                                    <option value="148"> Montserrat</option>
                                    <option value="149"> Morocco</option>
                                    <option value="150"> Mozambique</option>
                                    <option value="151"> Myanmar</option>
                                    <option value="152"> Namibia</option>
                                    <option value="153"> Nauru</option>
                                    <option value="154"> Nepal</option>
                                    <option value="155"> Netherlands</option>
                                    <option value="156"> Netherlands Antilles</option>
                                    <option value="157"> New Caledonia</option>
                                    <option value="158"> New Zealand</option>
                                    <option value="159"> Nicaragua</option>
                                    <option value="160"> Niger</option>
                                    <option value="161"> Nigeria</option>
                                    <option value="162"> Niue</option>
                                    <option value="163"> Norfolk Island</option>
                                    <option value="164"> Northern Mariana Islands</option>
                                    <option value="165"> Norway</option>
                                    <option value="166"> Oman</option>
                                    <option value="167"> Pakistan</option>
                                    <option value="168"> Palau</option>
                                    <option value="169"> Palestine</option>
                                    <option value="170"> Panama</option>
                                    <option value="171"> Papua New Guinea</option>
                                    <option value="172"> Paraguay</option>
                                    <option value="173"> Peru</option>
                                    <option value="174"> Philippines</option>
                                    <option value="175"> Pitcairn</option>
                                    <option value="176"> Poland</option>
                                    <option value="177"> Portugal</option>
                                    <option value="178"> Puerto Rico</option>
                                    <option value="179"> Qatar</option>
                                    <option value="180"> Reunion</option>
                                    <option value="181"> Romania</option>
                                    <option value="182"> Russian Federation</option>
                                    <option value="183"> Rwanda</option>
                                    <option value="184"> Saint Kitts and Nevis</option>
                                    <option value="185"> Saint Lucia</option>
                                    <option value="186"> Saint Vincent and the Grenadines</option>
                                    <option value="187"> Samoa</option>
                                    <option value="188"> San Marino</option>
                                    <option value="189"> Sao Tome and Principe</option>
                                    <option value="190"> Saudi Arabia</option>
                                    <option value="191"> Senegal</option>
                                    <option value="192"> Serbia</option>
                                    <option value="193"> Seychelles</option>
                                    <option value="194"> Sierra Leone</option>
                                    <option value="195"> Singapore</option>
                                    <option value="196"> Slovakia</option>
                                    <option value="197"> Slovenia</option>
                                    <option value="198"> Solomon Islands</option>
                                    <option value="199"> Somalia</option>
                                    <option value="200"> South Africa</option>
                                    <option value="201"> South Georgia South Sandwich Islands</option>
                                    <option value="202"> Spain</option>
                                    <option value="203"> Sri Lanka</option>
                                    <option value="204"> St. Helena</option>
                                    <option value="205"> St. Pierre and Miquelon</option>
                                    <option value="206"> Sudan</option>
                                    <option value="207"> Suriname</option>
                                    <option value="208"> Svalbard and Jan Mayen Islands</option>
                                    <option value="209"> Swaziland</option>
                                    <option value="210"> Sweden</option>
                                    <option value="211"> Switzerland</option>
                                    <option value="212"> Syrian Arab Republic</option>
                                    <option value="213"> Taiwan</option>
                                    <option value="214"> Tajikistan</option>
                                    <option value="215"> Tanzania, United Republic of</option>
                                    <option value="216"> Thailand</option>
                                    <option value="217"> Togo</option>
                                    <option value="218"> Tokelau</option>
                                    <option value="219"> Tonga</option>
                                    <option value="220"> Trinidad and Tobago</option>
                                    <option value="221"> Tunisia</option>
                                    <option value="222"> Turkey</option>
                                    <option value="223"> Turkmenistan</option>
                                    <option value="224"> Turks and Caicos Islands</option>
                                    <option value="225"> Tuvalu</option>
                                    <option value="226"> Uganda</option>
                                    <option value="227"> Ukraine</option>
                                    <option value="228"> United Arab Emirates</option>
                                    <option value="229"> United Kingdom</option>
                                    <option value="230"> United States</option>
                                    <option value="231"> United States minor outlying islands</option>
                                    <option value="232"> Uruguay</option>
                                    <option value="233"> Uzbekistan</option>
                                    <option value="234"> Vanuatu</option>
                                    <option value="235"> Vatican City State</option>
                                    <option value="236"> Venezuela</option>
                                    <option value="237"> Vietnam</option>
                                    <option value="238"> Virgin Islands (British)</option>
                                    <option value="239"> Virgin Islands (U.S.)</option>
                                    <option value="240"> Wallis and Futuna Islands</option>
                                    <option value="241"> Western Sahara</option>
                                    <option value="242"> Yemen</option>
                                    <option value="243"> Zaire</option>
                                    <option value="244"> Zambia</option>
                                    <option value="245"> Zimbabwe</option>
                            </select>
                        </div>
                    </div>
                    
                </div>
                
               
                <div class="col-md-12 mt-3 text-right">
                    <button type="submit" class="btn btn-primary ">
                        <i class="fa fa-check-square mr-1"></i>Save</button>
                </div>
            </div>
           
        </form>
    </div>
</div>
</div>

<div class="mt-3">
<div class="card   mb-4"> 
    <div class="card-header">
        <h5>
            List All Companies 
        </h5>
    </div>
    <div class="card-body">
<div class="table-responsive">
<table class="table table-bordered table-sm" id="example1" width="100%" cellspacing="0">
    <thead> 
        <th>Action</th>
        <th>Company</th>
        <th><i class="fa fa-envelope"></i> Email</th>
        <th>City</th> 
        <th>Currency</th>
        <th>Time Zone</th>  
    </thead>  
    <tbody>
    @foreach($table as $rows)
    <tr> 
         <td>
            <a href="javascript:void(0)" class="edit btn btn-info btn-sm"  value="{{$rows->company_id}}" data-toggle="modal" data-target="#exampleModal">
                <i class="fa fa-edit"></i>
            </a>
            <a href="javascript:void(0)" class="view btn btn-primary btn-sm" data-toggle="modal" data-target="#showmodal" value="{{$rows->company_id}}">
                <i class="fa fa-eye"></i>
            </a>
            <a href="{{ route('company-delete' , $rows->company_id) }}" class="delete btn btn-danger btn-sm"  >
                <i class="fa fa-trash-alt"></i>
            </a>
        </td>

        <td class='font-italic'>
        <span class='text-uppercase'>{{$rows->username}}</span>
        <br>
        Type:{{ $rows->name }}
        <br>
        Contact#:{{$rows->contact_number}}
        <br>
        Website#:{{$rows->website_url}}
        </td>
        <td>{{ $rows->email }}</td>
        <td>{{ $rows->city }}</td>
        <td>{{ $rows->default_currency }}</td>
        <td>{{ $rows->default_timezone }}</td>
    </tr>
    @endforeach
    </tbody> 
   
</table>
</div>    
</div>
</div>    
</div>
<!-- comment -->
 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form method="post" action="{{ route('company-update') }}">
            @csrf
            <div class="row">
                <div class="col-md-6">
                     <input type="hidden" class="id" ></input>
                <p>
                <label>Company Name</label>
                <input type="text" name="company" class="company-name form form-control" placeholder="Company Name">
                </p> 
                <div class="row">
                    <div class="col-6">
                        <label>Company Type</label>
                        <select name="company-type" class="company-type form form-control  ">
                            @foreach($type as $row)
                            <option value='{{ $row->type_id }}'>{{ $row->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-6">
                        <label>Leagal / Trading Name</label>
                         <input type="text" name="legal-trading-name" class="trading-name form form-control" placeholder="Leagl /Trading Name">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-6">
                        <label>Registration Number</label>
                         <input type="text" name="registration-name" class="registration-no form form-control" placeholder="Registration Name">
                    </div>
                    <div class="col-6">
                        <label>Contact Number</label>
                         <input type="text" name="contact-number" class="contact-number form form-control" plceholder="Contact Number">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-6">
                        <label>Email</label>
                         <input type="email" name="email" class="email form form-control" placeholder="Email">
                    </div>
                    <div class="col-6">
                        <label>Website Url</label>
                         <input type="text" name="website-url" class="wesite-url form form-control" plceholder="Website url">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-6">
                        <label>Username</label>
                         <input type="text" name="username" class="username form form-control" placeholder="Username">
                    </div>
                    <div class="col-6">
                        <label>Password</label>
                         <input type="password" name="password" class="password form form-control" placeholder="password">
                    </div>
                </div>
                
                </div>
                <div class="col-md-6">
                    
                    <p>
                    <label>Tax Number & EIN</label>
                    <input type="text" name="tax-number" class="tax-ein form form-control  " placeholder="Tax Number & EIN">
                    </p>
                    
                    <p>
                    <label>Address</label>
                    <input type="text" name="address-one" class="address-1 form form-control  " placeholder="Address Line 1">
                    </p>
                    <p>
                    <input type="text" name="address-two" class="address-2 form form-control  " placeholder="Address Line 2">
                    </p>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <input name="city" class="city form form-control form-sm" placeholder="City">
                        </div>
                        <div class="col-md-4">
                            <input name="state-province" class="state form form-control  " placeholder="State/Province">
                        </div>
                        <div class="col-md-4">
                            <input name="zip-code" class="zip form form-control  " placeholder="Zip Code">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">
                            <label>Company Logo</label>
                            <input type="file" name="company-logo" class="company-logo form form-control  "> 
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Currency</label>
                            <select class="form form-control" name="currency">
                                <option value="SGD - s$">
                                    SGD - s$
                                </option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label>Time Zone</label>
                            <select class="form form-control" name="timezone">
                                <option value="Pacific/Midway">(GMT-11:00) Midway Island</option>
                                        <option value="US/Samoa">(GMT-11:00) Samoa</option>
                                        <option value="US/Hawaii">(GMT-10:00) Hawaii</option>
                                        <option value="US/Alaska">(GMT-09:00) Alaska</option>
                                        <option value="US/Pacific">(GMT-08:00) Pacific Time (US &amp; Canada)</option>
                                        <option value="America/Tijuana">(GMT-08:00) Tijuana</option>
                                        <option value="US/Arizona">(GMT-07:00) Arizona</option>
                                        <option value="US/Mountain">(GMT-07:00) Mountain Time (US &amp; Canada)</option>
                                        <option value="America/Chihuahua">(GMT-07:00) Chihuahua</option>
                                        <option value="America/Mazatlan">(GMT-07:00) Mazatlan</option>
                                        <option value="America/Mexico_City">(GMT-06:00) Mexico City</option>
                                        <option value="America/Monterrey">(GMT-06:00) Monterrey</option>
                                        <option value="Canada/Saskatchewan">(GMT-06:00) Saskatchewan</option>
                                        <option value="US/Central">(GMT-06:00) Central Time (US &amp; Canada)</option>
                                        <option value="US/Eastern">(GMT-05:00) Eastern Time (US &amp; Canada)</option>
                                        <option value="US/East-Indiana">(GMT-05:00) Indiana (East)</option>
                                        <option value="America/Bogota">(GMT-05:00) Bogota</option>
                                        <option value="America/Lima">(GMT-05:00) Lima</option>
                                        <option value="America/Caracas">(GMT-04:30) Caracas</option>
                                        <option value="Canada/Atlantic">(GMT-04:00) Atlantic Time (Canada)</option>
                                        <option value="America/La_Paz">(GMT-04:00) La Paz</option>
                                        <option value="America/Santiago">(GMT-04:00) Santiago</option>
                                        <option value="Canada/Newfoundland">(GMT-03:30) Newfoundland</option>
                                        <option value="America/Buenos_Aires">(GMT-03:00) Buenos Aires</option>
                                        <option value="Greenland">(GMT-03:00) Greenland</option>
                                        <option value="Atlantic/Stanley">(GMT-02:00) Stanley</option>
                                        <option value="Atlantic/Azores">(GMT-01:00) Azores</option>
                                        <option value="Atlantic/Cape_Verde">(GMT-01:00) Cape Verde Is.</option>
                                        <option value="Africa/Casablanca">(GMT) Casablanca</option>
                                        <option value="Europe/Dublin">(GMT) Dublin</option>
                                        <option value="Europe/Lisbon">(GMT) Lisbon</option>
                                        <option value="Europe/London">(GMT) London</option>
                                        <option value="Africa/Monrovia">(GMT) Monrovia</option>
                                        <option value="Europe/Amsterdam">(GMT+01:00) Amsterdam</option>
                                        <option value="Europe/Belgrade">(GMT+01:00) Belgrade</option>
                                        <option value="Europe/Berlin">(GMT+01:00) Berlin</option>
                                        <option value="Europe/Bratislava">(GMT+01:00) Bratislava</option>
                                        <option value="Europe/Brussels">(GMT+01:00) Brussels</option>
                                        <option value="Europe/Budapest">(GMT+01:00) Budapest</option>
                                        <option value="Europe/Copenhagen">(GMT+01:00) Copenhagen</option>
                                        <option value="Europe/Ljubljana">(GMT+01:00) Ljubljana</option>
                                        <option value="Europe/Madrid">(GMT+01:00) Madrid</option>
                                        <option value="Europe/Paris">(GMT+01:00) Paris</option>
                                        <option value="Europe/Prague">(GMT+01:00) Prague</option>
                                        <option value="Europe/Rome">(GMT+01:00) Rome</option>
                                        <option value="Europe/Sarajevo">(GMT+01:00) Sarajevo</option>
                                        <option value="Europe/Skopje">(GMT+01:00) Skopje</option>
                                        <option value="Europe/Stockholm">(GMT+01:00) Stockholm</option>
                                        <option value="Europe/Vienna">(GMT+01:00) Vienna</option>
                                        <option value="Europe/Warsaw">(GMT+01:00) Warsaw</option>
                                        <option value="Europe/Zagreb">(GMT+01:00) Zagreb</option>
                                        <option value="Europe/Athens">(GMT+02:00) Athens</option>
                                        <option value="Europe/Bucharest">(GMT+02:00) Bucharest</option>
                                        <option value="Africa/Cairo">(GMT+02:00) Cairo</option>
                                        <option value="Africa/Harare">(GMT+02:00) Harare</option>
                                        <option value="Europe/Helsinki">(GMT+02:00) Helsinki</option>
                                        <option value="Europe/Istanbul">(GMT+02:00) Istanbul</option>
                                        <option value="Asia/Jerusalem">(GMT+02:00) Jerusalem</option>
                                        <option value="Europe/Kiev">(GMT+02:00) Kyiv</option>
                                        <option value="Europe/Minsk">(GMT+02:00) Minsk</option>
                                        <option value="Europe/Riga">(GMT+02:00) Riga</option>
                                        <option value="Europe/Sofia">(GMT+02:00) Sofia</option>
                                        <option value="Europe/Tallinn">(GMT+02:00) Tallinn</option>
                                        <option value="Europe/Vilnius">(GMT+02:00) Vilnius</option>
                                        <option value="Asia/Baghdad">(GMT+03:00) Baghdad</option>
                                        <option value="Asia/Kuwait">(GMT+03:00) Kuwait</option>
                                        <option value="Africa/Nairobi">(GMT+03:00) Nairobi</option>
                                        <option value="Asia/Riyadh">(GMT+03:00) Riyadh</option>
                                        <option value="Europe/Moscow">(GMT+03:00) Moscow</option>
                                        <option value="Asia/Tehran">(GMT+03:30) Tehran</option>
                                        <option value="Asia/Baku">(GMT+04:00) Baku</option>
                                        <option value="Europe/Volgograd">(GMT+04:00) Volgograd</option>
                                        <option value="Asia/Muscat">(GMT+04:00) Muscat</option>
                                        <option value="Asia/Tbilisi">(GMT+04:00) Tbilisi</option>
                                        <option value="Asia/Yerevan">(GMT+04:00) Yerevan</option>
                                        <option value="Asia/Kabul">(GMT+04:30) Kabul</option>
                                        <option value="Asia/Karachi">(GMT+05:00) Karachi</option>
                                        <option value="Asia/Tashkent">(GMT+05:00) Tashkent</option>
                                        <option value="Asia/Kolkata">(GMT+05:30) Kolkata</option>
                                        <option value="Asia/Kathmandu">(GMT+05:45) Kathmandu</option>
                                        <option value="Asia/Yekaterinburg">(GMT+06:00) Ekaterinburg</option>
                                        <option value="Asia/Almaty">(GMT+06:00) Almaty</option>
                                        <option value="Asia/Dhaka">(GMT+06:00) Dhaka</option>
                                        <option value="Asia/Novosibirsk">(GMT+07:00) Novosibirsk</option>
                                        <option value="Asia/Bangkok">(GMT+07:00) Bangkok</option>
                                        <option value="Asia/Jakarta">(GMT+07:00) Jakarta</option>
                                        <option value="Asia/Krasnoyarsk">(GMT+08:00) Krasnoyarsk</option>
                                        <option value="Asia/Chongqing">(GMT+08:00) Chongqing</option>
                                        <option value="Asia/Hong_Kong">(GMT+08:00) Hong Kong</option>
                                        <option value="Asia/Kuala_Lumpur">(GMT+08:00) Kuala Lumpur</option>
                                        <option value="Australia/Perth">(GMT+08:00) Perth</option>
                                        <option value="Asia/Singapore">(GMT+08:00) Singapore</option>
                                        <option value="Asia/Taipei">(GMT+08:00) Taipei</option>
                                        <option value="Asia/Ulaanbaatar">(GMT+08:00) Ulaan Bataar</option>
                                        <option value="Asia/Urumqi">(GMT+08:00) Urumqi</option>
                                        <option value="Asia/Irkutsk">(GMT+09:00) Irkutsk</option>
                                        <option value="Asia/Seoul">(GMT+09:00) Seoul</option>
                                        <option value="Asia/Tokyo">(GMT+09:00) Tokyo</option>
                                        <option value="Australia/Adelaide">(GMT+09:30) Adelaide</option>
                                        <option value="Australia/Darwin">(GMT+09:30) Darwin</option>
                                        <option value="Asia/Yakutsk">(GMT+10:00) Yakutsk</option>
                                        <option value="Australia/Brisbane">(GMT+10:00) Brisbane</option>
                                        <option value="Australia/Canberra">(GMT+10:00) Canberra</option>
                                        <option value="Pacific/Guam">(GMT+10:00) Guam</option>
                                        <option value="Australia/Hobart">(GMT+10:00) Hobart</option>
                                        <option value="Australia/Melbourne">(GMT+10:00) Melbourne</option>
                                        <option value="Pacific/Port_Moresby">(GMT+10:00) Port Moresby</option>
                                        <option value="Australia/Sydney">(GMT+10:00) Sydney</option>
                                        <option value="Asia/Vladivostok">(GMT+11:00) Vladivostok</option>
                                        <option value="Asia/Magadan">(GMT+12:00) Magadan</option>
                                        <option value="Pacific/Auckland">(GMT+12:00) Auckland</option>
                                        <option value="Pacific/Fiji">(GMT+12:00) Fiji</option>
                            </select>
                        </div>
                    </div>
                    <div class="row my-3">
                        <div class="col">
                            <select class="form-control" name="country">
                                <option value="">Select One</option>
                                    <option value="1"> Afghanistan</option>
                                    <option value="2"> Albania</option>
                                    <option value="3"> Algeria</option>
                                    <option value="4"> American Samoa</option>
                                    <option value="5"> Andorra</option>
                                    <option value="6"> Angola</option>
                                    <option value="7"> Anguilla</option>
                                    <option value="8"> Antarctica</option>
                                    <option value="9"> Antigua and Barbuda</option>
                                    <option value="10"> Argentina</option>
                                    <option value="11"> Armenia</option>
                                    <option value="12"> Aruba</option>
                                    <option value="13"> Australia</option>
                                    <option value="14"> Austria</option>
                                    <option value="15"> Azerbaijan</option>
                                    <option value="16"> Bahamas</option>
                                    <option value="17"> Bahrain</option>
                                    <option value="18"> Bangladesh</option>
                                    <option value="19"> Barbados</option>
                                    <option value="20"> Belarus</option>
                                    <option value="21"> Belgium</option>
                                    <option value="22"> Belize</option>
                                    <option value="23"> Benin</option>
                                    <option value="24"> Bermuda</option>
                                    <option value="25"> Bhutan</option>
                                    <option value="26"> Bolivia</option>
                                    <option value="27"> Bosnia and Herzegovina</option>
                                    <option value="28"> Botswana</option>
                                    <option value="29"> Bouvet Island</option>
                                    <option value="30"> Brazil</option>
                                    <option value="31"> British Indian Ocean Territory</option>
                                    <option value="32"> Brunei Darussalam</option>
                                    <option value="33"> Bulgaria</option>
                                    <option value="34"> Burkina Faso</option>
                                    <option value="35"> Burundi</option>
                                    <option value="36"> Cambodia</option>
                                    <option value="37"> Cameroon</option>
                                    <option value="38"> Canada</option>
                                    <option value="39"> Cape Verde</option>
                                    <option value="40"> Cayman Islands</option>
                                    <option value="41"> Central African Republic</option>
                                    <option value="42"> Chad</option>
                                    <option value="43"> Chile</option>
                                    <option value="44"> China</option>
                                    <option value="45"> Christmas Island</option>
                                    <option value="46"> Cocos (Keeling) Islands</option>
                                    <option value="47"> Colombia</option>
                                    <option value="48"> Comoros</option>
                                    <option value="49"> Congo</option>
                                    <option value="50"> Cook Islands</option>
                                    <option value="51"> Costa Rica</option>
                                    <option value="52"> Croatia (Hrvatska)</option>
                                    <option value="53"> Cuba</option>
                                    <option value="54"> Cyprus</option>
                                    <option value="55"> Czech Republic</option>
                                    <option value="56"> Denmark</option>
                                    <option value="57"> Djibouti</option>
                                    <option value="58"> Dominica</option>
                                    <option value="59"> Dominican Republic</option>
                                    <option value="60"> East Timor</option>
                                    <option value="61"> Ecuador</option>
                                    <option value="62"> Egypt</option>
                                    <option value="63"> El Salvador</option>
                                    <option value="64"> Equatorial Guinea</option>
                                    <option value="65"> Eritrea</option>
                                    <option value="66"> Estonia</option>
                                    <option value="67"> Ethiopia</option>
                                    <option value="68"> Falkland Islands (Malvinas)</option>
                                    <option value="69"> Faroe Islands</option>
                                    <option value="70"> Fiji</option>
                                    <option value="71"> Finland</option>
                                    <option value="72"> France</option>
                                    <option value="73"> France, Metropolitan</option>
                                    <option value="74"> French Guiana</option>
                                    <option value="75"> French Polynesia</option>
                                    <option value="76"> French Southern Territories</option>
                                    <option value="77"> Gabon</option>
                                    <option value="78"> Gambia</option>
                                    <option value="79"> Georgia</option>
                                    <option value="80"> Germany</option>
                                    <option value="81"> Ghana</option>
                                    <option value="82"> Gibraltar</option>
                                    <option value="83"> Guernsey</option>
                                    <option value="84"> Greece</option>
                                    <option value="85"> Greenland</option>
                                    <option value="86"> Grenada</option>
                                    <option value="87"> Guadeloupe</option>
                                    <option value="88"> Guam</option>
                                    <option value="89"> Guatemala</option>
                                    <option value="90"> Guinea</option>
                                    <option value="91"> Guinea-Bissau</option>
                                    <option value="92"> Guyana</option>
                                    <option value="93"> Haiti</option>
                                    <option value="94"> Heard and Mc Donald Islands</option>
                                    <option value="95"> Honduras</option>
                                    <option value="96"> Hong Kong</option>
                                    <option value="97"> Hungary</option>
                                    <option value="98"> Iceland</option>
                                    <option value="99"> India</option>
                                    <option value="100"> Isle of Man</option>
                                    <option value="101"> Indonesia</option>
                                    <option value="102"> Iran (Islamic Republic of)</option>
                                    <option value="103"> Iraq</option>
                                    <option value="104"> Ireland</option>
                                    <option value="105"> Israel</option>
                                    <option value="106"> Italy</option>
                                    <option value="107"> Ivory Coast</option>
                                    <option value="108"> Jersey</option>
                                    <option value="109"> Jamaica</option>
                                    <option value="110"> Japan</option>
                                    <option value="111"> Jordan</option>
                                    <option value="112"> Kazakhstan</option>
                                    <option value="113"> Kenya</option>
                                    <option value="114"> Kiribati</option>
                                    <option value="115"> Korea, Democratic People's Republic of</option>
                                    <option value="116"> Korea, Republic of</option>
                                    <option value="117"> Kosovo</option>
                                    <option value="118"> Kuwait</option>
                                    <option value="119"> Kyrgyzstan</option>
                                    <option value="120"> Lao People's Democratic Republic</option>
                                    <option value="121"> Latvia</option>
                                    <option value="122"> Lebanon</option>
                                    <option value="123"> Lesotho</option>
                                    <option value="124"> Liberia</option>
                                    <option value="125"> Libyan Arab Jamahiriya</option>
                                    <option value="126"> Liechtenstein</option>
                                    <option value="127"> Lithuania</option>
                                    <option value="128"> Luxembourg</option>
                                    <option value="129"> Macau</option>
                                    <option value="130"> Macedonia</option>
                                    <option value="131"> Madagascar</option>
                                    <option value="132"> Malawi</option>
                                    <option value="133"> Malaysia</option>
                                    <option value="134"> Maldives</option>
                                    <option value="135"> Mali</option>
                                    <option value="136"> Malta</option>
                                    <option value="137"> Marshall Islands</option>
                                    <option value="138"> Martinique</option>
                                    <option value="139"> Mauritania</option>
                                    <option value="140"> Mauritius</option>
                                    <option value="141"> Mayotte</option>
                                    <option value="142"> Mexico</option>
                                    <option value="143"> Micronesia, Federated States of</option>
                                    <option value="144"> Moldova, Republic of</option>
                                    <option value="145"> Monaco</option>
                                    <option value="146"> Mongolia</option>
                                    <option value="147"> Montenegro</option>
                                    <option value="148"> Montserrat</option>
                                    <option value="149"> Morocco</option>
                                    <option value="150"> Mozambique</option>
                                    <option value="151"> Myanmar</option>
                                    <option value="152"> Namibia</option>
                                    <option value="153"> Nauru</option>
                                    <option value="154"> Nepal</option>
                                    <option value="155"> Netherlands</option>
                                    <option value="156"> Netherlands Antilles</option>
                                    <option value="157"> New Caledonia</option>
                                    <option value="158"> New Zealand</option>
                                    <option value="159"> Nicaragua</option>
                                    <option value="160"> Niger</option>
                                    <option value="161"> Nigeria</option>
                                    <option value="162"> Niue</option>
                                    <option value="163"> Norfolk Island</option>
                                    <option value="164"> Northern Mariana Islands</option>
                                    <option value="165"> Norway</option>
                                    <option value="166"> Oman</option>
                                    <option value="167"> Pakistan</option>
                                    <option value="168"> Palau</option>
                                    <option value="169"> Palestine</option>
                                    <option value="170"> Panama</option>
                                    <option value="171"> Papua New Guinea</option>
                                    <option value="172"> Paraguay</option>
                                    <option value="173"> Peru</option>
                                    <option value="174"> Philippines</option>
                                    <option value="175"> Pitcairn</option>
                                    <option value="176"> Poland</option>
                                    <option value="177"> Portugal</option>
                                    <option value="178"> Puerto Rico</option>
                                    <option value="179"> Qatar</option>
                                    <option value="180"> Reunion</option>
                                    <option value="181"> Romania</option>
                                    <option value="182"> Russian Federation</option>
                                    <option value="183"> Rwanda</option>
                                    <option value="184"> Saint Kitts and Nevis</option>
                                    <option value="185"> Saint Lucia</option>
                                    <option value="186"> Saint Vincent and the Grenadines</option>
                                    <option value="187"> Samoa</option>
                                    <option value="188"> San Marino</option>
                                    <option value="189"> Sao Tome and Principe</option>
                                    <option value="190"> Saudi Arabia</option>
                                    <option value="191"> Senegal</option>
                                    <option value="192"> Serbia</option>
                                    <option value="193"> Seychelles</option>
                                    <option value="194"> Sierra Leone</option>
                                    <option value="195"> Singapore</option>
                                    <option value="196"> Slovakia</option>
                                    <option value="197"> Slovenia</option>
                                    <option value="198"> Solomon Islands</option>
                                    <option value="199"> Somalia</option>
                                    <option value="200"> South Africa</option>
                                    <option value="201"> South Georgia South Sandwich Islands</option>
                                    <option value="202"> Spain</option>
                                    <option value="203"> Sri Lanka</option>
                                    <option value="204"> St. Helena</option>
                                    <option value="205"> St. Pierre and Miquelon</option>
                                    <option value="206"> Sudan</option>
                                    <option value="207"> Suriname</option>
                                    <option value="208"> Svalbard and Jan Mayen Islands</option>
                                    <option value="209"> Swaziland</option>
                                    <option value="210"> Sweden</option>
                                    <option value="211"> Switzerland</option>
                                    <option value="212"> Syrian Arab Republic</option>
                                    <option value="213"> Taiwan</option>
                                    <option value="214"> Tajikistan</option>
                                    <option value="215"> Tanzania, United Republic of</option>
                                    <option value="216"> Thailand</option>
                                    <option value="217"> Togo</option>
                                    <option value="218"> Tokelau</option>
                                    <option value="219"> Tonga</option>
                                    <option value="220"> Trinidad and Tobago</option>
                                    <option value="221"> Tunisia</option>
                                    <option value="222"> Turkey</option>
                                    <option value="223"> Turkmenistan</option>
                                    <option value="224"> Turks and Caicos Islands</option>
                                    <option value="225"> Tuvalu</option>
                                    <option value="226"> Uganda</option>
                                    <option value="227"> Ukraine</option>
                                    <option value="228"> United Arab Emirates</option>
                                    <option value="229"> United Kingdom</option>
                                    <option value="230"> United States</option>
                                    <option value="231"> United States minor outlying islands</option>
                                    <option value="232"> Uruguay</option>
                                    <option value="233"> Uzbekistan</option>
                                    <option value="234"> Vanuatu</option>
                                    <option value="235"> Vatican City State</option>
                                    <option value="236"> Venezuela</option>
                                    <option value="237"> Vietnam</option>
                                    <option value="238"> Virgin Islands (British)</option>
                                    <option value="239"> Virgin Islands (U.S.)</option>
                                    <option value="240"> Wallis and Futuna Islands</option>
                                    <option value="241"> Western Sahara</option>
                                    <option value="242"> Yemen</option>
                                    <option value="243"> Zaire</option>
                                    <option value="244"> Zambia</option>
                                    <option value="245"> Zimbabwe</option>
                            </select>
                        </div>
                    </div>
                    
                </div>
                
               
                <div class="col-md-12 mt-3 text-right"> 
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary ">
                        <i class="fa fa-check-square mr-1"></i>Save</button>
                </div>
            </div> 
            </form>
      </div> 
    </div>
  </div>
</div>

<div class="modal fade" id="showmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-info" id="exampleModalLabel">View Company</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         
        <table class="table table-bordered table-striped show-table text-md"> 
            <tr>
                <td>Company Name</td><td>
                    <span class="c-name"></span>
                </td>
            </tr>
             <tr>
                <td>Company Type</td><td>
                    <span class="c-type"></span>
                </td>
            </tr> <tr>
                <td>Legal / Trading Name</td><td>
                    <span class="trading-name"></span>
                </td>
            </tr>
             <tr>
                <td>Registration Number</td><td>
                    <span class="reg-no"></span>
                </td>
            </tr>
            <tr>
                <td>Username</td><td>
                    <span class="username"></span>
                </td>
            </tr>
             <tr>
                <td>Contact Number</td><td>
                    <span class="contact"></span>
                </td>
            </tr> <tr>
                <td>Email</td><td>
                    <span class="email"></span>
                </td>
            </tr>
             <tr>
                <td>Website</td><td>
                    <span class="website"></span>
                </td>
            </tr>
             <tr>
                <td>Tax Number/ EIN</td><td>
                    <span class="tax-ein"></span>
                </td>
            </tr>
             <tr>
                <td>Currency</td><td>
                    <span class="currency"></span>
                </td>
            </tr> <tr>
                <td>Timezone</td><td>
                    <span class="timezone"></span>
                </td>
            </tr>
             <tr>
                <td>Address</td><td>
                    <span class="Address"></span>
                </td>
            </tr>
            <tr>
                <td>City</td><td>
                    <span class="city"></span>
                </td>
            </tr>
             <tr>
                <td>State/Province</td><td>
                    <span class="state"></span>
                </td>
            </tr> <tr>
                <td>Zip Code</td><td>
                    <span class="zip"></span>
                </td>
            </tr>
             <tr>
                <td>Country</td><td>
                    <span class="country"></span>
                </td>
            </tr>
            <tr>
                <td>Company Logo</td><td>
                    <span class="c-logo"></span>
                </td>
            </tr> 
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
       
      </div>
    </div>
  </div>
</div> 

@if(Session::get('status') == 1) 
    <script type="text/javascript">
        toastr.options = {
             "onclick": null,
              "fadeIn": 300,
              "fadeOut": 1000,
              "timeOut": 5000,
              "extendedTimeOut": 1000,
               "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut",
                "closeButton":true,
                "title":'title',
           "positionClass": "toast-top-center",
           "progressBar" : true
        }
      toastr.success("{!! Session::get('message') !!}",{"iconClass":'customer-info'});
    </script>  
 
@endif 

@if(Session::get('status') == 2) 
    <script type="text/javascript">
        toastr.options = {
           "onclick": null,
           "fadeIn": 300,
           "fadeOut": 1000,
           "timeOut": 5000,
           "extendedTimeOut": 1000,
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut",
            "iconClass": "customer-info",
           "positionClass": "toast-top-center",
           "progressBar" : true
        }
      toastr.error("{!! Session::get('message') !!}");
    </script>  
 
@endif

@if(Session::get('status') == 3) 
    <script type="text/javascript">
        toastr.options = {
             "onclick": null,
          "fadeIn": 300,
          "fadeOut": 1000,
          "timeOut": 5000,
          "extendedTimeOut": 1000,
           "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut",
            "iconClass": "customer-info",
           "positionClass": "toast-top-center",
           "progressBar" : true
        }
      toastr.info( "{{ Session::get('message') }}" );
    </script>  
 
@endif


<script type="text/javascript">

$(document).ready(function(){
    $.ajaxSetup({
    headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')}
});

    $('.add-form').hide();
    $(document).on('click','.add-new-button', function(){
        $('.add-form').slideToggle();
    }); 

$(document).on('click', '.edit', function(e){ 
    var $id = $(this).attr('value');
    console.log($id);
    $.ajax({
        url : '{{ url("company/edit") }}'+'/'+$id,
        type: 'post', 
        dataType: 'Json',
        success:function(data){
            console.log(data);
            $.each(data, function(key , value){
                console.log(value);
                $('.id').val(value.company_id);
                $('.company-name').val(value.name+' '+value.trading_name);
                $('.tax-ein').val(value.government_tax);
                $('.trading-name').val(value.trading_name);
                $('.registration-no').val(value.registration_no);
                $('.contact-number').val(value.contact_number);
                $('.email').val(value.email);
                $('.wesite-url').val(value.website_url);
                $('.username').val(value.username);
                $('.address-1').val(value.address_1);
                $('.address-2').val(value.address_2);

                $('.city').val(value.city);
                $('.state').val(value.country);
                $('.zip').val(value.zipcode);

                 
            });


        }
    }); 
      
});

$(document).on('click','.view',function(){
    var $id = $(this).attr('value');
    console.log($id);
    $.ajax({
        url : '{{ url("company/show") }}'+'/'+$id,
        type: 'post', 
        dataType: 'Json',
        success: function(data){
            $.each(data, function(key, value){
                 $('.c-name').text(value.company_name);
                 $('.c-type').text(value.type);
                 $('.trading-name').text(value.trading_name);
                 $('.reg-no').text(value.reistration_no);
                 $('.username').text(value.username);
                 $('.contact').text(value.contact_number);
                 $('.email').text(value.email);
                 $('.website').text(value.website_url);
                 $('.tax-eim').text(value.government_tax);
                 $('.currency').text(value.default_currency);
                 $('.timezone').text(value.default_timezone);
                 $('.address').text(value.address_1+' '+value.address_2);
                 $('.city').text(value.city);
                 $('.state').text(value.state);
                 $('.zip').text(value.zip);
                 $('.country').text(value.country);
                 $('.c-logo').text(value.logo); 
                }); 
        }
    });
});

});
</script>
@endsection