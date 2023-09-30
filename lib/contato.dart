// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Contato {
  final int? id;
  final String nome;
  final String telefone;

  Contato({this.id, required this.nome, required this.telefone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
    };
  }

  Container contatoFav() {
    return Container(
      width: 109,
      height: 40,
      child: Stack(
        children: [
          Positioned(
            left: 43,
            top: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nome,
                  style: TextStyle(
                    color: Color(0xFF545F71),
                    fontSize: 15,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  telefone,
                  style: TextStyle(
                    color: Color(0xFF545F71),
                    fontSize: 12,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  nome[0].toUpperCase(),
                  style: TextStyle(
                    color: Color(0xFF7C7C7C),
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container contatoWidget() {
    return Container(
      width: 341,
      height: 45,
      child: Stack(
        children: [
          Container(
            width: 341,
            height: 45,
            decoration: BoxDecoration(
              color: Color(0x7FD9D9D9),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 49,
                  top: 6,
                  child: Text(
                    nome,
                    style: TextStyle(
                      color: Color(0xFF545F71),
                      fontSize: 16,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Positioned(
                  left: 49,
                  top: 24,
                  child: Text(
                    telefone,
                    style: TextStyle(
                      color: Color(0xFF545F71),
                      fontSize: 12,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      nome[0].toUpperCase(),
                      style: TextStyle(
                        color: Color(0xFF7C7C7C),
                        fontSize: 32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 302,
                  top: 9,
                  child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(),
                      child: GestureDetector(
                        child: Icon(Icons.phone, color: Color.fromARGB(255, 84, 95, 113)),
                        onTap: () {
                          
                        },
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
