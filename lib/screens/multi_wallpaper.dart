// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/bloc/wallpaper_bloc.dart';

class MultiWallpaper extends StatefulWidget {
  String mQuery;
  MultiWallpaper({
    Key? key,
    required this.mQuery,
  }) : super(key: key);

  @override
  _MultiWallpaperState createState() => _MultiWallpaperState();
}

class _MultiWallpaperState extends State<MultiWallpaper> {
  List listNaturalImage = [
    'assets/images/natural/img_natural16.jpg',
    'assets/images/natural/img_natural15.jpg',
    'assets/images/natural/img_natural14.jpg',
    'assets/images/natural/img_natural13.jpg',
    'assets/images/natural/img_natural12.jpg',
    'assets/images/natural/img_natural11.jpg',
    'assets/images/natural/img_natural10.jpg',
    'assets/images/natural/img_natural9.jpg',
    'assets/images/natural/img_natural8.jpg',
    'assets/images/natural/img_natural7.webp',
    'assets/images/natural/img_natural6.jpg',
    'assets/images/natural/img_natural5.jpg',
    'assets/images/natural/img_natural4.jpg',
    'assets/images/natural/img_natural3.jpg',
    'assets/images/natural/img_natural2.jpg',
    'assets/images/natural/img_natural.jpeg',
  ];
  @override
  void initState() {
    super.initState();
    context.read<WallpaperBloc>().add(GetSearchWallpaper(query: widget.mQuery));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        // backgroundColor: Color(0xffD8EBED),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.mQuery,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(child: BlocBuilder<WallpaperBloc, WallpaperState>(
                builder: (context, state) {
                  if (state is WallpaperLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is WallpaperErrorState) {
                    return Center(
                      child: Text(state.errorMsg),
                    );
                  } else if (state is WallpaperLoadedState) {
                    if (state.wallpaperModel.photos!.isNotEmpty) {
                      return Column(
                        children: [
                          Text(
                            '${state.wallpaperModel.totalResults} wallpaper available',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Image of the natural element
                          Expanded(
                            child: GridView.builder(
                              itemCount: state.wallpaperModel.photos!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 11,
                                mainAxisSpacing: 11,
                                childAspectRatio: 9 / 16,
                              ),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 150,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        state.wallpaperModel.photos![index].src!
                                            .portrait!,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      );
                    } else {
                      return Center(
                        child: Text('No Wallpaper Found'),
                      );
                    }
                  }
                  return Container();
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
