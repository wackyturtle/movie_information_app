import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/domain/entity/movie_poster.dart';
import 'package:movie_information_app/presentation/providers.dart';

class HomeState {
  List<MoviePoster> nowPlaying;
  List<MoviePoster> popular;
  List<MoviePoster> topRated;
  List<MoviePoster> upcoming;
  HomeState(this.nowPlaying, this.popular, this.topRated, this.upcoming);
}

class HomePageViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState([], [], [], []);
  }

  Future<void> fetchNowPlayingMovies() async {
    final fetchMoviesUsecase = ref.read(fetchMoviesUsecaseProvider);
    final result = await fetchMoviesUsecase.fetchNowPlayingExecute();
    state = HomeState(
      result ?? [],
      state.popular,
      state.topRated,
      state.upcoming,
    );
  }

  Future<void> fetchPopularExecute() async {
    final fetchMoviesUsecase = ref.read(fetchMoviesUsecaseProvider);
    final result = await fetchMoviesUsecase.fetchPopularExecute();
    state = HomeState(
      state.nowPlaying,
      result ?? [],
      state.topRated,
      state.upcoming,
    );
  }

  Future<void> fetchTopRatedExecute() async {
    final fetchMoviesUsecase = ref.read(fetchMoviesUsecaseProvider);
    final result = await fetchMoviesUsecase.fetchTopRatedExecute();
    state = HomeState(
      state.nowPlaying,
      state.popular,
      result ?? [],
      state.upcoming,
    );
  }

  Future<void> fetchUpcomingExecute() async {
    final fetchMoviesUsecase = ref.read(fetchMoviesUsecaseProvider);
    final result = await fetchMoviesUsecase.fetchUpcomingExecute();
    state = HomeState(
      state.nowPlaying,
      state.popular,
      state.topRated,
      result ?? [],
    );
  }
}

final homePageViewModelProvider =
    NotifierProvider<HomePageViewModel, HomeState>(() {
      return HomePageViewModel();
    });
