import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_color.dart';
import 'package:travel_app/widget/app_buttons/app_buttons.dart';
import 'package:travel_app/widget/app_large_text/app_large_text.dart';
import 'package:travel_app/widget/app_text/app_text.dart';
import 'package:travel_app/widget/responsive_button/responsive_button.dart';

class DetailsPages extends StatefulWidget {
  final String image;
  const DetailsPages({super.key, required this.image});

  @override
  State<DetailsPages> createState() => _DetailsPagesState();
}

class _DetailsPagesState extends State<DetailsPages> {
  int gottenStars = 4;
  int selectIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Image.asset(
              "${widget.image}",
              fit: BoxFit.cover,
              height: double.maxFinite,
              width: double.maxFinite,
            ),

            //Menu Icon
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                ],
              ),
            ),

            Positioned(
              top: 430,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: "Yosemite"),
                          AppLargeText(text: "\$250"),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: AppColors.mainColor),
                          SizedBox(width: 8),
                          AppText(
                            text: "USA,California",
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < gottenStars
                                    ? AppColors.starColor
                                    : AppColors.textColor2,
                              );
                            }),
                          ),
                          SizedBox(width: 8),
                          AppText(text: "(4.0)", color: AppColors.textColor2),
                        ],
                      ),
                      SizedBox(height: 10),
                      AppLargeText(
                        text: "People",
                        color: Colors.black.withOpacity(0.8),
                        size: 22,
                      ),
                      AppText(
                        text: "Number of people in your group",
                        color: AppColors.mainTextColor,
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: AppButtons(
                                color: selectIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectIndex == index
                                    ? AppColors.mainColor
                                    : AppColors.buttonBackground,
                                borderColor: selectIndex == index
                                    ? AppColors.mainColor
                                    : AppColors.buttonBackground,
                                size: 50,
                                text: (index + 1).toString(),
                                isIcon: false,
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 10),
                      AppLargeText(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                        size: 22,
                      ),
                      SizedBox(height: 8),
                      AppText(
                        text:
                            "Travelling is a captivating and enriching experience that broadens horizons, fosters personal growth, "
                            "and connects individuals with diverse cultures and landscapes. It is a journey of discovery, both of the world and oneself. "
                            "One of the most profound aspects of travelling is the opportunity to explore new cultures.",
                        size: 16,
                        maxLines: 3,
                        textOverflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 15,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                    color: AppColors.textColor2,
                    backgroundColor: Colors.white,
                    size: 50,
                    borderColor: AppColors.textColor2,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  SizedBox(width: 5),
                  Flexible(child: ResponsiveButton(isResponsive: true)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
