import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:number_trivia/src/core/number_trivia/presentation/mobx/number_trivia_store.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({super.key});
  // MobX

  @override
  Widget build(BuildContext context) {
    final numberTriviaStore = context.watch<NumberTriviaStore>(
      (store) => store.isLoading,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('NumberTrivia'),
      ),
      body: Observer(
        builder: (_) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Text(numberTriviaStore.triviaText),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: <Widget>[
                      const Placeholder(
                        fallbackHeight: 40,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const <Widget>[
                          Expanded(child: Placeholder()),
                          SizedBox(width: 10),
                          Expanded(child: Placeholder()),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
