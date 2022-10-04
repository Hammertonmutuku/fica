import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fika/constants/routes.dart';
import 'package:fika/helpers/loading/loading_screen.dart';
import 'package:fika/services/auth/bloc/auth_bloc.dart';
import 'package:fika/services/auth/bloc/auth_event.dart';
import 'package:fika/services/auth/bloc/auth_state.dart';
import 'package:fika/services/auth/firebase_auth_provider.dart';
import 'package:fika/views/Register.dart';
import 'package:fika/views/email_verification.dart';
import 'package:fika/views/forgot_password_view.dart';
import 'package:fika/views/login.dart';
import 'package:fika/views/notes/create_update_note.dart';
import 'package:fika/views/notes/notes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(FirebaseAuthProvider()),
      child: const HomePage(),
    ),
    routes: {
      createOrUpdateNoteRoute: ((context) => const CreateUpdateNoteView()),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialialize());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state.isLoading) {
          LoadingScreen().show(context: context, text: state.loadingText ?? 'Please wait a moment',);
        }else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const NotesView();
        } else if (state is AuthStateNeedsVerification) {
          return const EmailVerficationView();
        } else if (state is AuthStateRegistering) {
          return const RegisterView();
        } else if (state is AuthStateLoggedOut) {
          return const LoginView();
        } else if (state is AuthStateForgotPassword){
          return const ForgotPasswordView();
        }else {
          return const Scaffold(body: CircularProgressIndicator());
        }
      },
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late final TextEditingController _controller;

//   @override
//   void initState() {
//     _controller = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CounterBloc(),
//       child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Testing Bloc'),
//           ),
//           body: BlocConsumer<CounterBloc, Counterstate>(
//             listener: (context, state) {
//               _controller.clear();
//             },
//             builder: (context, state) {
//               final invalidValue = (state is CounterstateInvalidNumber)
//                   ? state.invalidValue
//                   : '';
//               return Column(
//                 children: [
//                   Text('Current value => ${state.value}'),
//                   Visibility(
//                     child: Text('Invalid input: $invalidValue'),
//                     visible: state is CounterstateInvalidNumber,
//                   ),
//                   TextField(
//                     controller: _controller,
//                     decoration: const InputDecoration(
//                       hintText: 'Enter a number here',
//                     ),
//                     keyboardType: TextInputType.number,
//                   ),
//                   Row(
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           context.read<CounterBloc>().add(DecrementEvent(_controller.text));
//                         },
//                         child: const Text('-'),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                            context.read<CounterBloc>().add(IncrementEvent(_controller.text));
//                         },
//                         child: const Text('+'),
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             },
//           )),
//     );
//   }
// }

// @immutable
// abstract class Counterstate {
//   final int value;
//   const Counterstate(this.value);
// }

// class CounterstateValid extends Counterstate {
//   const CounterstateValid(int value) : super(value);
// }

// class CounterstateInvalidNumber extends Counterstate {
//   final String invalidValue;

//  const CounterstateInvalidNumber({
//     required this.invalidValue,
//     required int previousValue,
//   }) : super(previousValue);
// }

// @immutable
// abstract class CounterEvent {
//   final String value;

//   const CounterEvent(this.value);
// }

// class IncrementEvent extends CounterEvent {
//   const IncrementEvent(String value) : super(value);
// }

// class DecrementEvent extends CounterEvent {
//   const DecrementEvent(String value) : super(value);
// }

// class CounterBloc extends Bloc<CounterEvent, Counterstate> {
//   CounterBloc() : super(const CounterstateValid(0)) {
//     on<IncrementEvent>((event, emit) {
//       final integer = int.parse(event.value);
//       if (integer == null) {
//         emit(CounterstateInvalidNumber(
//           invalidValue: event.value,
//           previousValue: state.value,
//         ));
//       } else {
//         emit(
//           CounterstateValid(state.value + integer),
//         );
//       }
//     });
//     on<DecrementEvent>((event, emit) {
//       final integer = int.parse(event.value);
//       if (integer == null) {
//         emit(CounterstateInvalidNumber(
//           invalidValue: event.value,
//           previousValue: state.value,
//         ));
//       } else {
//         emit(
//           CounterstateValid(state.value - integer),
//         );
//       }
//     });
//   }
// }

