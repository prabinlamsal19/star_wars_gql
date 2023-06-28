import 'package:demo_app/bloc/ferry_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        BlocProvider.of<FerryBloc>(context).add(RefetchDataEvent());
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<FerryBloc, FerryState>(
          builder: (context, state) {
            if (state is FerryInitialState) {
              BlocProvider.of<FerryBloc>(context).add(InitializeFerryEvent());
              return const CircularProgressIndicator();
            } else if (state is FerryLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is InitializationsDoneState) {
              return ListView.builder(
                  controller: _scrollController,
                  itemCount: state.responseStringArray.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(color: Colors.white38),
                      child: Text(
                        state.responseStringArray[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  });
            }
            return const Text("No State");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
