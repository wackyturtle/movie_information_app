import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_information_app/data/data_source/movie_data_source.dart';
import 'package:movie_information_app/data/dto/movie_response_dto.dart';

class MovieDataSourceInpl implements MovieDataSource {
  final Dio _client = Dio(BaseOptions(validateStatus: (status) => true));

  @override
  Future<MovieResponseDto?> fetchNowPlayingMovies() async {
    final nowPlayingResponse = await _client.get(
      'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_release_type=2|3&release_date.gte={min_date}&release_date.lte={max_date}',
    );
    print(nowPlayingResponse);
    if (nowPlayingResponse.statusCode == 200) {
      return MovieResponseDto.fromJson(nowPlayingResponse.data);
    }
    return null;
  }

  @override
  Future<MovieResponseDto?> fetchPopularMovies() {
    // TODO: implement fetchPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() {
    // TODO: implement fetchTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() {
    // TODO: implement fetchUpcomingMovies
    throw UnimplementedError();
  }
}

void main() async {
  final nowPlayingResponse = MovieDataSourceInpl();
  final response = await nowPlayingResponse.fetchNowPlayingMovies();
  print("어이가 없네? ${response?.page}");
}
