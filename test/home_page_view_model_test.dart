// test/home_page_view_model_integration_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie_information_app/presentation/pages/home_page_view_model.dart';
import 'package:movie_information_app/domain/entity/movie_poster.dart';

void main() {
  group('HomePageViewModel (integration, real providers)', () {
    late ProviderContainer container;

    setUp(() {
      // 오버라이드 없이 실제 프로바이더 그래프 사용
      container = ProviderContainer();
      addTearDown(container.dispose);
    });

    test('초기 state는 빈 리스트 []', () {
      final state = container.read(homePageViewModelProvider);
      expect(state, isEmpty);
    }, timeout: const Timeout(Duration(seconds: 5)));

    test(
      'fetchMovies() 호출 시 실제 체인 타고 리스트가 채워진다',
      () async {
        final vm = container.read(homePageViewModelProvider.notifier);

        await vm.fetchNowPlayingMovies();

        final state = container.read(homePageViewModelProvider);

        // 타입/널/비어있지 않음 검증
        expect(state, isA<List<MoviePoster>?>());
        expect(state, isNotNull);
        expect(state, isNotEmpty);

        // 간단한 불변식 검증(필요 시 너 프로젝트 엔티티 필드에 맞춰 보강)
        for (final m in state.nowPlaying) {
          expect(m.id, greaterThan(0)); // id 양수
          expect(m.posterPath, isNotEmpty); // 제목 존재
          // posterPath가 nullable이면 다음 줄은 상황에 맞게 조정
          // expect(m.posterPath, isNotEmpty);
        }
      },
      // 외부 네트워크 호출은 여유 타임아웃 권장
      timeout: const Timeout(Duration(seconds: 20)),
      // 환경에 따라 네트워크/키 미설정이면 skip할 수도 있음 (옵션)
      // skip: const bool.fromEnvironment('RUN_LIVE_TESTS', defaultValue: true) ? false : 'RUN_LIVE_TESTS=false',
    );

    test(
      '연속 호출 시 두 번째 호출도 예외 없이 동작(캐시/중복호출에 대한 안전성 가벼운 체크)',
      () async {
        final vm = container.read(homePageViewModelProvider.notifier);

        await vm.fetchNowPlayingMovies();
        final first = container.read(homePageViewModelProvider);

        await vm.fetchNowPlayingMovies();
        final second = container.read(homePageViewModelProvider);

        // 최소한 예외 없이 잘 동작하고, 비어있지 않음을 확인
        expect(first, isNotEmpty);
        expect(second, isNotEmpty);
      },
      timeout: const Timeout(Duration(seconds: 20)),
    );
  });
}
