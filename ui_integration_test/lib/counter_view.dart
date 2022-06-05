import 'package:flutter/material.dart';
import 'package:ui_integration_test/page_objects/counter_objects.dart';

class CounterView extends StatefulWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int _counter = 0;
  final TextEditingController _textEditingController = TextEditingController();

  void _updateCounter(){
    setState((){
      ++_counter;
    });
  }

  void _updateCounterWithTextField(int value){
    setState((){
      _counter = value;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('Result : ${_counter}',
            style: Theme.of(context).textTheme.headline3,),
          TextField(
            key: CounterObjects.textFieldKey,
            controller: _textEditingController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          Semantics( // Assigning a key to a button for testing : Semantic
          button: true,
            label : CounterObjects.buttonUpdate,
            child: TextButton(
                onPressed: (){
                  _updateCounterWithTextField(int.tryParse(_textEditingController.text) ?? 0);
                },
                child: Text('Update with Textbutton')),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: CounterObjects.buttonToolTip,
        onPressed: (){_updateCounter;},
        child: Icon(Icons.plus_one),
      ),
    );
  }
}
