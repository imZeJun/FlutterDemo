import 'package:flutter/material.dart';
import 'package:flutter_app/state/bloc/rxdart/BlocProvider.dart';

void main() => runApp(RxDartDemo());

class RxDartDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        home: FirstScreen(),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: StreamBuilder<int>(
          stream: bloc.stream,
          initialData: bloc.count,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text(
              '${snapshot.data} times', style: TextStyle(fontSize: 20)
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder : (context) => SecondScreen())
            );
          },
        child: Icon(Icons.forward),
      ),
    );
  }

}

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: StreamBuilder(
            stream: bloc.stream,
            initialData: bloc.count,
            builder: (context, snapshot) {
            return Text(
              '${snapshot.data} times', style: TextStyle(fontSize: 20)
            );
          })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
