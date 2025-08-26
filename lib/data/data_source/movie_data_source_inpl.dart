import 'package:dio/dio.dart';
import 'package:movie_information_app/data/data_source/movie_data_source.dart';
import 'package:movie_information_app/data/dto/movie_response_dto.dart';

class MovieDataSourceInpl implements MovieDataSource {
  final Dio _client = Dio(BaseOptions(validateStatus: (status) => true));

  @override
  Future<MovieResponseDto?> fetchNowPlayingMovies() async {
    final nowPlayingResponse = await _client.get(
      'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_release_type=2|3&release_date.gte={min_date}&release_date.lte={max_date}&key=3e7fea11b366c1fe0f7de2eecde35602',
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZTdmZWExMWIzNjZjMWZlMGY3ZGUyZWVjZGUzNTYwMiIsIm5iZiI6MTc1NjExMDQ0MS45NTcsInN1YiI6IjY4YWMxZTY5MjI3YTJjMzg2YThkMjQ1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.K3PcviaiMQqettiGWKNZ-w6_lLbilTGN73qXu2MxOyo',
        },
      ),
    );
    if (nowPlayingResponse.statusCode == 200) {
      return MovieResponseDto.fromJson(nowPlayingResponse.data);
    }
    return null;
  }

  @override
  Future<MovieResponseDto?> fetchPopularMovies() async {
    final popularMovies = await _client.get(
      'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&key=3e7fea11b366c1fe0f7de2eecde35602',
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZTdmZWExMWIzNjZjMWZlMGY3ZGUyZWVjZGUzNTYwMiIsIm5iZiI6MTc1NjExMDQ0MS45NTcsInN1YiI6IjY4YWMxZTY5MjI3YTJjMzg2YThkMjQ1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.K3PcviaiMQqettiGWKNZ-w6_lLbilTGN73qXu2MxOyo',
        },
      ),
    );
    if (popularMovies.statusCode == 200) {
      return MovieResponseDto.fromJson(popularMovies.data);
    }
    return null;
  }

  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() async {
    final topRatedMovies = await _client.get(
      'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200&key=3e7fea11b366c1fe0f7de2eecde35602',
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZTdmZWExMWIzNjZjMWZlMGY3ZGUyZWVjZGUzNTYwMiIsIm5iZiI6MTc1NjExMDQ0MS45NTcsInN1YiI6IjY4YWMxZTY5MjI3YTJjMzg2YThkMjQ1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.K3PcviaiMQqettiGWKNZ-w6_lLbilTGN73qXu2MxOyo',
        },
      ),
    );
    if (topRatedMovies.statusCode == 200) {
      return MovieResponseDto.fromJson(topRatedMovies.data);
    }
    return null;
  }

  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() async {
    final upcomingMovies = await _client.get(
      'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_release_type=2|3&release_date.gte={min_date}&release_date.lte={max_date}&key=3e7fea11b366c1fe0f7de2eecde35602',
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZTdmZWExMWIzNjZjMWZlMGY3ZGUyZWVjZGUzNTYwMiIsIm5iZiI6MTc1NjExMDQ0MS45NTcsInN1YiI6IjY4YWMxZTY5MjI3YTJjMzg2YThkMjQ1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.K3PcviaiMQqettiGWKNZ-w6_lLbilTGN73qXu2MxOyo',
        },
      ),
    );
    if (upcomingMovies.statusCode == 200) {
      return MovieResponseDto.fromJson(upcomingMovies.data);
    }
    return null;
  }
}
