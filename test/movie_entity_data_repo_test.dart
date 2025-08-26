import 'package:flutter_test/flutter_test.dart';
import 'package:movie_information_app/data/data_source/movie_data_source_inpl.dart';
import 'package:movie_information_app/data/repository/movie_repository_impl.dart';

void main() {
  MovieRepositoryImpl impl = MovieRepositoryImpl(MovieDataSourceInpl());
  test('repo test', () async {
    //
    final result = await impl.fetchNowPlayingMovies();
    expect(result[0].id, 755898);
  });
}
