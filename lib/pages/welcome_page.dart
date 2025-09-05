import 'package:flutter/material.dart';
import 'package:travel_app/pages/nav_pages/main_pages/main_pages.dart';
import 'package:travel_app/utils/app_color.dart';
import 'package:travel_app/widget/app_large_text/app_large_text.dart';
import 'package:travel_app/widget/app_text/app_text.dart';
import 'package:travel_app/widget/responsive_button/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  List image = [
    "assets/image/welcome-one.png",
    "assets/image/image1.jpg",
    "assets/image/mountain.jpeg",
    // "assets/image/wlc.png",
    // "assets/image/6221846.jpg",
    // "assets/image/image.jpg",
    // "assets/image/snowy-mountains-sunset.jpg",
  ];

  late PageController _pageController;
  int currentPage = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 12).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: image.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("${image[index]}"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Trips"),
                        AppText(text: "Mountain", size: 30),
                        SizedBox(height: 20),
                        Container(
                          width: 250,
                          child: AppText(
                            text: "Mountain hikes give you an "
                                "incredible sense of freedom along with endurance tests",
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPagesNavPage(),
                            ),
                            (route) => false,
                          ),
                          child: ResponsiveButton(
                            isResponsive: false,
                            width: 100,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value),
                child: Column(
                  children: [
                    Icon(Icons.keyboard_arrow_down,
                        color: Colors.white.withOpacity(0.9), size: 38),
                    Text(
                      "Scroll Down and Enjoy",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
