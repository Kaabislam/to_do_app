
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/style.dart';

class ToDoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ToDoPageUI();
  }

}

class ToDoPageUI extends State<ToDoPage>{
  var myTaskList = [];
  var item = "";
  TextEditingController _textController = TextEditingController();

  clearText(){
    _textController.clear();
  }
  myInputOnChange(content){
    setState(() {
      item = content;
    });
  }
  addItem(){
    setState(() {
      myTaskList.add({"item":item});
      clearText();
    });
  }
  removeItem(index){
    setState(() {
      myTaskList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("To Do App"),
          centerTitle: true,
        ),
        body:Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [

              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(0),

                  child: Row(
                    children: [
                      Expanded(
                        flex: 95,
                        child:TextFormField(
                          controller: _textController,
                          onChanged: (value){
                            myInputOnChange(value);
                          },
                          decoration: appInputDecoration("Task"),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: SizedBox()
                      ),
                      Expanded(
                          flex: 20,
                          child: ElevatedButton(onPressed: (){addItem();},child: Text("Add"),style: appButtonStyle(),)),
                    ],
                  ),

                )
              ),
              Expanded(
                  flex: 9,
                  child: ListView.builder(

                      itemCount: myTaskList.length,
                      itemBuilder: (BuildContext context, int index) {
                            return Card(
                                child: appSizeBox(myTaskList,index,
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 8,
                                          child: Text(myTaskList[index]["item"].toString())
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: TextButton(onPressed: (){removeItem(index);},child: Icon(Icons.delete),),
                                      ),
                                    ],
                                  ),
                                ),


                            );
                      },

                  )
              ),
            ],
          ),
        )
    );
  }
}
