import 'package:flutter/material.dart';
import '../components/mbutton.dart';
import '../components/country_code.dart';
import '../components/mtext.dart';
import '../extensions.dart';
import '../gen/assets.gen.dart';
import '../components/mform.dart';
import '../components/login_social.dart';
import '../components/text_button_icon.dart';
import '../RegistrationScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                 padding: const EdgeInsets.all(0),
                  height: context.height * .4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              const $AssetsImagesGen().imageHeader.path)))),
              const SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyText(
                      label: 'Welcome To Fashion Daily',
                      textStyle:TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      MyText(label: 'Sign In', textStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),),
                      TextButtonIcon(text: 'Help'),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Form(
                    key: _formKey,
                    child: Row(
                      children: const [
                        Expanded(
                          child: MyCountryCodeForm(),
                        ),
                        Expanded(
                          flex: 2,
                          child: MyForm(
                            type: TextInputType.phone,
                            label: 'Phone Number',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              MyButton(
                text: 'Sign In',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('loading')),
                    );
                  }
                },
              ),
              const SizedBox(height: 14),
              const OrLoginSocial(),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MyText(
                      label: "Doesn't has any account?",
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),),
                  TextButton(
                      onPressed: () {
                        context.pushReplacement(const RegistrationScreen());
                      },
                      child: const Text(
                        'Register here',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.teal,
                          fontWeight: FontWeight.normal,
                        ),
                      ),),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 8),
                child: Center(child: Text(
                  'Use the application according to policy rules. Any kinds of violations will be subject to sanctions.',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal ,
                  ),
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
