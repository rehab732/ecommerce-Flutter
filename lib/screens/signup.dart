import 'package:ecommerce/screens/homepage.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:ecommerce/widgets/customlogo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../provider/modelhud.dart';
import '../services/auth.dart';
import '../widgets/maintext.dart';
import '../widgets/textfield.dart';

class SignUp extends StatelessWidget {
  static String id = 'signup';
  final GlobalKey<FormState> _globalkey = GlobalKey<FormState>();
  final _auth = Auth();
  String email = '';
  String password = '';
  String name = '';

  // const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: maincolor,
      body: Stack(children: [
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
                        name = value!;
                      },
                      hint: 'Enter Your Name',
                      icon: Icons.person,
                    ),
                    SizedBox(
                      height: height * 0.05,
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
                            loading.changeloading(true);
                            if (_globalkey.currentState!.validate()) {
                              //do something
                              _globalkey.currentState!.save();
                              try {
                                final authresult =
                                    await _auth.signup(email, password);
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
                                                color: redcolor),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the bottom sheet
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  redcolor, // Set the background color to red
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    20), // Set the border radius
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
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                redcolor, // Set the background color to red
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Set the border radius
                            ),
                          ),
                          child: const MainText(
                            data: 'Sign Up',
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'already have an accout ?',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Login.id);
                          },
                          child: const MainText(
                            data: 'Login',
                            color: redcolor,
                          ),
                        )
                      ],
                    ),
                  
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
      ]),
    );
  }
}
