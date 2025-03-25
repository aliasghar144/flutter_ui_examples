import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/LoginForm/login_form_one/login_form_one.dart';

class LoginMainScreen extends StatefulWidget {
  const LoginMainScreen({super.key});

  @override
  State<LoginMainScreen> createState() => _LoginMainScreenState();
}

class _LoginMainScreenState extends State<LoginMainScreen> {
  List<Widget> pages = [
    LoginFormOne(),
    LoginFormOne(),
    LoginFormOne(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Forms',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
      ),
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
        return pages[index];
      },),
    );
  }
}
