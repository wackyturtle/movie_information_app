// {
//       "adult": false,
//       "backdrop_path": "/iZLqwEwUViJdSkGVjePGhxYzbDb.jpg",
//       "genre_ids": [
//         878,
//         53
//       ],
//       "id": 755898,
//       "original_language": "en",
//       "original_title": "War of the Worlds",
//       "overview": "Will Radford is a top analyst for Homeland Security who tracks potential threats through a mass surveillance program, until one day an attack by an unknown entity leads him to question whether the government is hiding something from him... and from the rest of the world.",
//       "popularity": 1181.4284,
//       "poster_path": "/yvirUYrva23IudARHn3mMGVxWqM.jpg",
//       "release_date": "2025-07-29",
//       "title": "War of the Worlds",
//       "video": false,
//       "vote_average": 4.252,
//       "vote_count": 405
//     },

//entity만들때 쓰기
// class MovieResponseDto {
//   final String poster;

//   MovieResponseDto({required this.poster});

//   MovieResponseDto.fromJson(Map<String, dynamic> map)
//     : this(poster: map["poster_path"]);

//   Map<String, dynamic> toJson() {
//     return {'poster': poster};
//   }
// }

class MovieResponseDto {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  MovieResponseDto({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  MovieResponseDto.fromJson(Map<String, dynamic> map)
    : this(
        page: map['page'],
        results: (map['results'] as List)
            .map((e) => Movie.fromJson(e))
            .toList(),
        totalPages: map['total_pages'],
        totalResults: map['total_results'],
      );
}

class Movie {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  Movie.fromJson(Map<String, dynamic> map)
    : this(
        adult: map['adult'],
        backdropPath: map['backdrop_path'],
        genreIds: List<int>.from(map['genre_ids']),
        id: map['id'],
        originalLanguage: map['original_language'],
        originalTitle: map['original_title'],
        overview: map['overview'],
        popularity: map['popularity'],
        posterPath: map['poster_path'],
        releaseDate: map['release_date'],
        title: map['title'],
        video: map['video'],
        voteAverage: map['vote_average'],
        voteCount: map['vote_count'],
      );
}
