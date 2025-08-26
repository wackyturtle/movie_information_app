import 'package:movie_information_app/data/data_source/movie_data_source.dart';
import 'package:movie_information_app/domain/entity/movie_detail.dart';
import 'package:movie_information_app/domain/entity/movie_poster.dart';
import 'package:movie_information_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource);
  final MovieDataSource _movieDataSource;

  @override
  Future<List<MoviePoster>> fetchNowPlayingMovies() async {
    final result = await _movieDataSource.fetchNowPlayingMovies();
    return result!.results.map((e) {
      return MoviePoster(id: e.id, posterPath: e.posterPath);
    }).toList();
  }

  @override
  Future<List<MoviePoster>?> fetchPopularMovies() async {
    final result = await _movieDataSource.fetchPopularMovies();
    return result!.results.map((e) {
      return MoviePoster(id: e.id, posterPath: e.posterPath);
    }).toList();
  }

  @override
  Future<List<MoviePoster>?> fetchTopRatedMovies() async {
    final result = await _movieDataSource.fetchTopRatedMovies();
    return result!.results.map((e) {
      return MoviePoster(id: e.id, posterPath: e.posterPath);
    }).toList();
  }

  @override
  Future<List<MoviePoster>?> fetchUpcomingMovies() async {
    final result = await _movieDataSource.fetchUpcomingMovies();
    return result!.results.map((e) {
      return MoviePoster(id: e.id, posterPath: e.posterPath);
    }).toList();
  }

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) {
    // TODO: implement fetchMovieDetail
    throw UnimplementedError();
  }
}
