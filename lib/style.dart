



import 'package:flutter/material.dart';
import 'package:to_do_app/ToDoPage.dart';

InputDecoration appInputDecoration(label){
  return InputDecoration(

    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    border: OutlineInputBorder(),
    labelText: label,

  );
}

ButtonStyle appButtonStyle(){
  return ElevatedButton.styleFrom(
    padding: EdgeInsets.all(23),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
  );
}

SizedBox appSizeBox(itemList,index,child){


  return SizedBox(

    width: 50,
    height: 100,
    child: Container(
      padding: EdgeInsets.all(20),
      child: child,
    ),
  );
}