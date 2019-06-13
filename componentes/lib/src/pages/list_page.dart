import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoitem = 0;
  bool _isload = false;
  @override
  void initState() {
    super.initState();
    _add10im();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _add10im();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: <Widget>[_crearLista(), _crearLoad()],
        ));
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerpag,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/id/$index/500/300'),
            placeholder: AssetImage('assets/img/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> obtenerpag() async {
    final duracion = new Duration(seconds: 2);
    new Timer(duracion, () {
      _listaNumeros.clear();
      _ultimoitem++;
      _add10im();
    });
    return Future.delayed(duracion);
  }

  void _add10im() {
    for (var i = 1; i < 10; i++) {
      _ultimoitem++;
      _listaNumeros.add(_ultimoitem);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    _isload = true;
    setState(() {});
    final duracion = new Duration(seconds: 2);
    new Timer(duracion, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isload = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.bounceOut, duration: Duration(milliseconds: 250));
    _add10im();
  }

  Widget _crearLoad() {
    if (_isload) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
