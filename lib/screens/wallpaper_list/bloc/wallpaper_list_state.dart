part of 'wallpaper_list_bloc.dart';

@immutable
abstract class WallpaperListState {}

class WallpaperListInitialState extends WallpaperListState {}

class WallpaperListLoadingState extends WallpaperListState {}

class WallpaperListLoadedState extends WallpaperListState {
  DataPhotoModel wallpaperModel;
  WallpaperListLoadedState({
    required this.wallpaperModel,
  });
}

class WallpaperListErrorState extends WallpaperListState {
  String errorMsg;
  WallpaperListErrorState({
    required this.errorMsg,
  });
}

class WallpaperListInternetErrorState extends WallpaperListState {
  String errorMsg;
  WallpaperListInternetErrorState({
    required this.errorMsg,
  });
}
