import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/wallpaper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Wallpaper> wallpaper;
  var findWallpaperController = TextEditingController();
  @override
  void initState() {
    super.initState();
    wallpaper = getWallpaper();
  }

  @override
  Widget build(BuildContext context) {
    getWallpaper(query: 'nature');
    return Scaffold(
        backgroundColor: Color(0xffD8EBEF),
        body: FutureBuilder<Wallpaper>(
          future: wallpaper,
          builder: (context, snapshot) {
            return Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Find Wallpaper...",
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(
                          color: Color(0xffB7B9C0),
                          fontWeight: FontWeight.w600,
                        ),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Color(0xffB7B9C0),
                        )),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    'Best of the month',
                    style: TextStyle(
                      color: Color(0xff26272B),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [],
                  ),
                  const Text(
                    "The color tone",
                    style: TextStyle(
                      color: Color(0xff26272B),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [],
                  ),
                  const Text(
                    "Category",
                    style: TextStyle(
                      color: Color(0xff26272B),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  Future<Wallpaper> getWallpaper({String query = 'nature'}) async {
    var uri = Uri.parse(
        "https://api.pexels.com/v1/search?query=${query}&per_page=10");
    var res = await http.get(uri, headers: {
      "Authorization":
          "ow3AzBfGf0rV1L1EOTHLPTA1k0doHQorT2nO9pVVe01rAdt5Bx260IW3"
    });
    // print(res.body);
    var data = jsonDecode(res.body);
    return Wallpaper.fromJson(data);
  }
}
