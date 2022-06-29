import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/mtext.dart';
import '../extensions.dart';
import '../gen/assets.gen.dart';
import '../RegistrationScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../components/mbutton.dart';
import '../on_boarding_model.dart';
import '../LoginScreen.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final List<OnBoarding> _onBoardingData = [
    OnBoarding(
        title: 'Get food delivery to your doorstep asap',
        description: 'We have young and professional delivery team that will bring your food as soon as possible to your doorstep',
        urlImage: const $AssetsSvgGen().onBoard1.path),
    OnBoarding(
        title: 'Buy Any Food from your favorite restaurant',
        description:
        'We are constantly adding your favourite restaurant throughout the territory and around your area carefully selected',
        urlImage: const $AssetsSvgGen().onboard2.path),
    OnBoarding(
        title: "Let's Get Started",
        description: "",
        urlImage: const $AssetsSvgGen().onboard3.path),
  ];
  final boardController = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: context.height,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: MyButton(
                    text: 'Skip',
                    btnColor: const Color.fromARGB(255, 238, 238, 238),
                    txtColor: Colors.black,
                    borderSize: 40,
                    onPressed: () {
                      context.pushReplacement(const LoginScreen());
                    },
                    width: 75,
                    height:40,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 50,
                  child: Image.asset(
                    const $AssetsImagesGen().logo.path,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: PageView(
                  allowImplicitScrolling: true,
                  controller: boardController,
                  children: _onBoardingData
                      .map((item) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            item.urlImage,
                            height: .3 * context.height,
                            fit: BoxFit.cover,
                            width:
                            MediaQuery.of(context).size.width * .90,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                    Text(
                          textAlign: TextAlign.center,
                            item.title,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold ,
                            ),
                          ),
                      const SizedBox(
                              height: 8),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8),
                            child: Center(child: Text(
                              item.description,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal ,
                              ),
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ))
                      .toList(),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: context.width,
                  child: Center(
                    child: buildIndicator(
                        boardController: boardController,
                        count: _onBoardingData.length),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: context.width,
                  child: Center(
                    child: MyButton(
                        text: 'Get Started',
                        onPressed: () {
                          context.pushReplacement(const LoginScreen());
                        },
                        borderSize: 8,
                        btnColor: Colors.teal),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const MyText(
                            label: "Don't have any account?",
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),),
                        TextButton(
                            onPressed: () {
                              context.push(const RegistrationScreen());
                            },
                            child:  Text(style:  TextStyle( fontSize: 14,
                              color: Colors.teal,
                              fontWeight: FontWeight.normal,),
                              'Sign Up',
                            ),
                            ),
                      ]),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  SmoothPageIndicator buildIndicator(
      {required PageController boardController,
        required int count,
        dynamic indicatorEffect}) {
    return SmoothPageIndicator(
      controller: boardController,
      effect: indicatorEffect ??
          const WormEffect(
            dotColor: Colors.grey,
            activeDotColor: Color.fromARGB(255, 196, 148, 66),
            dotHeight: 5,
            dotWidth: 15,
            spacing: 5,
          ),
      count: count,
    );
  }
}
