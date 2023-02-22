import 'package:flutter/material.dart';
import 'package:random/quote.dart';
import 'package:random/quote_api.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Quote> _futureQuote;

  @override
  void initState() {
    super.initState();
    _futureQuote = QuoteApi.fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Quote Generator'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<Quote>( 
                future: _futureQuote,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      '${snapshot.data!.text}\n\n- ${snapshot.data!.author}',
                      textAlign: TextAlign.center,
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return CircularProgressIndicator();
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _futureQuote = QuoteApi.fetchQuote();
                  });
                },
                child: Text('Get a new quote'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
