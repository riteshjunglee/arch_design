# arch_design

This repository mainly aims for trying out:
1. Architectures
2. State Managements
3. Libraries and 3rd party dependencies

#### Current Progress:

- [x] State Management
- [ ] Archtitecture
- [ ] Libraries and 3rd party dependencies


## State Management

We have covered flutter_bloc and riverpod as of now. The relevant code can be found in [bloc implementation](/lib/main.dart) and [riverpod implementation](/packages/riverpod_example/lib/main.dart).

### Example

In the example we have checked certain necessary usecases of state management. Generally necessary for any application.
1. Initialization
2. Presentation level usage
3. State to State communication
4. Dependency Injection (not part of state management but its almost included with every statemanagement lib)

So a the application focuses on the above demos by doing the following.

- Takes text input from the user.
- On button press the text input is sent to a fake API which can either return [HelloModel](/packages/data/lib/src/home_data/hello/hello_model.dart) or [UnexpectedException](/packages/http_manager/lib/src/http_manager_base.dart).
- This result is then show to the user.
- Reverse sequence of this result is shown to the user.
- There is a button to navigate to 2nd page. Which shows the shuffled version of API response text.

### Learnings/ Observations

#### Advantages of flutter_bloc

1. Enforces good architectural pattern and has good documentation with lot of [official examples](https://bloclibrary.dev/tutorials/flutter-infinite-list/) to look for. Also defining [naming conventions, etc](https://bloclibrary.dev/architecture/).
2. It’s been long in the market and is heavily tested Hamilton, The New York Times, etc. Also there are plenty of [open-source code](https://github.com/Livinglist/Hacki.git) for bloc.
3. BLoC is easily testable. We have dedicated library bloc_test and Mocktail to test the bloc lib.
4. Rebuilds can be controlled manually to a good extend by correct scoping and using `buildWhen` or `listenWhen` callbacks.
5. Has a good ecosystem libraries like HydratedBloc, FlameBloc, Formz, bloc_test, bloc_concurrency, replay_bloc.
6. Clear directions for [bloc to bloc communications](https://bloclibrary.dev/architecture/#bloc-to-bloc-communication), with well documented examples.

#### Disadvantage of flutter_bloc

1. More boilerplate code even for small functionalities. (One can use Cubit to reduce the boilerplate, but we will have few less methods in BlocObserver to debug from).
2. Dependency injection does the job. But if compared to RiverPod it’s less superior. As flutter bloc will not allow multiple concreate classes for a given abstract class.

#### Advantages of RiverPod

1. Riverpod provides an unopiniated, hence using MVC or MVVM or any other popular architecture is easy. But it comes with changes of people mixing presentation logic with state or controller. (It’s a two edged sword )
2. Riverpod comes with strong dependency injection which is independent of context. 
3. Testing framework for riverpod is good. And we will be able to achieve almost bloc like testability if we take care of architecture.
4. [Memory management](https://riverpod.dev/docs/essentials/auto_dispose) is to the point, as providers are lazy loaded and previous states are removed from memory as soon as the corresponding listeners stop listening. This happens for each frame.
5. Riverpod reduces boilerplate code to great extend. Also usage is much more easier and faster.

#### Disadvantages Of RiverPod

1. The official examples focus more on how riverpod works not on architectural opinion, also they are not updated. That means we will have to spend considerable time on defining our own set of rules for development team.
2. It’s comparatively new and less adopted. We can verify this by checking the likes on GitHub and pub.dev, also flame support for bloc is better, more tested and reliable. 
3. A lot of blackbox code is included via code generation. Which sometimes gives unexpected results. Learning curve to understand the expected behaviour is considerable. We can avoid code generation but that will increase learning curve even more.
