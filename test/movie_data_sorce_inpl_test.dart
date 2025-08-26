import 'package:flutter_test/flutter_test.dart';
import 'package:movie_information_app/data/data_source/movie_data_source_inpl.dart';
import 'package:movie_information_app/data/dto/movie_response_dto.dart';

void main() {
  final inpl = MovieDataSourceInpl();

  test('NowPlaying test', () async {
    MovieResponseDto? response = await inpl.fetchNowPlayingMovies();
    expect(response!.page, 1);
  });
  test('Popular test', () async {
    MovieResponseDto? response = await inpl.fetchPopularMovies();
    expect(response!.page, 1);
  });
  test('TopRated test', () async {
    MovieResponseDto? response = await inpl.fetchTopRatedMovies();
    expect(response!.page, 1);
  });
  test('Upcoming test', () async {
    MovieResponseDto? response = await inpl.fetchUpcomingMovies();
    expect(response!.page, 1);
  });
}
