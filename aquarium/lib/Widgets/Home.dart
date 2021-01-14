import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _ammoniaController;
  TextEditingController _calciumController;
  TextEditingController _carbonatesController;
  TextEditingController _phosphatesController;
  TextEditingController _magnesiumController;
  TextEditingController _nitratesController;
  TextEditingController _nitritesController;
  TextEditingController _potassiumController;
  TextEditingController _salinityController;
  TextEditingController _silicatesController;

  @override
  void initState() {
    _ammoniaController = TextEditingController();
    _calciumController = TextEditingController();
    _carbonatesController = TextEditingController();
    _phosphatesController = TextEditingController();
    _magnesiumController = TextEditingController();
    _nitratesController = TextEditingController();
    _nitritesController = TextEditingController();
    _potassiumController = TextEditingController();
    _salinityController = TextEditingController();
    _silicatesController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _ammoniaController.dispose();
    _calciumController.dispose();
    _carbonatesController.dispose();
    _phosphatesController.dispose();
    _magnesiumController.dispose();
    _nitratesController.dispose();
    _nitritesController.dispose();
    _potassiumController.dispose();
    _salinityController.dispose();
    _silicatesController.dispose();
    super.dispose();
  }

  @override
  Widget _buildErrorPage(String error) {
    return Center(
      child: Text(
        error,
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildHome(QuerySnapshot snapshot) {
    final docs = snapshot.docs;
    final aquarium = docs[0];
    final desiredvar = aquarium['DesiredVariables'];
    final lastvar = aquarium['LastVariables'];
    _ammoniaController.text = '${lastvar['Amoniaco']}';
    _calciumController.text = '${lastvar['Calcio']}';
    _carbonatesController.text = '${lastvar['Carbonatos']}';
    _phosphatesController.text = '${lastvar['Fosfatos']}';
    _magnesiumController.text = '${lastvar['Magnesio']}';
    _nitratesController.text = '${lastvar['Nitratos']}';
    _nitritesController.text = '${lastvar['Nitritos']}';
    _potassiumController.text = '${lastvar['Potasio']}';
    _salinityController.text = '${lastvar['Salinidad']}';
    _silicatesController.text = '${lastvar['Silicatos']}';

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(
              'Last Variables',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            LastVariables(
                ammoniaController: _ammoniaController,
                calciumController: _calciumController,
                carbonatesController: _carbonatesController,
                phosphatesController: _phosphatesController,
                magnesiumController: _magnesiumController,
                nitratesController: _nitratesController,
                nitritesController: _nitritesController,
                potassiumController: _potassiumController,
                salinityController: _salinityController,
                silicatesController: _silicatesController,
                aquarium: aquarium),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Desired Variables',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 60,
                  child: RaisedButton(
                    child: Text('Edit',
                        style: TextStyle(
                          fontSize: 11,
                        )),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            DesiredVariables(aquarium: aquarium),
            SizedBox(height: 30),
            Text(
              'Graph',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Image.asset('assets/images/graph.jpg'),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    final aquariums = FirebaseFirestore.instance.collection('Aquariums');
    return StreamBuilder(
      stream: aquariums.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorPage(snapshot.error.toString());
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return _buildLoading();
          case ConnectionState.active:
            return _buildHome(snapshot.data);
          default: // ConnectionState.none  // ConnectionState.done
            return _buildErrorPage("Unreachable!!!");
        }
      },
    );
  }
}

class LastVariables extends StatelessWidget {
  const LastVariables({
    Key key,
    @required TextEditingController ammoniaController,
    @required TextEditingController calciumController,
    @required TextEditingController carbonatesController,
    @required TextEditingController phosphatesController,
    @required TextEditingController magnesiumController,
    @required TextEditingController nitratesController,
    @required TextEditingController nitritesController,
    @required TextEditingController potassiumController,
    @required TextEditingController salinityController,
    @required TextEditingController silicatesController,
    @required this.aquarium,
  })  : _ammoniaController = ammoniaController,
        _calciumController = calciumController,
        _carbonatesController = carbonatesController,
        _phosphatesController = phosphatesController,
        _magnesiumController = magnesiumController,
        _nitratesController = nitratesController,
        _nitritesController = nitritesController,
        _potassiumController = potassiumController,
        _salinityController = salinityController,
        _silicatesController = silicatesController,
        super(key: key);

  final TextEditingController _ammoniaController;
  final TextEditingController _calciumController;
  final TextEditingController _carbonatesController;
  final TextEditingController _phosphatesController;
  final TextEditingController _magnesiumController;
  final TextEditingController _nitratesController;
  final TextEditingController _nitritesController;
  final TextEditingController _potassiumController;
  final TextEditingController _salinityController;
  final TextEditingController _silicatesController;
  final QueryDocumentSnapshot aquarium;

  @override
  Widget build(BuildContext context) {
    final aquariums = FirebaseFirestore.instance.collection('Aquariums');
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LastVarItem(
              ammoniaController: _ammoniaController,
              aquariums: aquariums,
              aquarium: aquarium,
              tag: 'NH3',
              variable: 'Amoniaco',
            ),
            SizedBox(width: 20),
            LastVarItem(
              ammoniaController: _calciumController,
              aquariums: aquariums,
              aquarium: aquarium,
              tag: 'Ca',
              variable: 'Calcio',
            ),
            SizedBox(width: 20),
            LastVarItem(
              ammoniaController: _carbonatesController,
              aquariums: aquariums,
              aquarium: aquarium,
              tag: 'KH',
              variable: 'Carbonatos',
            ),
            SizedBox(width: 20),
            LastVarItem(
              ammoniaController: _phosphatesController,
              aquariums: aquariums,
              aquarium: aquarium,
              tag: 'Phos.',
              variable: 'Fosfatos',
            ),
            SizedBox(width: 20),
            LastVarItem(
              ammoniaController: _magnesiumController,
              aquariums: aquariums,
              aquarium: aquarium,
              tag: 'Mg',
              variable: 'Magnesio',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LastVarItem(
              ammoniaController: _nitratesController,
              aquariums: aquariums,
              aquarium: aquarium,
              tag: 'NO3',
              variable: 'Nitratos',
            ),
            SizedBox(width: 20),
            LastVarItem(
              ammoniaController: _nitritesController,
              aquariums: aquariums,
              aquarium: aquarium,
              tag: 'NO2',
              variable: 'Nitritos',
            ),
            SizedBox(width: 20),
            LastVarItem(
              ammoniaController: _potassiumController,
              aquariums: aquariums,
              aquarium: aquarium,
              tag: 'K',
              variable: 'Potasio',
            ),
            SizedBox(width: 20),
            LastVarItem(
              ammoniaController: _salinityController,
              aquariums: aquariums,
              aquarium: aquarium,
              tag: 'Salin.',
              variable: 'Salinidad',
            ),
            SizedBox(width: 20),
            LastVarItem(
              ammoniaController: _silicatesController,
              aquariums: aquariums,
              aquarium: aquarium,
              tag: 'Sil.',
              variable: 'Silicatos',
            ),
          ],
        ),
      ],
    );
  }
}

