import 'package:flutter/material.dart';
import '../../extensions.dart';
import 'package:tbib_loading_transition_button_and_social/tbib_loading_transition_button_and_social.dart';

import '../../tbib_loading_button/tbib_social_loading_button.dart';
import 'mtext.dart';

class OrLoginSocial extends StatefulWidget {
  const OrLoginSocial({Key? key}) : super(key: key);

  @override
  State<OrLoginSocial> createState() => _OrLoginSocialState();
}

class _OrLoginSocialState extends State<OrLoginSocial> {
  CustomLoadingSignButtonController googleLoginController =
  CustomLoadingSignButtonController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                  child: Divider(
                    thickness: 1,
                  ),
              ),
              Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 12),
                  child: MyText(label: 'Or', textStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                  ),
              ),
              Expanded(
                child: Divider(
                  thickness: 1,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          CustomLoadingSignButton(
            controller: googleLoginController,
            buttonType: ButtonType.google,
            onSubmit: () {
            },
            fontSize: 18,
            imageSize: 24,
            width: context.width,
            height: 52,
          )
        ],
      ),
    );
  }
}
