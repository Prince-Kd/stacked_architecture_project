import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture_project/ui/views/onboarding/onboarding_view_model.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ViewModelBuilder<OnboardingViewModel>.reactive(
        viewModelBuilder: () => OnboardingViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: SizedBox(
              height: height,
              width: width,
              child: PageView(
                onPageChanged: model.setCurrentIndex,
                controller: model.pageController,
                scrollDirection: Axis.horizontal,
                children: const [
                  PageWidget(image: 'assets/onboarding.gif', mainText: 'Quality Service', subText: 'Get quality and professional service right to your doorsteps',),
                  PageWidget(image: 'assets/onboarding2.gif', mainText: 'Work Faster', subText: 'Get quality and professional service right to your doorsteps',),
                  PageWidget(image: 'assets/onboarding3.gif', mainText: 'Get Employed', subText: 'Get quality and professional service right to your doorsteps',),
                ],
              ),
            ),
          );
        });
  }
}

class PageWidget extends ViewModelWidget<OnboardingViewModel> {
  final String image;
  final String? mainText;
  final String? subText;
  const PageWidget({Key? key, required this.image, this.mainText, this.subText})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
    OnboardingViewModel viewModel,
  ) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter
              )
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: viewModel.currentPage.toDouble(),
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  mainText!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  subText!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30,),
                viewModel.currentPage == 2.0
                    ? SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: viewModel.completeOnboarding,
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                    )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green[400],
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25))),
                              onPressed: viewModel.nextPage,
                              child: const Center(
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: viewModel.completeOnboarding,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  'Skip',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
