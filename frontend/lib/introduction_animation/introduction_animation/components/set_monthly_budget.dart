import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SetMonthlyTransactions extends StatelessWidget {
  final AnimationController animationController;

  const SetMonthlyTransactions({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstHalfAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final secondHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final moodFirstHalfAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final moodSecondHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-2, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final imageFirstHalfAnimation =
        Tween<Offset>(begin: const Offset(4, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final imageSecondHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-4, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    return SlideTransition(
      position: firstHalfAnimation,
      child: SlideTransition(
        position: secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Manage your health reports",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              SlideTransition(
                position: moodFirstHalfAnimation,
                child: SlideTransition(
                  position: moodSecondHalfAnimation,
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 64, right: 64, top: 16, bottom: 16),
                    child: Text(
                      "Get interesting insights about your health and mood",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SlideTransition(
                position: imageFirstHalfAnimation,
                child: SlideTransition(
                  position: imageSecondHalfAnimation,
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 350, maxHeight: 250),
                    child: LottieBuilder.asset(
                        "android/assets/Report1.json"),
                    // child: Image.asset(
                    //   'android/assets/introduction_animation/mood_dairy_image.png',
                    //   fit: BoxFit.contain,
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
