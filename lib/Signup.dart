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
                Container(
                  color: Colors.white,
                  constraints: BoxConstraints(
                    minHeight: 600, //minimum height
                    minWidth: 400, // minimum width

                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: MediaQuery.of(context).size.height,
                    //maximum width set to 100% of width
                  ),
                ),
                Positioned(
                  top: 300.0,
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 550, //minimum height
                      minWidth: 400, // minimum width

                      maxHeight: MediaQuery.of(context).size.height,

                      maxWidth: MediaQuery.of(context).size.width,
                      //maximum width set to 100% of width
                    ),
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    // margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFeceff1),
                    ),
                    child: Form(
                      key: globalFormKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(0.0),
                            child: Text("Sign up",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 1.171875,
                                  fontSize: 24.0,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF90a4ae),
                                )),
                          ), //Container
                          SizedBox(height: 20),
                          new TextFormField(
                            keyboardType: TextInputType.text,
                            onSaved: (input) => signupRequestModel.name = input,
                            decoration: new InputDecoration(
                              hintText: " Enter your name",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green.withOpacity(0.2))),
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
                            onSaved: (input) =>
                                signupRequestModel.email = input,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "* Required"),
                              EmailValidator(errorText: "Enter valid email id"),
                            ]),
                            decoration: new InputDecoration(
                              hintText: "Enter your email ",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green.withOpacity(0.2))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
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
                            onSaved: (input) => signupRequestModel.pass = input,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "* Required"),
                              MinLengthValidator(6,
                                  errorText:
                                      "Password should be atleast 6 characters"),
                              MaxLengthValidator(15,
                                  errorText:
                                      "Password should not be greater than 15 characters")
                            ]),
                            obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: " Enter your password",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green.withOpacity(0.2))),
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

                                apiService
                                    .signup(signupRequestModel)
                                    .then((value) {
                                  if (value != null) {
                                    setState(() {
                                      isApiCallProcess = false;
                                    });

                                    if (value.token == 'success') {
                                      final snackBar = SnackBar(
                                          content: Text("Sign Up Successful"));
                                      scaffoldKey.currentState
                                          .showSnackBar(snackBar);
                                    } else if (value.token == 'Duplicate') {
                                      final snackBar = SnackBar(
                                          content: Text("Email exist"));
                                      scaffoldKey.currentState
                                          .showSnackBar(snackBar);
                                    }
                                  }
                                });
                              }
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          SizedBox(height: 15),
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
                ),
                Positioned(
                  top: 260.0,
                  left: 20,
                  child: Container(
                      // padding: EdgeInsets.all(15.0),
                      child: Image(
                          width: 70.0,
                          height: 70.0,
                          image: AssetImage('images/key_signup.png'))),
                ), //Container
                Positioned(
                  top: 100.0,
                  left: 20,
                  child: Container(
                    // padding: EdgeInsets.all(15.0),
                    child: Text("Create \nnew account",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          height: 1.2,
                          fontSize: 35.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.lerp(
                              FontWeight.w900, FontWeight.w900, 1.5),
                          color: Color(0xff00e676),
                        )),
                  ),
                ), //Container
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
