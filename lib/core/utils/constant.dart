import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String token='';

void navigateTo(context,Widget)=>Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context)=>Widget
    ));

void navigateAndFinish(context,Widget)=>  Navigator.pushAndRemoveUntil(
     context,
     MaterialPageRoute(
         builder: (context) => Widget),
         (route) => false,
);

Widget container()=>Container(
  width: 134,
  height: 5,
  margin: const EdgeInsets.only(bottom: 8),
  decoration: ShapeDecoration(
    color: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);


Widget buildTextField({
  required String text,
  required IconData prefixIcon,
  required TextEditingController controller,
  required TextInputType type,
  bool obscureText=false,
})=>Card(
  color: Colors.white,
  elevation: 20,
  shadowColor: Colors.grey.shade50,
  shape: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(30)
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: TextFormField(
      style: const TextStyle(
        color: Colors.blue,
      ),
      obscureText: obscureText,
      controller: controller,
      keyboardType: type,
      decoration:InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),

        hintText: text,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        iconColor: Colors.red,
        prefixIcon: Icon(prefixIcon,color: Colors.grey,),
      ),
    ),
  ),
);

Widget buildMaterialButton({
  required String text,
  required BorderRadius borderRadius,
  required Color color,
  double? width,
  double? height,
  Function()? function,
  IconData? iconData,
})=>Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    color: color,
    borderRadius: borderRadius,
  ),
  child: MaterialButton(
    onPressed: function,
    child:  Text(
      text,
      style:const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);

void showToast({
  required String text,
  required Color color
})=>Fluttertoast.showToast(
  msg: text,
  toastLength: Toast.LENGTH_LONG,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,
  backgroundColor: color,
  textColor: Colors.white,
  fontSize: 16.0,
);

AppBar appBar({
  context,
  required String text,
})=>AppBar(
  elevation: 0,
  backgroundColor: Colors.white,
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,),
  ),
  title: Text(text,
  style: const TextStyle(
    color: Colors.black
  ),
  ),
);

Color kPrimaryColor=Colors.white;
const kGTSectraFineRegular='Schyler';


var loginEmailController = TextEditingController();
var loginPasswordController = TextEditingController();

var registerNameController = TextEditingController();
var registerEmailController = TextEditingController();
var registerPhoneController = TextEditingController();
var registerPasswordController = TextEditingController();
var registerConfirmPasswordController = TextEditingController();

var searchController = TextEditingController();

var profileEmailController = TextEditingController();
var profileNameController = TextEditingController();
var profilePhoneController = TextEditingController();