//API
import 'package:foodigy/presentation/static_screens/splash_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

//indian rubee
String iRubee = '\u{20B9}';
String token = box.read('auth_token');
String sessionId=box.read('sessionId');

String? fcmToken = '';

String auth_token = '';
final box = GetStorage();

//client token api
//String cToken = box.read('tokenClient');
String cToken = '';

String cmsTok = box.read('CMS_token');

//google client  token
String googleClientToken = '';
//cms token
String cmsToken =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjYzMTU5MTE5LCJleHAiOjE2NjU3NTExMTl9.txkcJH93wkFg7csJ-4o4ByEKdGOBcOUgVLZhVVH1MZ8";

String add = '';

//current user details
String currentUserId = '';
String selectDate = 'Date';
String selectDisaplayDate = 'Date';
String passDate = "2022-11-07T06:58:37.957Z";
DateTime focused = DateTime.now();

//get data from lat long
double latFoodigy = 0.1;
double longFoodigy = 0.1;
String latAddress = '';

//cureent lat long
double currentLat = 0.1;
double currentLong = 0.1;

//selected address
String selectedAddress = '';
String selecteAddressId='';

//filter data variable

//veg non veg
bool valueOne = false;
bool valueTwo = false;
bool valueThree = false;
List vegOrNonveg = [];
// var healthTags = [];
List healthTags = [];
//cuisines
List selectedCuisineList = [];

//
List selectedProductTiming = [];

//coupons applied
List coupons = [];

//sort price
String sortBy = '';

//icons height
double iconHeight = 13;

int? groupValue;

//address checkbox
bool? isAgree = false;

//date format
var formatted = DateFormat('dd/MM').format(now);
