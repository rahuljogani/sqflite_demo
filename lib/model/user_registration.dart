import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_app/model/view/user_information.dart';
import 'package:sqflite_app/service/DatabaseHandler.dart';

class UserRegistration extends StatefulWidget
{
  @override
  UserRegistrationState createState() =>  UserRegistrationState();
}

class  UserRegistrationState extends State<UserRegistration>
{
  var _formkey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpwd = TextEditingController();

  int _groupValue = 0;

  _checkRadio(int index){
    setState(() {
      _groupValue = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("User Registration"),
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(25, 60, 25, 25),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _name,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        isDense: true,
                        labelText: "Enter Name",
                        labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                        hintText: "Enter Name Here",
                        prefixIcon: Icon
                          (Icons.person,
                         color: Colors.black,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value)
                      {
                        if(value.isEmpty)
                        {
                          return "Please Enter Name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _contact,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        isDense: true,
                        labelText: "Enter Contact-No.",
                        labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                        hintText: "Enter Number Here",
                        prefixIcon: Icon
                          (Icons.phone,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value)
                      {
                        if(value.isEmpty)
                        {
                          return "Please Enter Correct Number";
                        }
                        if(value.length!=10)
                          {
                            return "Number should be 10 character";
                          }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        isDense: true,
                        labelText: "Enter Email-Id",
                        labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                        hintText: "Enter Email-Id Here",
                        prefixIcon: Icon
                          (Icons.email,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value)
                      {
                        if(value.isEmpty)
                        {
                          return "Please Enter Email-Id";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        isDense: true,
                        labelText: "Enter Password",
                        labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                        hintText: "Enter Password Here",
                        prefixIcon: Icon
                          (Icons.security,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value)
                      {
                        if(value.isEmpty)
                        {
                          return "Please Enter Password";
                        }
                        if(value.length!=6)
                          {
                            return "Password should be 6 character";
                          }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _confirmpwd,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black12,
                        isDense: true,
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                        hintText: "Enter Confirm Password",
                        prefixIcon: Icon
                          (Icons.vpn_key,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value.isEmpty)
                          {
                            return "Please Enter Confirm Password";
                          }
                        if(_password.text!=_confirmpwd.text)
                          {
                            return "Password Does Not Match";
                          }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text("Gender :"),
                        Radio(
                          value: 0,
                          groupValue: _groupValue,
                          onChanged: _checkRadio,
                          activeColor: Colors.black,
                        ),
                        Text("Male"),
                        Radio(
                          value: 1,
                          groupValue: _groupValue,
                          onChanged: _checkRadio,
                          activeColor: Colors.black,
                        ),
                        Text("Female"),
                      ],
                    ),

                    InkWell(
                      onTap: () async {
                        if(_formkey.currentState.validate()) {
                          var namen1 = _name.text.toString();
                          var numbern2 = _contact.text.toString();
                          var emailn3 = _email.text.toString();
                          var passwordn4 = _password.text.toString();
                          var confirmpwd = _confirmpwd.text.toString();
                          var gender = "";

                          if (_groupValue == 0) {
                            gender = "male";
                          }
                          else {
                            gender = "female";
                          }

                          print("Name :" + namen1);
                          print("Contact :" + numbern2);
                          print("Email :" + emailn3);
                          print("Password :" + passwordn4);
                          print("ConfirmPwd:" + confirmpwd);
                          print("Gender :" + gender);

                          DatabaseHandler obj = new DatabaseHandler();
                          int id = await obj.insert_records(namen1, numbern2, emailn3, passwordn4, confirmpwd, gender);
                          print("Record Inserted At:"+id.toString());
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> userInformation()));

                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10.0),
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        child: Text("SUBMIT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18),),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}