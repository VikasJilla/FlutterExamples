import 'package:bloc_example/blocs/timer_bloc.dart';
import 'package:bloc_example/counter_bloc.dart';
import 'package:bloc_example/screens/timer_screen.dart';
import 'package:bloc_example/utilities/ticker_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:BlocProvider(
        builder: (context)=>CounterBloc(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),        
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
   BlocProvider.of<CounterBloc>(context).dispatch(CounterEvent.increment);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc,int>(
              builder: (context,count)=>Text(
                '$count',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            RaisedButton(
              child: Text("launch Timer",style: Theme.of(context).textTheme.subtitle.copyWith(color: Colors.white),),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BlocProvider(
                      builder: (context)=>TimerBloc(ticker: Ticker()),
                      child: TimerScreen(),
                    )
                  )
                );
              },
              color: Colors.lightBlue,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
