import 'package:movie_information_app/domain/entity/movie_detail.dart';
import 'package:movie_information_app/domain/entity/movie_poster.dart';

abstract interface class MovieRepository {
  Future<List<MoviePoster>?> fetchNowPlayingMovies();

  Future<List<MoviePoster>?> fetchPopularMovies();

  Future<List<MoviePoster>?> fetchTopRatedMovies();

  Future<List<MoviePoster>?> fetchUpcomingMovies();

  Future<MovieDetail?> fetchMovieDetail(int id);
}
