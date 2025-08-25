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

class MovieListDto {
  final int id;
  final String title;
  final String poster;

  MovieListDto({required this.id, required this.title, required this.poster});

  MovieListDto.fromJson(Map<String, dynamic> map)
    : this(id: map["id"], poster: map["poster_path"], title: map["title"]);

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'poster': poster};
  }
}
