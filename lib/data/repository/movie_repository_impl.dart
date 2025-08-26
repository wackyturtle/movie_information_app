import 'package:movie_information_app/data/data_source/movie_data_source.dart';
import 'package:movie_information_app/data/dto/movie_response_dto.dart';
import 'package:movie_information_app/domain/entity/movie_poster.dart';
import 'package:movie_information_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource);
  final MovieDataSource _movieDataSource;

  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final result = await _movieDataSource.fetchNowPlayingMovies();
    result!.results.map((e) {
      MoviePoster(id: e.id, posterPath: e.posterPath);
    }).toList();
  }

  @override
  Future<List<Movie>?> fetchPopularMovies() {
    // TODO: implement fetchPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>?> fetchTopRatedMovies() {
    // TODO: implement fetchTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>?> fetchUpcomingMovies() {
    // TODO: implement fetchUpcomingMovies
    throw UnimplementedError();
  }
}
