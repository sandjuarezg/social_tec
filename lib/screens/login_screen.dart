import 'package:flutter/material.dart';
import 'package:social_tec/widgets/loading_modal_widget.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  final txtEmail = const FractionallySizedBox(
    widthFactor: 0.5,
    child: TextField(
      decoration: InputDecoration(
        label: Text('Email user'), 
        border: OutlineInputBorder(),
      ),
    ),
  );

  final txtPass = const FractionallySizedBox(
    widthFactor: 0.5,
    child: TextField(
      decoration: InputDecoration(
        label: Text('Password user'), 
        border: OutlineInputBorder()
      ),
    ),
  );

  final spaceHorizont = SizedBox(height: 10);

  final btngoogle = SocialLoginButton(
      buttonType: SocialLoginButtonType.google, onPressed: () {});
  final btnface = SocialLoginButton(
      buttonType: SocialLoginButtonType.facebook, onPressed: () {});
  final btngit = SocialLoginButton(
      buttonType: SocialLoginButtonType.github, onPressed: () {});

  @override
  Widget build(BuildContext context) {
    final txtRegister = Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: const Text(
            'Crear cuenta',
            style:
                TextStyle(fontSize: 18, decoration: TextDecoration.underline),
          )),
    );

    final btnEmail = SocialLoginButton(
        buttonType: SocialLoginButtonType.generalLogin,
        onPressed: () {
          isLoading = true;
          setState(() {});
          Future.delayed(Duration(milliseconds: 4000)).then((value) {
            isLoading = false;
            setState(() {});
            Navigator.pushNamed(context, '/dash');
          });
        });

    final Size size = MediaQuery.of(context).size;

    if (size.width > 1000) {
      print("desktop");
      
      return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: .4,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/wallpaper.jpg'))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      txtEmail,
                      spaceHorizont,
                      txtPass,
                      spaceHorizont,
                      btnEmail,
                      spaceHorizont,
                      btngoogle,
                      spaceHorizont,
                      btnface,
                      spaceHorizont,
                      btngit,
                      spaceHorizont,
                      txtRegister
                    ],
                  ),
                  Positioned(
                    top: 50,
                    left: 70,
                    child: Image.asset('assets/itc.png', height: 230),
                  )
                ],
              ),
            ),
          ),
          isLoading ? const LoadingModalWidget() : Container()
        ],
      ),
    );  
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: .4,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/wallpaper.jpg'))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const TextField(
                          decoration: InputDecoration(
                            label: Text('Email user'), 
                            border: OutlineInputBorder(),
                          ),
                        ),
                        spaceHorizont,
                        const TextField(
                          decoration: InputDecoration(
                            label: Text('Password user'), 
                            border: OutlineInputBorder(),
                          ),
                        ),
                        spaceHorizont,
                        btnEmail,
                        spaceHorizont,
                        btngoogle,
                        spaceHorizont,
                        btnface,
                        spaceHorizont,
                        btngit,
                        spaceHorizont,
                        txtRegister
                      ],
                    ),
                    Positioned(
                      top: 30,
                      child: Image.asset('assets/itc.png', height: 170),
                    )
                  ],
                ),
              ),
            ),
            isLoading ? const LoadingModalWidget() : Container()
          ],
        ),
      );
    }
  }
}
