import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/domain/entity/movie_detail.dart';
import 'package:movie_information_app/presentation/providers.dart';

class DetailState {
  MovieDetail? movieDetail;
  DetailState(this.movieDetail);
}

class DetailPageViewModel extends AutoDisposeFamilyNotifier<DetailState, int> {
  @override
  DetailState build(int arg) {
    fetchMovieDetail(arg);
    return DetailState(null);
  }

  Future<void> fetchMovieDetail(int id) async {
    final fetchMoviesUsecase = ref.read(fetchMoviesUsecaseProvider);
    final result = await fetchMoviesUsecase.fetchMovieDetail(id);
    state = DetailState(result);
  }
}

final detailPageViewModelProvider =
    AutoDisposeNotifierProvider.family<DetailPageViewModel, DetailState, int>(
      () {
        return DetailPageViewModel();
      },
    );
