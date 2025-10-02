import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_ship_faas/error_screen.dart';
import 'package:we_ship_faas/firebase_initlizer.dart';
import 'package:we_ship_faas/loading_screen.dart';
import 'package:we_ship_faas/presentation/base_screen.dart';
import 'package:we_ship_faas/presentation/onboarding/controllers/on_boarding_controller.dart';

class SplashScreen extends GetView<OnBoardingController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FirebaseInitializer(
      errorBuilder: (context) => const ErrorScreen(),
      loadingBuilder: (context) => const LoadingScreen(),
      successBuilder: (context) => _SplashView(controller: controller),
      onAppInitDone: () {
        Future.delayed(3.seconds, () {
          controller.proceedFurther();
        });
      },
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView({
    required this.controller,
  });

  final OnBoardingController controller;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      wrapWithSafeArea: true,
      value: SystemUiOverlayStyle.dark,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/icon.png',
                  width: 241,
                  height: 138,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 5.h,
            left: 0,
            right: 0,
            child: Center(
              child: Obx(
                () {
                  return controller.isLoading.value
                      ? const CircularProgressIndicator.adaptive()
                      : const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension WidgetX on Widget {
  wrapWithBGGradient(
      {required String topGradient, required String bottomGradient}) {}
}
