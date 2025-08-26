import 'package:movie_information_app/domain/entity/movie_detail.dart';
import 'package:movie_information_app/domain/entity/movie_poster.dart';
import 'package:movie_information_app/domain/repository/movie_repository.dart';

class FetchMoviesUsecase {
  FetchMoviesUsecase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<List<MoviePoster>?> fetchNowPlayingExecute() async {
    return await _movieRepository.fetchNowPlayingMovies();
  }

  Future<List<MoviePoster>?> fetchPopularExecute() async {
    return await _movieRepository.fetchPopularMovies();
  }

  Future<List<MoviePoster>?> fetchTopRatedExecute() async {
    return await _movieRepository.fetchTopRatedMovies();
  }

  Future<List<MoviePoster>?> fetchUpcomingExecute() async {
    return await _movieRepository.fetchUpcomingMovies();
  }

  Future<MovieDetail?> fetchMovieDetail(int id) async {
    return await _movieRepository.fetchMovieDetail(id);
  }
}
