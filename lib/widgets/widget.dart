import 'package:flutter/material.dart';
import 'package:wallpaperflutterapp/model/wallpaper_model.dart';
import 'package:wallpaperflutterapp/views/image_view.dart';

Widget brandName() {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      children: <TextSpan>[
        TextSpan(
          text: 'Wallpaper',
          style: TextStyle(color: Colors.black87, fontFamily: 'Overpass'),
        ),
        TextSpan(
          text: 'Hub',
          style: TextStyle(color: Colors.blue, fontFamily: 'Overpass'),
        ),
      ],
    ),
  );
}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        childAspectRatio: 0.6,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: wallpapers.map(
          (wallpaper) {
            return GridTile(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageView(
                        imgUrl: wallpaper.src.portrait,
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: wallpaper.src.portrait,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        wallpaper.src.portrait,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ));
}
