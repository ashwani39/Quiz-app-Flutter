import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  
  Result(this.resultScore,this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';

    if (resultScore<12) {
      resultText='You need to know me more';
    }
    else {
      resultText = 'You know me!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(child: Text(resultPhrase,style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        
        ),
        FlatButton(child: Text('Restart Quiz'),onPressed: resetHandler,)
      ],
    );
  }
}