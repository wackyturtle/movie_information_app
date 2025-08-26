import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/domain/entity/movie_poster.dart';
import 'package:movie_information_app/presentation/pages/home_page_view_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(homePageViewModelProvider);
            final fetch = ref.read(homePageViewModelProvider.notifier);
            fetch.fetchNowPlayingMovies();
            fetch.fetchPopularExecute();
            fetch.fetchTopRatedExecute();
            fetch.fetchUpcomingExecute();
            return ListView(
              children: [
                Column(
                  children: [
                    Text('가장 인기있는'),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w200${state.popular[0].posterPath}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                MovieList(genreS: '현재 상영중', genre: state.nowPlaying),
                MovieList(genreS: '인기순', genre: state.popular),
                MovieList(genreS: '평점 높은순', genre: state.topRated),
                MovieList(genreS: '개봉예정', genre: state.upcoming),
              ],
            );
          },
        ),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  const MovieList({super.key, required this.genreS, required this.genre});

  final String genreS;
  final List<MoviePoster> genre;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(margin: EdgeInsets.only(left: 20), child: Text(genreS)),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genre.length,
            itemBuilder: (context, index) {
              final movie = genre[index];
              return GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  color: Colors.yellow,
                  height: 180,
                  width: 120,
                  child: Center(
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w200${movie.posterPath}",
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
