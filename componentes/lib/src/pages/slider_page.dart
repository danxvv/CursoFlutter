import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100;
  bool _blockcheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slides"),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              _createSlider(),
              _createCheck(),
              _createSwitch(),
              Expanded(child: _crearImagen())
            ],
          )),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamano imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_blockcheck)
          ? null
          : (valor) {
              //(CONDICION==TRUE) ? TRUE : FALSE
              _valorSlider = valor;
              setState(() {});
            },
    );
  }

  Widget _createCheck() {
    return CheckboxListTile(
      value: _blockcheck,
      title: Text('Bloquear Slider'),
      onChanged: (valor) {
        _blockcheck = valor;
        setState(() {});
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://www.purina.es/gato/purina-one/sites/g/files/mcldtz1856/files/2018-06/Como_saber_si_mi_gato_esta_enfermo%20%282%29.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

 Widget _createSwitch() {
   return SwitchListTile(
      value: _blockcheck,
      title: Text('Bloquear Slider'),
      onChanged: (valor) {
        _blockcheck = valor;
        setState(() {});
      },
    );
 }
}
