import 'package:data/data.dart';
import 'package:http_manager/http_manager.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class WidgetbookApiMock extends Mock implements HttpManager {}

void main() {
  late DummyHomeData widgetBookLocalApi;
  late HttpManager mockApi;

  setUp(() {
    mockApi = WidgetbookApiMock();
    widgetBookLocalApi = DummyHomeData(httpManager: mockApi);
  });

  group('welcomeToWidgetBook', () {
    test(
        '''
should fetch and return the api result as [HelloModel] when api is called.''',
        () async {
      when(
        () => mockApi.welcomeToHome(message: any(named: 'message')),
      ).thenAnswer((_) => Future.value('welcome to widgetbook!'));

      final result =
          await widgetBookLocalApi.welcomeToHomeScreen(message: 'hello world');

      verify(() => mockApi.welcomeToHome(message: 'hello world'));
      expect(result, const HelloModel(message: 'welcome to widgetbook!'));
    });

    test('should throw error when an exception occurs.', () async {
      when(
        () => mockApi.welcomeToHome(message: any(named: 'message')),
      ).thenThrow(Exception());

      await expectLater(
        () => widgetBookLocalApi.welcomeToHomeScreen(message: 'hello world'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
