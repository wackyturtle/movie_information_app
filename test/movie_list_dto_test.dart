import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_information_app/data/dto/movie_list_dto.dart';

void main() {
  test('description', () {
    String testString = """
{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/iZLqwEwUViJdSkGVjePGhxYzbDb.jpg",
      "genre_ids": [
        878,
        53
      ],
      "id": 755898,
      "original_language": "en",
      "original_title": "War of the Worlds",
      "overview": "Will Radford is a top analyst for Homeland Security who tracks potential threats through a mass surveillance program, until one day an attack by an unknown entity leads him to question whether the government is hiding something from him... and from the rest of the world.",
      "popularity": 1181.4284,
      "poster_path": "/yvirUYrva23IudARHn3mMGVxWqM.jpg",
      "release_date": "2025-07-29",
      "title": "War of the Worlds",
      "video": false,
      "vote_average": 4.252,
      "vote_count": 405
    },
    {
      "adult": false,
      "backdrop_path": "/1KFv63mmcBGVbFl3jxxozoSFlhA.jpg",
      "genre_ids": [
        28,
        18
      ],
      "id": 911430,
      "original_language": "en",
      "original_title": "F1",
      "overview": "Racing legend Sonny Hayes is coaxed out of retirement to lead a struggling Formula 1 team—and mentor a young hotshot driver—while chasing one more chance at glory.",
      "popularity": 817.181,
      "poster_path": "/9PXZIUsSDh4alB80jheWX4fhZmy.jpg",
      "release_date": "2025-06-25",
      "title": "F1",
      "video": false,
      "vote_average": 7.776,
      "vote_count": 1413
    },
    {
      "adult": false,
      "backdrop_path": "/538U9snNc2fpnOmYXAPUh3zn31H.jpg",
      "genre_ids": [
        28,
        12,
        53
      ],
      "id": 575265,
      "original_language": "en",
      "original_title": "Mission: Impossible - The Final Reckoning",
      "overview": "Ethan Hunt and team continue their search for the terrifying AI known as the Entity — which has infiltrated intelligence networks all over the globe — with the world's governments and a mysterious ghost from Hunt's past on their trail. Joined by new allies and armed with the means to shut the Entity down for good, Hunt is in a race against time to prevent the world as we know it from changing forever.",
      "popularity": 748.7356,
      "poster_path": "/z53D72EAOxGRqdr7KXXWp9dJiDe.jpg",
      "release_date": "2025-05-17",
      "title": "Mission: Impossible - The Final Reckoning",
      "video": false,
      "vote_average": 7.245,
      "vote_count": 1383
    },
    {
      "adult": false,
      "backdrop_path": "/eU7IfdWq8KQy0oNd4kKXS0QUR08.jpg",
      "genre_ids": [
        878,
        12,
        28
      ],
      "id": 1061474,
      "original_language": "en",
      "original_title": "Superman",
      "overview": "Superman, a journalist in Metropolis, embarks on a journey to reconcile his Kryptonian heritage with his human upbringing as Clark Kent.",
      "popularity": 715.9933,
      "poster_path": "/ombsmhYUqR4qqOLOxAyr5V8hbyv.jpg",
      "release_date": "2025-07-09",
      "title": "Superman",
      "video": false,
      "vote_average": 7.6,
      "vote_count": 2561
    },
    {
      "adult": false,
      "backdrop_path": "/xk0ck8qmYmevisTmphWIDm1g43p.jpg",
      "genre_ids": [
        53,
        28,
        35
      ],
      "id": 1151334,
      "original_language": "en",
      "original_title": "Eenie Meanie",
      "overview": "A former teenage getaway driver gets dragged back into her unsavory past when a former employer offers her a chance to save the life of her chronically unreliable ex-boyfriend.",
      "popularity": 568.7198,
      "poster_path": "/12Va3oO3oYUdOd75zM57Nx1976a.jpg",
      "release_date": "2025-08-21",
      "title": "Eenie Meanie",
      "video": false,
      "vote_average": 7.06,
      "vote_count": 50
    }
  ]
}
""";

    final map = jsonDecode(testString);

    final moviesDto = (map['results'] as List)
        .map((e) => MovieListDto.fromJson(e))
        .toList();
    expect(moviesDto[0].id, 755898);
    expect(moviesDto[0].title, "War of the Worlds");
    expect(moviesDto[0].poster, "/yvirUYrva23IudARHn3mMGVxWqM.jpg");
    print(moviesDto[0].id);
    print(moviesDto[0].title);
    print(moviesDto[0].poster);
    print(moviesDto[1].id);
    print(moviesDto[1].title);
    print(moviesDto[1].poster);
    print(moviesDto[2].id);
    print(moviesDto[2].title);
    print(moviesDto[2].poster);
    print(moviesDto[3].id);
    print(moviesDto[3].title);
    print(moviesDto[3].poster);
    print(moviesDto[4].id);
    print(moviesDto[4].title);
    print(moviesDto[4].poster);
  });
}
