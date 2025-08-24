import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 500,
                child: Image.network(
                  'https://picsum.photos/200/300',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 100),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    children: [
                      Expanded(child: Text('Moana 2')),
                      Text('2024-11-27'),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text('The ocean is calling them back.'),
                  SizedBox(height: 4),
                  Text('100분'),

                  Wrap(
                    spacing: 8,
                    children: [
                      GenreChip('Animation'),
                      GenreChip('Adventure'),
                      GenreChip('Family'),
                      GenreChip('Comedy'),
                    ],
                  ),
                  SizedBox(height: 16),
                  // 줄거리
                  Text(
                    'After receiving an unexpected call from her wayfinding ancestors, '
                    'Moana journeys alongside Maui and a new crew to the far seas...',
                    style: TextStyle(height: 1.4),
                  ),
                  SizedBox(height: 20),

                  // 간단 스탯(예: 평점/투표/인기/예산)
                  SizedBox(
                    height: 50,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          StatCell(title: '평점', value: '6.949'),
                      separatorBuilder: (context, index) => SizedBox(width: 30),
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
