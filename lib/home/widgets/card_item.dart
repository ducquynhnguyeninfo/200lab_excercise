import 'package:flutter/material.dart';
import 'package:ft01_flutter_tinder_app/values/app_color.dart';
import 'package:ft01_flutter_tinder_app/values/app_images.dart';
import 'package:ft01_flutter_tinder_app/values/app_text_style.dart';

class CardItem extends StatefulWidget {
  final String? title;

  CardItem({Key? key, this.title}) : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  List<String> candyImages = [
    AppImage.candy,
    AppImage.candy1,
    AppImage.candy2,
  ];

  int indexImage = 0;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 5,
                  child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: pageController,
                      itemCount: candyImages.length,
                      onPageChanged: (index) {
                        setState(() {
                          indexImage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(candyImages[index]),
                              )),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      if (indexImage > 0) {
                                        pageController
                                            .jumpToPage(indexImage - 1);
                                      }
                                    },
                                    child: Container(),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      if (indexImage < candyImages.length - 1) {
                                        pageController
                                            .jumpToPage(indexImage + 1);
                                      }
                                    },
                                    child: Container(),
                                  )),
                            ],
                          ),
                        );
                      })),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Candy Crush',
                              style: AppTextStyle.titleCard,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 3,
                                height: 3,
                                decoration: BoxDecoration(
                                    color: AppColor.lightGrey,
                                    shape: BoxShape.circle),
                              ),
                            ),
                            Text(
                              '21',
                              style: AppTextStyle.titleCard,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Text(
                                'Versatile',
                              ),
                              Text( 
                                'Seattle, USA',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
