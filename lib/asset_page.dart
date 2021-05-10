import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ft01_flutter_tinder_app/text_style.dart';
import 'package:ft01_flutter_tinder_app/ui_assets_page.dart';

class AssetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assets Page'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'This is heading style',
                style: AppTextStyle.heading,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'This is lable style',
                style: AppTextStyle.lable,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'This is custom font style',
                style: AppTextStyle.lablePoppins,
              ),
            ),
            Image.asset(UIData.background),
            // Image.network(UIData.catUrl)
            CachedNetworkImage(
              imageUrl: UIData.catUrl,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}
