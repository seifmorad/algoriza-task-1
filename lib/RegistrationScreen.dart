import 'package:flutter/material.dart';
import '../components/mform.dart';
import '../extensions.dart';
import '../LoginScreen.dart';
import '../components/mbutton.dart';
import '../components/country_code.dart';
import '../components/mtext.dart';
import '../components/login_social.dart';
import '../components/text_button_icon.dart';
import '../../../gen/assets.gen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}


class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: context.height * .2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                const $AssetsImagesGen().imageHeader.path)))),
                const SizedBox(
                  height: 12,
                ),
                const MyText(
                    label: 'Welcome To Fashion Daily', textStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal ,
                ),),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    MyText(label: 'Register', textStyle: TextStyle(
                      fontSize: 30,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold ,
                    ),),
                    TextButtonIcon(text: 'Help'),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const MyForm(
                            label: 'Email', type: TextInputType.emailAddress),
                        const SizedBox(height: 12),
                        Row(
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
                        const SizedBox(height: 12),
                        const MyForm(
                          type: TextInputType.visiblePassword,
                          label: 'Password',
                          isPassword: true,
                          suffixIcon: Icons.remove_red_eye,
                        ),
                        const SizedBox(height: 12),
                        const SizedBox(height: 12),
                        MyButton(
                          text: 'Register',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Processing Data')),
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
                                label: "Has any account?",
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal ,
                                ),),
                            TextButton(
                                onPressed: () {
                                  context.pushReplacement(const LoginScreen());
                                },
                                child: const Text(
                                  'Sign in Here',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.normal ,
                                  ),
                                ),),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8),
                          child: Center(child: Text(
                            'By registering your, you are agree to our',
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal ,
                            ),
                          ),),
                        ),
                        TextButton(
                          onPressed: () {
                            context.pushReplacement(const LoginScreen());
                          },
                          child: const Text(
                            'terms and conditions',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal ,
                            ),
                          ),),
                      ],
                    ),),
              ],
            )),
      ),
    );
  }
}
