import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/presentation/pages/detail_page_view_model.dart';
import 'package:movie_information_app/presentation/pages/home_page_view_model.dart';

class DetailPage extends ConsumerWidget {
  int id;
  String path;

  DetailPage({super.key, required this.id, required this.path});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailPageViewModelProvider(id));
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 500,
                child: Image.network(
                  "https://image.tmdb.org/t/p/w200$path",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (state.movieDetail != null) ...[
              SliverPadding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Row(
                      children: [
                        Expanded(child: Text(state.movieDetail!.title)),
                        Text('2024-11-27'),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(state.movieDetail!.tagline),
                    SizedBox(height: 4),
                    Text("${state.movieDetail!.runtime}"),

                    Wrap(
                      spacing: 8,
                      children: [
                        for (String i in state.movieDetail!.genres) ...[
                          GenreChip(i),
                        ],
                      ],
                    ),
                    SizedBox(height: 16),
                    // 줄거리
                    Text(
                      state.movieDetail!.overview,
                      style: TextStyle(height: 1.4),
                    ),
                    SizedBox(height: 20),

                    // 간단 스탯(예: 평점/투표/인기/예산)
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => StatCell(
                          title: '평점',
                          value: '${state.movieDetail!.voteAverage}',
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 30),
                        itemCount: 4,
                      ),
                    ),

                    SizedBox(height: 12),
                    SizedBox(
                      height: 130,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        separatorBuilder: (_, __) => SizedBox(width: 12),
                        itemBuilder: (_, i) => Container(
                          width: 150,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFF1E1E1E),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white12),
                          ),
                          child: Text('Walt Disney'),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class GenreChip extends StatelessWidget {
  final String label;
  GenreChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      labelStyle: TextStyle(color: Colors.white),
      backgroundColor: Color(0xFF1E1E1E),
      side: BorderSide(color: Colors.white24),
      padding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}

class StatCell extends StatelessWidget {
  final String title;
  final String value;
  StatCell({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(value, style: TextStyle(fontWeight: FontWeight.w700)),
          SizedBox(height: 4),
          Text(title, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
