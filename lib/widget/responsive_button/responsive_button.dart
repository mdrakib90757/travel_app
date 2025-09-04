import 'package:flutter/cupertino.dart';
import 'package:travel_app/utils/app_color.dart';
import 'package:travel_app/widget/app_text/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String? text;

  ResponsiveButton({
    super.key,
    this.width = 120,
    this.isResponsive = false,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isResponsive == true ? double.maxFinite : width,
      height: isResponsive == true ? 50 : 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: isResponsive == true
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          isResponsive == true
              ? Container(
                  margin: EdgeInsets.only(left: 20),
                  child: AppText(
                    text: "Book Trip Now",
                    color: AppColors.whiteColor,
                  ),
                )
              : Container(),
          SizedBox(width: 10),
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
