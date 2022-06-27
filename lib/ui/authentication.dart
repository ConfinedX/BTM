import 'package:flutter/material.dart';
// import 'package:kommunicate_flutter/kommunicate_flutter.dart';

import '../net/flutterfire.dart';
import 'home_view.dart';

class Authentication extends StatefulWidget {
  Authentication({Key key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: DecorationImage(
              image: AssetImage('assets/images/authBackground.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Container(
                  height: 175,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    controller: _emailField,
                    decoration: InputDecoration(
                      hintText: "something@email.com",
                      hintStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 35),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    controller: _passwordField,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 35),
                Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Theme.of(context).accentColor,
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      bool shouldNavigate =
                          await register(_emailField.text, _passwordField.text);
                      if (shouldNavigate) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeView(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 35),
                Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Theme.of(context).accentColor,
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      bool shouldNavigate =
                          await signIn(_emailField.text, _passwordField.text);
                      if (shouldNavigate) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeView(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: MediaQuery.of(context).size.height / 35),
                // Container(
                //   width: MediaQuery.of(context).size.width / 1.4,
                //   height: 45,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(15.0),
                //     color: Theme.of(context).accentColor,
                //   ),
                //   child: MaterialButton(
                //     onPressed: () async {
                //       bool shouldNavigate =
                //           await signIn(_emailField.text, _passwordField.text);
                //       if (shouldNavigate) {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => HomeView(),
                //           ),
                //         );
                //       }
                //     },
                //     child: Text(
                //       "Chat with us",
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 18,
                //       ),
                //     ),
                //   ),
                //   // child: MaterialButton(
                //   //   onPressed: () async {
                //   //     try {
                //   //       dynamic conversationObject = {
                //   //         'appId':
                //   //             '<btm-ipepy>' // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
                //   //       };
                //   //       dynamic result =
                //   //           await KommunicateFlutterPlugin.buildConversation(
                //   //               conversationObject);
                //   //       print(
                //   //           "Conversation builder success : " + result.toString());
                //   //     } on Exception catch (e) {
                //   //       print("Conversation builder error occurred : " +
                //   //           e.toString());
                //   //     }
                //   //   },
                //   //   child: Text("Chat bot"),
                //   // ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
