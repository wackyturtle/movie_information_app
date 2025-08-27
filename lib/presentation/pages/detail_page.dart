import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/presentation/pages/detail_page_view_model.dart';

class DetailPage extends ConsumerWidget {
  final int id;
  final String path;
  final String hero;
  const DetailPage({
    super.key,
    required this.id,
    required this.path,
    required this.hero,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailPageViewModelProvider(id));

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Hero(
                tag: hero,
                child: SizedBox(
                  height: 500,
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w400$path",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          state.movieDetail?.title ?? "",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(state.movieDetail?.releaseDate ?? ""),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(state.movieDetail?.tagline ?? ""),
                  SizedBox(height: 4),
                  Text("${state.movieDetail?.runtime ?? 0}분"),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 35,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GenreChip(state.movieDetail!.genres[index]);
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemCount: state.movieDetail!.genres.length,
                    ),
                  ),
                  SizedBox(height: 16),
                  // 줄거리
                  Text(
                    state.movieDetail!.overview,
                    style: TextStyle(height: 1.4),
                  ),
                  SizedBox(height: 20),

                  // 간단 스탯(예: 평점/투표/인기/예산/수익)
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        StatCell(
                          title: '평점',
                          value: "${state.movieDetail!.voteAverage}",
                        ),
                        SizedBox(width: 30),
                        StatCell(
                          title: '평점투표수',
                          value: "${state.movieDetail!.voteCount}",
                        ),
                        SizedBox(width: 30),
                        StatCell(
                          title: '인기점수',
                          value: "${state.movieDetail!.popularity}",
                        ),
                        SizedBox(width: 30),
                        StatCell(
                          title: '예산',
                          value: "${state.movieDetail!.budget}",
                        ),
                        SizedBox(width: 30),
                        StatCell(
                          title: '수익',
                          value: "${state.movieDetail!.revenue}",
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12),
                  SizedBox(
                    height: 130,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          state.movieDetail!.productionCompanyLogos.length,
                      separatorBuilder: (_, __) => SizedBox(width: 12),
                      itemBuilder: (_, i) => Container(
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(230),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white12),
                        ),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w200${state.movieDetail!.productionCompanyLogos[i]}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
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
    return SizedBox(
      height: 40,
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
