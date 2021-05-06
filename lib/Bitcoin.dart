import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Bitcoin extends StatefulWidget {
  @override
  _BitcoinState createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {

  String _precoBitcoin="0,00";

  void _recuparPrecoBitcoin() async {
    String url = "https://blockchain.info/ticker";
    http.Response respostaEnderecoURL = await http.get(url);

    Map<String, dynamic> retornoDados = json.decode(respostaEnderecoURL.body);
    setState(() {
      _precoBitcoin = retornoDados["BRL"]["buy"].toString();
    });

    print("Resultado ${retornoDados["BRL"]["buy"].toString()}");

  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        //backgroundColor: Colors.tealAccent,

        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(

                children: <Widget>[
                  Image.asset("imagens/bitcoin.png"),

                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: <Widget>[
                          Text("R\$ ${_precoBitcoin}",
                              style: TextStyle(
                                //color: Colors.white,
                                fontSize: 25,
                                //backgroundColor: Colors.orange,
                              )
                          ),

                        ]
                    ),
                  ),

                  RaisedButton(
                    color: Colors.orange,
                    padding: EdgeInsets.fromLTRB(25, 15, 25, 15),

                    child: Text("Atualizar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        //backgroundColor: Colors.orange,
                      )
                    ),

                    onPressed: _recuparPrecoBitcoin,

                  ),

                ],

              ),
            ),

          ),

        ),




      );
  }
}
