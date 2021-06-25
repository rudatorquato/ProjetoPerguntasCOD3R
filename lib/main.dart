import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  //final _perguntaSelecionada = 0;
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'pergunta qualquer 1',
      'respostas': [
        {'texto': 'resposta qualquer 1', 'pontuacao': 10},
        {'texto': 'resposta qualquer 2', 'pontuacao': 5},
        {'texto': 'resposta qualquer 3', 'pontuacao': 3},
        {'texto': 'resposta qualquer 4', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'pergunta qualquer 2',
      'respostas': [
        {'texto': 'resposta qualquer 1', 'pontuacao': 10},
        {'texto': 'resposta qualquer 2', 'pontuacao': 5},
        {'texto': 'resposta qualquer 3', 'pontuacao': 3},
        {'texto': 'resposta qualquer 4', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'pergunta qualquer 3',
      'respostas': [
        {'texto': 'resposta qualquer 1', 'pontuacao': 10},
        {'texto': 'resposta qualquer 2', 'pontuacao': 5},
        {'texto': 'resposta qualquer 3', 'pontuacao': 3},
        {'texto': 'resposta qualquer 4', 'pontuacao': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(
                pontuacao: _pontuacaoTotal,
                quandoReiniciarQuestionario: _reiniciarQuestionario,
              ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
