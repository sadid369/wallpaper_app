import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app/api/api_helper.dart';
import 'package:wallpaper_app/api/my_exception.dart';
import 'package:wallpaper_app/api/urls.dart';
import 'package:wallpaper_app/model/data_photo_model.dart';

part 'wallpaper_list_event.dart';
part 'wallpaper_list_state.dart';

class WallpaperListBloc extends Bloc<WallpaperListEvent, WallpaperListState> {
  ApiHelper apiHelper;
  WallpaperListBloc({required this.apiHelper})
      : super(WallpaperListInitialState()) {
    on<WallpaperListEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetSearchWallpaper>((event, emit) async {
      emit(WallpaperListLoadingState());
      try {
        print('${Urls.searchWallpaper}?query=${event.query}');
        var res = await apiHelper.getApi(
            url:
                '${Urls.searchWallpaper}?query=${event.query}&color=${event.mColor ?? ""}&per_page=20&page=${event.pageNo}');
        emit(WallpaperListLoadedState(
            wallpaperModel: DataPhotoModel.fromJson(res)));
      } catch (e) {
        emit(
            WallpaperListErrorState(errorMsg: (e as MyException).myToString()));
      }
    });
  }
}
