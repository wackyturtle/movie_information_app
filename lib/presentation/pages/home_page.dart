import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/domain/entity/movie_poster.dart';
import 'package:movie_information_app/presentation/pages/detail_page.dart';
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
                    SizedBox(height: 10),
                    Text(
                      '가장 인기있는',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailPage(
                                id: state.popular[0].id,
                                path: state.popular[0].posterPath,
                                hero: '가장인기있는',
                              );
                            },
                          ),
                        );
                      },
                      child: Hero(
                        tag: '가장인기있는',
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w400${state.popular[0].posterPath}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                MovieList(genreS: '현재 상영중', genre: state.nowPlaying),
                SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(width: 22),
                    Text(
                      '인기순',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.popular.length,
                    itemBuilder: (context, index) {
                      final movie = state.popular[index];
                      return SizedBox(
                        width: 150,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailPage(
                                          id: state.popular[index].id,
                                          path: state.popular[index].posterPath,
                                          hero: '인기순-$index',
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: '인기순-$index',
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20),
                                    height: 180,
                                    width: 120,
                                    child: Center(
                                      child: Image.network(
                                        "https://image.tmdb.org/t/p/w200${movie.posterPath}",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              bottom: -15,
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 80,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
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
        SizedBox(height: 8),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            genreS,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genre.length,
            itemBuilder: (context, index) {
              final movie = genre[index];
              return GestureDetector(
                onTap: () {
                  String hero = '$genreS-$index';
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailPage(
                          id: genre[index].id,
                          path: genre[index].posterPath,
                          hero: hero,
                        );
                      },
                    ),
                  );
                },
                child: Hero(
                  tag: '$genreS-$index',
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 180,
                    width: 120,
                    child: Center(
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w200${movie.posterPath}",
                      ),
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
