import 'dart:ffi';

import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main(){
  runApp(MyApp());
}
// void main => runApp(MyApp())

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  final _questions = const [
      {'questionText':'what\'s your favourite color', 'answers':[
        {'text':'red','score':5},
        {'text':'blue','score':10},
        {'text':'green','score':3},
        {'text':'orange','score':7}]},
      {'questionText':'what\'s your favourite food', 'answers':[
        {'text':'dosa','score':5},
        {'text':'pizza','score':7},
        {'text':'cake','score':3},
        {'text':'none','score':1}]},
      
    ];
  var _questionIndex =0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
    _questionIndex =0;
    _totalScore = 0;
    });
    
  }

  void answerQuestion(int score){
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex +=1;
    });
    
  }
  @override
  Widget build(BuildContext context){
    
      return MaterialApp(home: Scaffold(
        appBar: AppBar(title: Text('My First App'),),
        body: _questionIndex < _questions.length 
        ? Quiz(answerQuestion: answerQuestion,questionIndex: _questionIndex,questions: _questions,) 
        : Result(_totalScore,_resetQuiz)

      ),);
  }
}