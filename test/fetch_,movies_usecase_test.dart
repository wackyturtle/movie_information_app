import 'package:flutter_test/flutter_test.dart';
import 'package:movie_information_app/data/data_source/movie_data_source.dart';
import 'package:movie_information_app/data/data_source/movie_data_source_inpl.dart';
import 'package:movie_information_app/data/repository/movie_repository_impl.dart';
import 'package:movie_information_app/domain/usecase/fetch_movies_usecase.dart';

void main() {
  MovieDataSource data = MovieDataSourceInpl();
  MovieRepositoryImpl repo = MovieRepositoryImpl(data);
  FetchMoviesUsecase usecase = FetchMoviesUsecase(repo);
  test('usecase test', () async {
    //
    final result = await usecase.fetchNowPlayingExecute();
    expect(result![0].id, 755898);
  });
}
