import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/providers/app/app_provider.dart';

part 'reverse_provider.g.dart';

@riverpod
class ReverseProvider extends _$ReverseProvider {
  @override
  String build() {
    /// provider to provider communication
    final msg = ref.watch(appProviderProvider).result.message;

    final stringArray = msg.split('');
    final reverseText = stringArray.reversed.toList().join();

    return reverseText;
  }

  void getReverseSequence() {
    /// provider to provider communication
    final msg = ref.watch(appProviderProvider).result.message;

    print('This bloc is never triggered');

    final stringArray = msg.split('');
    final reverseText = stringArray.reversed.toList().join();

    state = reverseText;
  }
}
