import 'package:flutter/material.dart';
import 'Login.dart';
import 'package:dinogarden/api/login_api.dart';
import 'package:dinogarden/model/login_model.dart';
import 'package:form_field_validator/form_field_validator.dart';
class Signup extends StatefulWidget {
  final String string;

  Signup(this.string); // receiving "Foo" in 2nd
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _checkboxListTile = false;
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  SignupRequestModel signupRequestModel;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    signupRequestModel = new SignupRequestModel();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[

                SizedBox(height: 15),
                Container(

                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.2),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        Text(
                          "Create Account ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              height: 1.171875,
                              fontSize: 35.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 102, 102, 102)),
                        ),
                        SizedBox(height:20),

                        SizedBox(height: 20),
                        new TextFormField(

                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                          signupRequestModel.name = input,
                          decoration: new InputDecoration(
                            hintText: " Enter your name",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            prefixIcon: Icon(
                              Icons.account_circle_sharp,

                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) => signupRequestModel.email = input,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                            EmailValidator(errorText: "Enter valid email id"),
                          ]),
                          decoration: new InputDecoration(
                            hintText: "Enter your email ",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green
                                        .withOpacity(0.2))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    width: 0, color: Colors.green)),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(

                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                          signupRequestModel.pass = input,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                            MinLengthValidator(6,
                                errorText: "Password should be atleast 6 characters"),
                            MaxLengthValidator(15,
                                errorText:
                                "Password should not be greater than 15 characters")
                          ]),
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: " Enter your password",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Colors.grey.withOpacity(0.5),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),


                        SizedBox(height: 40),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black12)),
                          color: Color.fromARGB(255, 1, 170, 79),
                          textColor: Color.fromARGB(255, 255, 255, 255),
                          padding: EdgeInsets.all(8.0),
                          minWidth: 300.0,
                          onPressed: () {
                            if (validateAndSave()) {
                              print(signupRequestModel.toJson());
                              setState(() {
                                isApiCallProcess = true;
                              });

                              APIService apiService = new APIService();

                              apiService.signup(signupRequestModel).then((value) {
                                if (value != null) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });

                                  if (value.token =='success') {
                                    final snackBar = SnackBar(
                                        content: Text("Sign Up Successful"));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                  } else if (value.token =='Duplicate') {
                                    final snackBar =
                                    SnackBar(content: Text("Email exist"));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                  }
                                }
                              });
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white,
                              fontSize: 16.0,),
                          ),

                        ),
                        SizedBox(height: 15),

                        SizedBox(height:15),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.grey)),
                          textColor: Colors.grey,
                          padding: EdgeInsets.all(8.0),
                          minWidth: 300.0,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LoginPage()));
                          },
                          child: Text(
                            "Back to Login",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
