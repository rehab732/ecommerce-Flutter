import 'package:ecommerce/constants/colors.dart';
import 'package:ecommerce/provider/adminmode.dart';
import 'package:ecommerce/provider/modelhud.dart';
import 'package:ecommerce/screens/adminhome.dart';
import 'package:ecommerce/screens/homepage.dart';
import 'package:ecommerce/screens/signup.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/widgets/customlogo.dart';
import 'package:ecommerce/widgets/maintext.dart';
import 'package:ecommerce/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  static String id = 'Login';
  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  final _auth = Auth();
  bool isAdmin = false;
  final adminpass = 'admin1234';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: maincolor,
      body: Stack(
        children: [
          Form(
            key: _globalkey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomLogo(),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      customtextfield(
                        onClick: (value) {
                          email = value!;
                        },
                        hint: 'Enter Your Email',
                        icon: Icons.email,
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      customtextfield(
                        onClick: (value) {
                          password = value!;
                        },
                        hint: 'Enter Your password',
                        icon: Icons.password,
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Builder(
                        builder: (context) => ElevatedButton(
                          onPressed: () async {
                            final loading = Provider.of<LoadingCircle>(context,
                                listen: false);
                            loading.changeloading(false);
                            if (_globalkey.currentState!.validate()) {
                              loading.changeloading(true);

                              _globalkey.currentState!.save();
                              if (Provider.of<AdminMode>(context, listen: false).isAdmin) 
                              {
                                //if it is admin
                                if (password == adminpass) {
                                  //login
                                  try {
                                    final result =
                                        await _auth.signin(email, password);
                                    Navigator.pushNamed(context, AdminHome.id);
                                  } on FirebaseAuthException catch (e) {
                                    Scaffold.of(context).showBottomSheet(
                                      (context) => Center(
                                        child: SizedBox(
                                          height: 200,
                                          width: 300,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                e.message!,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Pacifico',
                                                  color: redcolor,
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: redcolor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                ),
                                                child: const Text('Close'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  } finally {
                                    loading.changeloading(false);
                                  }
                                } else {
                                  Scaffold.of(context).showBottomSheet(
                                    (context) => Center(
                                      child: SizedBox(
                                        height: 200,
                                        width: 300,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Password not correct',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Pacifico',
                                                color: redcolor,
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                loading.changeloading(false);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: redcolor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              child: const Text('Close'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              } 
                              else {
                                //if is user
                                if (password != adminpass) {
                                  try {
                                    final result =
                                        await _auth.signin(email, password);
                                    Navigator.pushNamed(context, HomePage.id);
                                  } on FirebaseAuthException catch (e) {
                                    Scaffold.of(context).showBottomSheet(
                                      (context) => Center(
                                        child: SizedBox(
                                          height: 200,
                                          width: 300,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                e.message!,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Pacifico',
                                                  color: redcolor,
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: redcolor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                ),
                                                child: const Text('Close'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  } finally {
                                    loading.changeloading(false);
                                  }
                                }
                                 else {
                                  Scaffold.of(context).showBottomSheet(
                                    (context) => Center(
                                      child: SizedBox(
                                        height: 200,
                                        width: 300,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Something went wrong',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Pacifico',
                                                color: redcolor,
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                // loading.changeloading(false);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: redcolor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              child: const Text('Close'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: redcolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const MainText(
                            data: 'Login',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'create an account ?',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, SignUp.id);
                            },
                            child: const MainText(
                              data: 'Sign Up',
                              color: redcolor,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<AdminMode>(context, listen: false)
                                      .changeIsAdmin(true);
                                },
                                child: Text(
                                  'I am an admin',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Provider.of<AdminMode>(context)
                                              .isAdmin
                                          ? maincolor
                                          : redcolor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<AdminMode>(context, listen: false)
                                      .changeIsAdmin(false);
                                },
                                child: Text(
                                  'I am a user',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Provider.of<AdminMode>(context)
                                              .isAdmin
                                          ? redcolor
                                          : maincolor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Consumer<LoadingCircle>(
            builder: (context, loadingCircle, _) {
              if (loadingCircle.isloading) {
                return Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(redcolor),
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
