import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class utilWidgets{

  static CustomIcon(IconData icon , VoidCallback onPressCallback){
    return IconButton(
      icon: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.green.shade900),
        child: Center(child: Icon(icon , color: Colors.white,)),
      ),
      onPressed: onPressCallback,
    );
  }

  static CustomSnackBar(BuildContext context, String snackBarText ,IconData snackBarIcon ){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(snackBarIcon , color: Colors.white,),
          Container(
            width: 20,
          ),
          Text(snackBarText)
        ],
      ),
      duration: Duration(seconds: 2),
      showCloseIcon: false,
    ));
  }


  static CustomText(String text) {
    return Text(text,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 24,
        letterSpacing: 1.5,
      ),
    );
  }
}