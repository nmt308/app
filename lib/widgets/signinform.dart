import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _value = false;
  var prefs;
  final username = TextEditingController();
  final password = TextEditingController();
  FToast fToast;

  _getData() async {
    prefs = await SharedPreference.getInstance();
    if (!prefs.getString("username").isEmpty) {
      username.text = prefs.getString("username");
      password.text = prefs.getString("password");
      _value = prefs.getBool("check");
    }
  }

  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Food Now",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sign in with your email and password \n or countinue with social media",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    // validator: (value) {
                    //   return Ultilies.validatePassword(value);
                    // },
                    onSaved: (_value) {
                      setState(() {
                        username.text = _value!;
                      });
                    },
                    controller: username,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Username",
                        prefixIcon: Icon(Icons.mail_outline)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: password,
                    // validator: (value) {
                    //   return Ultilies.validatePassword(value);
                    // },
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock_outline_rounded)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // Row(
                  //   children: [
                  //     Checkbox(value: _value??:true, onChanged: onChanged)
                  //   ],
                  // )
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: MaterialButton(
                      onPressed: () {
                        // if(_value){
                        //   prefs = await SharedPreference.getInstance();
                        //   prefs.setString("username",username.text);
                        //    prefs.setString("password",password.text);
                        //    prefs.setBool('check',_value);
                        // }else{
                        //   prefs.remove("check");
                        // }
                        // Navigator.pushNamed(context, HomePage.routeName);
                      },
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Countinue",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child:
                                SvgPicture.asset("assets/icons/facebook.svg"),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child:
                                SvgPicture.asset("assets/icons/facebook.svg"),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child:
                                SvgPicture.asset("assets/icons/facebook.svg"),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(color: Colors.green, fontSize: 14),
                      ),
                      GestureDetector(
                        // onTap: () async {
                        //   final result = await Navigator.pushNamed(
                        //       context, SignUpPage.routeName);
                        //   User user = result;
                        //   username.text = user.username;
                        // },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.yellow, fontSize: 14),
                        ),
                      )
                    ],
                  )
                ],
              )),
            )
          ]),
        ));
  }
}
