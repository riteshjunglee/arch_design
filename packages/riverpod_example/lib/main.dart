import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/providers/app/app_provider.dart';
import 'package:riverpod_example/components/primary_button.dart';
import 'package:riverpod_example/components/result_text.dart';
import 'package:riverpod_example/components/text_input.dart';
import 'package:riverpod_example/providers/reverse/reverse_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            WidgetDemoTextInput(
              onChanged: (text) {
                _text = text;
              },
            ),
            const SizedBox(height: 16),

            /// Using consumer on scope basis to limit rebuilds
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(appProviderProvider);
                final isLoading = state.status == AppStatus.loading;

                return PrimaryButton(
                  isLoading: isLoading,
                  onTap: () {
                    ref
                        .read(appProviderProvider.notifier)
                        .generateMessage(_text);
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            const Text('Result will be displayed here :'),
            const SizedBox(height: 16),

            /// using consumer instead of consumerWidget
            /// TODO: check if reduces rebuilds
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(appProviderProvider);
                final isSuccess = state.status == AppStatus.success;
                final isError = state.status == AppStatus.error;
                final errorMessage = state.errorMessage;
                final result = state.result.message;

                return ResultText(
                  isSuccess: isSuccess,
                  result: result,
                  isError: isError,
                  errorMessage: errorMessage,
                );
              },
            ),

            const SizedBox(height: 16),
            const ReversedText(),

            /// Show page navigation but more importantly closing
            /// of non used bloc
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PageTwo(),
                    ),
                  );
                },
                child: const Text('Go to 2nd Page'),
              );
            })
          ],
        ),
      ),
    );
  }
}

class ReversedText extends ConsumerWidget {
  const ReversedText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reverseText = ref.watch(reverseProviderProvider);

    /// This file mainly demonstrates bloc-to-bloc communication via
    /// presentation layer. We can also have bloc-to-bloc communication
    /// using reactive repository.
    return Text(reverseText);
  }
}

class PageTwo extends ConsumerWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(ref.watch(reverseProviderProvider)),
      ),
    );
  }
}
