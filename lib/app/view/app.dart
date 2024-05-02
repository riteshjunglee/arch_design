import 'package:arch_design/app/bloc/app/app_bloc.dart';
import 'package:arch_design/app/bloc/page_two/page_two_cubit.dart';
import 'package:arch_design/app/bloc/resverse/reverse_cubit.dart';
import 'package:arch_design/app/components/primary_button.dart';
import 'package:arch_design/app/components/result_text.dart';
import 'package:arch_design/app/components/text_input.dart';
import 'package:arch_design/app/view/super_list_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_manager/http_manager.dart';

/// The app.
class App extends StatefulWidget {
  /// Creates a new instance of [App].
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late HttpManager httpManager = RepositoryProvider.of(context);

  String _text = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Architecture Example'),
        ),
        body: Column(
          children: [
            WidgetDemoTextInput(
              onChanged: (text) {
                _text = text;
              },
            ),
            const SizedBox(height: 16),

            /// Using bloc on scope basis to limit rebuilds
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                final isLoading = state.status == AppStatus.loading;

                return PrimaryButton(
                  isLoading: isLoading,
                  onTap: () {
                    context.read<AppBloc>().add(
                          ReceiveMessageEntered(
                            message: _text,
                          ),
                        );
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            const Text('Result will be displayed here :'),
            const SizedBox(height: 16),

            /// Scopped bloc for limiting uncessary rebuilds
            /// we can use it on the whole widget as well to make
            /// the code look less verbose. But only when the bloc
            /// is very targetted.
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
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

            /// Providing other bloc to widget.
            /// Generally done for new pages or when we
            /// really want to separate the business logic
            BlocProvider(
              create: (context) => ReverseCubit(),
              child: const ReversedText(),
            ),

            /// Show page navigation but more importantly closing
            /// of non used bloc
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => PageTwoCubit(),
                        child: const PageTwo(),
                      ),
                    ),
                  );
                },
                child: const Text('Go to 2nd Page'),
              );
            }),

            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuperListScreen(),
                    ),
                  );
                },
                child: const Text('SuperList Test'),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ReversedText extends StatelessWidget {
  const ReversedText({super.key});

  @override
  Widget build(BuildContext context) {
    /// This file mainly demonstrates bloc-to-bloc communication via
    /// presentation layer. We can also have bloc-to-bloc communication
    /// using reactive repository.
    return BlocListener<AppBloc, AppState>(
      listenWhen: (previous, current) => previous.result != current.result,
      listener: (context, state) {
        context.read<ReverseCubit>().getReverseSequence(state.result.message);
      },
      child: BlocBuilder<ReverseCubit, ReverseState>(
        builder: (context, state) {
          return Text(state.reverseText);
        },
      ),
    );
  }
}

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  void initState() {
    super.initState();
    final currentText = context.read<AppBloc>().state.result;
    context.read<PageTwoCubit>().shuffleText(currentText.message);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageTwoCubit, PageTwoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text(state.shuffledText),
          ),
        );
      },
    );
  }
}
