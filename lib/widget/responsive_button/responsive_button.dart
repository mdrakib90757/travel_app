import 'package:flutter/cupertino.dart';
import 'package:travel_app/utils/app_color.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({super.key, this.width, this.isResponsive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/img/arrow-icon.webp",
            height: 40,
            width: 40,
            color: AppColors.whiteColor,
          ),
        ],
      ),
    );
  }
}
