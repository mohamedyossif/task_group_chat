import 'package:chat_group_cat/component/reused_button.dart';
import 'package:chat_group_cat/utilities/constant.dart';
import 'package:chat_group_cat/views/chat_list.dart';
import 'package:chat_group_cat/views/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const id = '/login';

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool visibility = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0,top: 250),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [         
                  /// text field for email
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      /// check email is not empty
                      if (value!.isEmpty) {
                        return 'Required Email';
                        ///cheek form email is correct
                      } else if (!RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(value)) {
                        return 'Enter a Valid Email';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: kFieldTextStyle.copyWith(
                        hintText: 'Enter Your Email',
                        prefixIcon: Icon(Icons.person)),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  /// text field for password
                  TextFormField(
                    controller: _passwordController,
                    ///check password is not empty and less than 6 letters
                    validator: (value) =>
                        value!.isEmpty ? 'Required Password' : null,
                    keyboardType: TextInputType.text,
                    obscureText: !visibility,
                    decoration: kFieldTextStyle.copyWith(
                      suffixIcon: IconButton(
                        icon: visibility
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            visibility = !visibility;
                          });
                        },
                      ),
                      hintText: 'Enter Your Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ///button for sign in
                  SizedBox(
                    height: 50,
                    child: reusedButton(
                      nameButton: 'Sign In',
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          authFirebaseMethods.signInWithEmailAndPassword(context, _emailController.text, _passwordController.text).then((value){
                            sharedPreferencesDatabase.isCheck = true;
                            sharedPreferencesDatabase.setPreferencesInstance();
                            Navigator.of(context).pushReplacementNamed(ChatList.id);
                          });
                        }
                      },
                    ),
                  ),
                  /// to go sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don`t have an account ?'),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Register.id);
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
