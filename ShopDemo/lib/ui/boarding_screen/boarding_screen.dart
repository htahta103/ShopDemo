import 'package:ShopDemo/ui/boarding_screen/boarding_slide_item.dart';
import 'package:ShopDemo/ui/common_widgets/custom_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BoardingScreen extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  List<Widget> items = [];
  @override
  void initState() {
    super.initState();
    items.clear();
    items.add(BoardingSlideItem(
      item: SlideItem(
        image: 'assets/images/boarding_img1.png',
        title: 'View product 360 degrees',
        detail: 'You can see the product with all angles, true and convenient',
      ),
    ));
    items.add(BoardingSlideItem(
      item: SlideItem(
        image: 'assets/images/boarding_img2.png',
        title: 'Find products easily',
        detail:
            'You just need to take a photo or upload and we will find similar products for you',
      ),
    ));
    items.add(BoardingSlideItem(
      item: SlideItem(
        image: 'assets/images/boarding_img3.png',
        title: 'Payment is easy',
        detail: 'You just need to enter payment info 1 time to payment',
      ),
    ));
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            SizedBox(height: 50),
            CarouselSlider(
              items: items,
              options: CarouselOptions(
                  height: 400,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: items.map((url) {
                int index = items.indexOf(url);
                return Container(
                  width: 4.0,
                  height: 4.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(143, 95, 67, 1)
                        : Color.fromRGBO(173, 173, 173, 1),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              option: CustomButtonOption(
                onTap: (){},
                color: Color.fromRGBO(143, 95, 67, 1),
                content: Text(
                  'Get Started!',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro', color: Colors.white),
                ),
                borderRadius: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
