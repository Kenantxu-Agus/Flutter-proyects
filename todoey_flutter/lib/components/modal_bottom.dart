import 'package:flutter/material.dart';

class AddBottom extends StatefulWidget {
  VoidCallback onPressed;
  ValueChanged<String> onChanged;
  AddBottom({Key? key, required this.onPressed, required this.onChanged})
      : super(key: key);

  @override
  _AddBottomState createState() => _AddBottomState();
}

class _AddBottomState extends State<AddBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.lightBlueAccent,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: widget.onChanged,
          ),
          TextButton(
            onPressed: widget.onPressed,
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent)),
            child: const Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
