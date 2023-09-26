// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

import 'package:wallpaper/wallpaper.dart';

class WallpaperDetailsPage extends StatefulWidget {
  String imgUrl;
  WallpaperDetailsPage({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  State<WallpaperDetailsPage> createState() => _WallpaperDetailsPageState();
}

class _WallpaperDetailsPageState extends State<WallpaperDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.imgUrl), fit: BoxFit.fitHeight),
            ),
          ),
          Positioned(
            top: 70,
            left: 25,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(21.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      downloadWallpaper();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.download,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 21,
                  ),
                  InkWell(
                    onTap: () {
                      setWallpaper();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.wallpaper,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void downloadWallpaper() {
    GallerySaver.saveImage(widget.imgUrl).then((value) {
      if (value!) {
        print('Saved The Photo: ${value}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wallpaper Downlaoded'),
            backgroundColor: Colors.amber.withOpacity(0.3),
          ),
        );
      } else {
        print('Saved The Photo: ${value}');
      }
    });
  }

  void setWallpaper() {
    Wallpaper.imageDownloadProgress(widget.imgUrl).listen((event) {
      print(event);
    }, onDone: () async {
      print('Wallpaper downlaod in app cache ');
      var check = await Wallpaper.homeScreen(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        options: RequestSizeOptions.RESIZE_FIT,
      );
      print('Wallpaper Check : ${check}');
    }, onError: (e) {
      print('Error in Download');
    });
  }
}
