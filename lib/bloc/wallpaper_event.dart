// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperEvent {}

class GetSearchWallpaper extends WallpaperEvent {
  String query;
  GetSearchWallpaper({
    required this.query,
  });
}

class GetTrendingWallpaper extends WallpaperEvent {}
