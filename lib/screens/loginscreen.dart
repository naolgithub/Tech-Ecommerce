import 'package:flutter/material.dart';
import 'package:tech_ecommerce/widgets/custominput.dart';
import 'package:tech_ecommerce/widgets/custompassword.dart';
import 'package:tech_ecommerce/widgets/headline.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  //final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff5956E9),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Image(
                    image: AssetImage('assets/images/EllipseMorado.png')),
                ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: FractionalOffset.center,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstIn,
                    child: const Image(
                        image: AssetImage('assets/images/EllipseRosa.png'),
                        fit: BoxFit.contain)),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: Headline(title: 'Welcome back'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 50.0, bottom: 27.0),
                  child: const Image(
                    image: AssetImage('assets/images/EllipseMorado.png'),
                  ),
                )
              ],
            ),
            Form(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                height: MediaQuery.of(context).size.height * 0.64,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 36.0, 50, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Raleway',
                              fontSize: 18.0,
                            ),
                          ),
                          const CustomInput(),
                          const CustomPassword(),
                          const TextButton(
                              onPressed: null,
                              child: Text('Forgot Password?',
                                  style: TextStyle(color: Color(0xff5956E9)))),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, "/");
                              },
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: const Color(0xff5956E9),
                                  fixedSize: const Size(314.0, 70.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 22),
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700)),
                              child: const Text('Log In')),
                          const Center(
                            child: TextButton(
                              onPressed: null,
                              child: Text(
                                'Create account',
                                style: TextStyle(
                                    color: Color(0xff5956E9), fontSize: 17.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
