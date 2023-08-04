import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_images/screens/home_screen.dart';
import 'package:my_images/services/list_hashtag_bloc.dart';

final List<Map<String, dynamic>> listHashtag = [
  {
    'name': '#flutter',
  },
  {
    'name': '#dart',
  },
];

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListHashtagBloc>(
          lazy: false,
          create: (context) => ListHashtagBloc(
            listHashtag,
          )..add(OnInitializeListHashtagEvent()),
        ),
      ],
      child: const MaterialApp(
        title: 'Insta Tags',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
