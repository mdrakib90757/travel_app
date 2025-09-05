import 'package:flutter/material.dart';
import 'package:travel_app/pages/details_pages/details_pages.dart';
import 'package:travel_app/pages/explore_pages/explore_pages.dart';
import 'package:travel_app/utils/app_color.dart';
import 'package:travel_app/widget/app_large_text/app_large_text.dart';
import 'package:travel_app/widget/app_text/app_text.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> with TickerProviderStateMixin {
  var image = {
    "assets/image1/balloning.png": "Balloning",
    "assets/image1/hiking.png": "Hiking",
    "assets/image1/kayaking.png": "Kayaking",
    "assets/image1/snorkling.png": "Snorking",
    "assets/image/image1.jpg": "mountain",
  };

  List images = [
    "assets/image/wlc.png",
    "assets/image/image.jpg",
    "assets/image/mountain.jpeg",
    "assets/image/image1.jpg",
    "assets/image/snowy-mountains-sunset.jpg",
    "assets/image/6221846.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //menu Text
            Container(
              padding: EdgeInsets.only(top: 50, left: 20),
              child: Row(
                children: [
                  Icon(Icons.menu, size: 30, color: Colors.black54),
                  Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    child: Image.asset("assets/image1/traveller.png"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            //Discover Text
            Container(
              margin: EdgeInsets.only(left: 20),
              child: AppLargeText(text: "Discover"),
            ),
            // SizedBox(height: 15),
            //TabBar
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: EdgeInsets.only(right: 20),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  dividerColor: Colors.transparent,
                  isScrollable: true,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabIndicator(
                    radius: 4,
                    color: AppColors.mainColor,
                  ),
                  tabs: [
                    Tab(text: "Places"),
                    Tab(text: "Inspiration"),
                    Tab(text: "Emotions"),
                  ],
                ),
              ),
            ),
            //TabBarView
            Container(
              height: 400,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPages(image: images[index]),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10, top: 10, left: 15),
                          height: 300,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage("${images[index]}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Center(child: Text("Inspiration")),
                  Center(child: Text("Emotions")),
                ],
              ),
            ),

            SizedBox(height: 20),
            //Explore Text
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(text: "Explore more", size: 22),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ExplorePages()),
                      );
                    },
                    child: AppText(
                      text: "See all",
                      color: AppColors.textColor1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 150,
              margin: EdgeInsets.only(left: 0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: image.length,
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                "${image.keys.elementAt(index)}",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: AppText(
                            text: "${image.values.elementAt(index)}",
                            color: AppColors.textColor1,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.radius, required this.color});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius,
    );
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
