import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // Form Key to control the value of form
  var formKey = GlobalKey<FormState>();

  var nameCtrl = TextEditingController();
  var phCtrl = TextEditingController();
  var addressCtrl = TextEditingController();

  var name, ph, address;

  void handleSubmit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
    }

    print("Name is ${this.name}");
  }

  void resetAll() {
    nameCtrl.clear();
    phCtrl.clear();
    addressCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My_Form_For_SQLite")),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: formKey, // Form Key

              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: nameCtrl,
                    decoration: InputDecoration(labelText: "Enter Full Name"),
                    validator: (value) {
                      if (value.length == 0) return ("Enter Your Full Name");
                    },
                    onSaved: (value) {
                      this.name = value;
                    },
                  ),
                  Container(height: 10),
                  // 2nd ListView Items
                  TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 11,
                    controller: phCtrl,
                    decoration:
                        InputDecoration(labelText: "Enter Your Phone No"),
                    validator: (value) {
                      if (value.length < 11)
                        return ("Phone No must be 11 digits");
                    },
                    onSaved: (value) {
                      this.ph = value;
                    },
                  ),

                  Container(height: 10),
                  // 3rd ListView Items
                  TextFormField(
                    controller: addressCtrl,
                    decoration:
                        InputDecoration(labelText: "Enter Your Address"),
                    validator: (value) {
                      if (value.length == 0) return ("Address is required");
                    },
                    onSaved: (value) {

                      this.address =value;
                    },
                  ),

                  // Button

                  Padding(
                   padding: EdgeInsets.only(left:85.0,right: 85.0),
                    child: Row(
                      
                    children: <Widget>[
                      RaisedButton(
                        child: Text("Submit"),
                        color: Colors.grey,
                        onPressed: handleSubmit,
                      ),
                      Container(width: 3.5),

                      RaisedButton(
                        child: Text("Reset"),
                        color: Colors.lightGreen,
                        onPressed: resetAll,
                      )
                    ],
                  ),


                    
                    
                    ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
