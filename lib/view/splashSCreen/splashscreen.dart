import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../homePage/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Flexify.goRemoveAll(
        HomePage(),
        animation: FlexifyRouteAnimations.blur,
        duration: Durations.medium1,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://i.pinimg.com/originals/f3/6f/d1/f36fd10095d1f265c60071599a9156f4.jpg",
                  width: 120.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // App name with updated style
              Text(
                'Contact Diary',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 20.h),

              Spacer(),
              LinearProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
