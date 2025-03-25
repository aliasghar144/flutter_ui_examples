import 'package:flutter/material.dart';
import 'package:flutter_ui_examples/LoginForm/login_main_screen.dart';
import 'package:flutter_ui_examples/config/theme/app_theme.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeConfig.createTheme(),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI example',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            spacing: 20,
            children: [
              _itemWidget(
                  title: 'Login Forms',
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginMainScreen(),));
                  }
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget _itemWidget({
    String? title,
    GestureTapCallback? onTap,
  }){
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title??'-',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
              const Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ));
  }
}


