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
                  'https://picsum.photos/400/400',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
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
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
