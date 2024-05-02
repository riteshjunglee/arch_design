import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/providers/app/app_provider.dart';

part 'page_two.g.dart';

@riverpod
class PageTwo extends _$PageTwo {
  @override
  String build() {
    ref.onDispose(() { 
      print('The provider is disposed');
    });
    final msg = ref.watch(appProviderProvider).result.message;

    final textArray = msg.split('')..shuffle();
    final shuffleText = textArray.join();
    return shuffleText;
  }
}
