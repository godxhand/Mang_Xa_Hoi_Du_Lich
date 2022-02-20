import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:doan2/animation/fade.dart';
import 'package:doan2/screens/sign_in.dart';
import 'package:doan2/theme/colors/light_colors.dart';
import 'package:doan2/widgets/my_text_field.dart';
import 'package:doan2/widgets/task_column.dart';
import 'package:doan2/widgets/top_container.dart';
import 'package:doan2/provider/user_provider.dart';

import 'home/home_page.dart';

class SignUpPage extends StatefulWidget {
  // SignUpPage({Key? key, required this.title}) : super(key: key);

  // final String title;

  @override
  SignUpPageView createState() => SignUpPageView();
}

class SignUpPageView extends State<SignUpPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  var downwardIcon = Icon(
    Icons.keyboard_arrow_down,
    color: Colors.black54,
  );


  @override
  Widget build(BuildContext context) {
    TextEditingController txtuser = TextEditingController();
    TextEditingController txtemail = TextEditingController();
    TextEditingController txtpassword = TextEditingController();
    TextEditingController txtpassword_confirmation = TextEditingController();
    void _register() async {
      bool isRegister = await UserProvider.register(txtuser.text, txtemail.text,
          txtpassword.text, txtpassword_confirmation.text);

      // if (isRegister) { return true;
      // } else { return false; }
    }

    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/VN.jpg'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        left: 30,
                        width: 80,
                        height: 130,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/light-1.png'))),
                        )),
                    Positioned(
                        left: 140,
                        width: 60,
                        height: 100,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/light-2.png'))),
                        )),
                    Positioned(
                        right: 40,
                        top: -30,
                        width: 60,
                        height: 140,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/logo-2.png'))),
                        )),
                    Positioned(
                        child:
                            //  FadeAnimation(
                            //     1.2,
                            Container(
                      margin: EdgeInsets.only(top: 100, right: 200),
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: LightColors.kLightYellow,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              Container(
                  child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyTextField(
                      txt: txtuser,
                      label: 'User Name',
                      icon: Icon(Icons.verified_user),
                    ),
                    MyTextField(
                      txt: txtemail,
                      label: 'Email',
                      icon: Icon(Icons.email),
                    ),
                    MyTextField(
                      txt: txtpassword,
                      label: 'Password',
                      icon: Icon(Icons.password),
                    ),
                    MyTextField(
                      txt: txtpassword_confirmation,
                      label: 'Confirm Pasword',
                      icon: Icon(Icons.password),
                    ),
                  ],
                ),
              )),
              // FadeAnimation(
              //     1.3,
              GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(255, 153, 51, .8),
                              Color.fromRGBO(255, 153, 51, .5)
                            ])),
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  onTap: () async {
                    try {
                      _register();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );


                    } catch (e) {
                      final snackBar =
                          SnackBar(content: Text('co loi xay ra  !!!'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
