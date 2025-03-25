import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginFormOne extends StatefulWidget {
  const LoginFormOne({super.key});

  @override
  State<LoginFormOne> createState() => _LoginFormOneState();
}

class _LoginFormOneState extends State<LoginFormOne> {
  
  bool activeButton = false;
  final TextEditingController _phoneNumberController = TextEditingController();
  Color mainColor = const Color(0xff3451FF);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: MediaQuery.sizeOf(context).width / 8,
              child: FittedBox(child: FlutterLogo(
                size: MediaQuery.sizeOf(context).width / 8,
                style: FlutterLogoStyle.stacked,
              )),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05,),
            Text('Login',style: TextStyle(fontSize: 24,color: mainColor)),
            const SizedBox(height: 10,),
            const Text('Enter Your phoneNumber',textDirection: TextDirection.rtl,style: TextStyle(fontSize:16,color:Color(0xff666666)),),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.1,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                onChanged: (value) {
                  if(value.length >= 11){
                    setState(() {
                      activeButton = true;
                    });
                  }else{
                    setState(() {
                      activeButton = false;
                    });
                  }
                },
                maxLength: 11,
                controller: _phoneNumberController,
                keyboardType: TextInputType.number,
                textDirection: TextDirection.ltr,
                style: const TextStyle(fontSize: 16,color:Color(0xff888888)),
                decoration: InputDecoration(
                    counterText: '',
                    alignLabelWithHint: true,
                    label: const Text('phone',textDirection: TextDirection.rtl,),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.call),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: mainColor,width: 0.5)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide:  BorderSide(color: mainColor,width: 0.5)
                    )
                    ,
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide:  BorderSide(color: mainColor,width: 0.5)
                    )
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.1,),
          ],
        ),
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            !activeButton ? const Color(0xffDCDCDC) : mainColor,
                            !activeButton ? const Color(0xffBFBFBF) : mainColor,
                          ])
                  ),
                  child: ElevatedButton(
                      onPressed: (){
                        if(activeButton){
                        }
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,elevation: 0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text('Login',style: TextStyle(fontSize: 22,color: Colors.white),),
                      ))),
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: RichText(
                strutStyle: StrutStyle(
                  height: 1.25
                ),
                textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  softWrap: true,
                  text: TextSpan(
                      text: 'By continuing, you agree to YOUR APP name',
                      style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          ),
                      children: [
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {

                            },
                        ),
                        const TextSpan(
                            text:
                            'and acknowledge you\'ve read our',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                )),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                              },
                            text:
                            'Privacy Policy',
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                            )),
                      ])),
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
