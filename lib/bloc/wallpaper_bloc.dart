import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app/api/api_helper.dart';
import 'package:wallpaper_app/api/my_exception.dart';
import 'package:wallpaper_app/api/urls.dart';
import 'package:wallpaper_app/model/data_photo_model.dart';

part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  ApiHelper apiHelper;
  WallpaperBloc({required this.apiHelper}) : super(WallpaperInitialState()) {
    on<GetTrendingWallpaper>((event, emit) async {
      emit(WallpaperLoadingState());

      try {
        var res = await apiHelper.getApi(
            url: "${Urls.trendingWallpaper}?per_page=20");
        emit(
            WallpaperLoadedState(wallpaperModel: DataPhotoModel.fromJson(res)));
      } catch (e) {
        emit(WallpaperErrorState(errorMsg: (e as MyException).myToString()));
      }
    });
  }
}
