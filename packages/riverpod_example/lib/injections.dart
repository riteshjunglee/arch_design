import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:http_manager/http_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'injections.g.dart';

@riverpod
class HttpInjection extends _$HttpInjection {
  @override
  HttpManager build() {
    return HttpManager();
  }
}

@riverpod
class HomeDataInjection extends _$HomeDataInjection {
  @override
  HomeData build() {
    final httpManager = ref.watch(httpInjectionProvider);
    return DummyHomeData(httpManager: httpManager);
  }
}

@riverpod
class HomeRepoInjection extends _$HomeRepoInjection {
  @override
  HomeRepo build() {
    final homeData = ref.watch(homeDataInjectionProvider);
    return HomeTempRepo(homeDemoData: homeData);
  }
}
