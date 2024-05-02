import 'package:data/data.dart';
import 'package:domain/src/home_repo/home_repo.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class HomeDataMock extends Mock implements HomeData {}

void main() {
  late HomeData dataLayer;
  late HomeRepo homeRepo;

  setUp(() {
    dataLayer = HomeDataMock();
    homeRepo = HomeTempRepo(homeDemoData: dataLayer);
  });

  group('welcomeToWidgetBook', () {
    test(
        '''
should return [HelloModel] when data layer is called successfully with given param.''',
        () async {
      when(
        () => dataLayer.welcomeToHomeScreen(
          message: any(named: 'message'),
        ),
      ).thenAnswer(
        (_) => Future.value(const HelloModel(message: 'hello world!')),
      );

      final result =
          await homeRepo.welcomeToHome(message: 'any message');

      verify(() => dataLayer.welcomeToHomeScreen(message: 'any message'))
          .called(1);
      expect(result, const HelloModel(message: 'hello world!'));
    });

    test('should throw error when any error occur while calling data layer',
        () async {
      when(
        () => dataLayer.welcomeToHomeScreen(
          message: any(named: 'message'),
        ),
      ).thenThrow(Exception());

      await expectLater(
        homeRepo.welcomeToHome(message: 'some message'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