class LastVarItem extends StatelessWidget {
  const LastVarItem({
    Key key,
    @required TextEditingController ammoniaController,
    @required this.aquariums,
    @required this.aquarium,
    @required this.tag,
    @required this.variable,
  })  : _ammoniaController = ammoniaController,
        super(key: key);

  final TextEditingController _ammoniaController;
  final CollectionReference aquariums;
  final QueryDocumentSnapshot aquarium;
  final String tag;
  final String variable;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          labelText: tag,
        ),
        controller: _ammoniaController,
        onChanged: (newValue) {
          aquariums
              .doc(aquarium.id)
              .update({'LastVariables.$variable': num.parse(newValue)});
        },
      ),
    );
  }
}

class DesiredVariables extends StatelessWidget {
  const DesiredVariables({
    Key key,
    @required this.aquarium,
  }) : super(key: key);

  final QueryDocumentSnapshot aquarium;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DesiredVarItem(
              aquarium: aquarium,
              variable: 'Amoniaco',
              variableName: 'NH3',
            ),
            DesiredVarItem(
              aquarium: aquarium,
              variable: 'Calcio',
              variableName: 'Ca',
            ),
            DesiredVarItem(
              aquarium: aquarium,
              variable: 'Carbonatos',
              variableName: 'KH',
            ),
            DesiredVarItem(
              aquarium: aquarium,
              variable: 'Fosfatos',
              variableName: 'Phos.',
            ),
            DesiredVarItem(
              aquarium: aquarium,
              variable: 'Magnesio',
              variableName: 'Mg',
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DesiredVarItem(
              aquarium: aquarium,
              variable: 'Nitritos',
              variableName: 'NO3',
            ),
            DesiredVarItem(
              aquarium: aquarium,
              variable: 'Nitratos',
              variableName: 'NO2',
            ),
            DesiredVarItem(
              aquarium: aquarium,
              variable: 'Potasio',
              variableName: 'K',
            ),
            DesiredVarItem(
              aquarium: aquarium,
              variable: 'Salinidad',
              variableName: 'Salin.',
            ),
            DesiredVarItem(
              aquarium: aquarium,
              variable: 'Silicatos',
              variableName: 'Sil.',
            ),
          ],
        ),
      ],
    );
  }
}

