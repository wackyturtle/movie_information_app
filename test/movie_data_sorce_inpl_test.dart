import 'package:flutter_test/flutter_test.dart';
import 'package:movie_information_app/data/data_source/movie_data_source_inpl.dart';
import 'package:movie_information_app/data/dto/movie_response_dto.dart';

void main() {
  MovieDataSourceInpl inpl = MovieDataSourceInpl();

  test('description', () async {
    MovieResponseDto? response = await inpl.fetchNowPlayingMovies();
    expect(response, isNotEmpty);
  });
}
