// 뷰모델에서 직접 객체 생성하지 않을 수 있게
// 유스케이스 공급해주는 프로바이더 생성
// 뷰모델 내에서는 프로바이더에 의해서 유스케이스 공급받을거

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/data/data_source/movie_data_source.dart';
import 'package:movie_information_app/data/data_source/movie_data_source_inpl.dart';
import 'package:movie_information_app/data/repository/movie_repository_impl.dart';
import 'package:movie_information_app/domain/repository/movie_repository.dart';
import 'package:movie_information_app/domain/usecase/fetch_movies_usecase.dart';

final _movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  return MovieDataSourceImpl();
});

final _movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dataSource = ref.read(_movieDataSourceProvider);
  return MovieRepositoryImpl(dataSource);
});

final fetchMoviesUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FetchMoviesUsecase(movieRepo);
});