class DesiredVarItem extends StatelessWidget {
  const DesiredVarItem({
    Key key,
    @required this.aquarium,
    @required this.variable,
    @required this.variableName,
  }) : super(key: key);

  final QueryDocumentSnapshot aquarium;
  final String variable;
  final String variableName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          variableName,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(" ${aquarium['DesiredVariables'][variable]}"),
      ],
    );
  }
}

class LastVariablesText extends StatelessWidget {
  const LastVariablesText({
    Key key,
    @required this.aquarium,
  }) : super(key: key);

  final QueryDocumentSnapshot aquarium;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LastVarTextItem(
              aquarium: aquarium,
              variable: 'Amoniaco',
              variableName: 'NH3',
            ),
            LastVarTextItem(
              aquarium: aquarium,
              variable: 'Calcio',
              variableName: 'Ca',
            ),
            LastVarTextItem(
              aquarium: aquarium,
              variable: 'Carbonatos',
              variableName: 'KH',
            ),
            LastVarTextItem(
              aquarium: aquarium,
              variable: 'Fosfatos',
              variableName: 'Phos.',
            ),
            LastVarTextItem(
              aquarium: aquarium,
              variable: 'Magnesio',
              variableName: 'Mg',
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LastVarTextItem(
              aquarium: aquarium,
              variable: 'Nitritos',
              variableName: 'NO3',
            ),
            LastVarTextItem(
              aquarium: aquarium,
              variable: 'Nitratos',
              variableName: 'NO2',
            ),
            LastVarTextItem(
              aquarium: aquarium,
              variable: 'Potasio',
              variableName: 'K',
            ),
            LastVarTextItem(
              aquarium: aquarium,
              variable: 'Salinidad',
              variableName: 'Salin.',
            ),
            LastVarTextItem(
              aquarium: aquarium,
              variable: 'Silicatos',
              variableName: 'Sil.',
            ),
          ],
        ),
      ],
    );
  }
}

class LastVarTextItem extends StatelessWidget {
  const LastVarTextItem({
    Key key,
    @required this.aquarium,
    @required this.variable,
    @required this.variableName,
  }) : super(key: key);

  final QueryDocumentSnapshot aquarium;
  final String variable;
  final String variableName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          variableName,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(" ${aquarium['LastVariables'][variable]}"),
      ],
    );
  }
}
