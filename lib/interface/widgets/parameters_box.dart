import 'package:flutter/material.dart';

class ParametersBox extends StatefulWidget {
  final String boxTitle;
  final List<Widget> parameterList;

  const ParametersBox({
    super.key,
    required this.boxTitle,
    required this.parameterList,
  });

  @override
  State<ParametersBox> createState() => _ParametersBoxState();
}

class _ParametersBoxState extends State<ParametersBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              widget.boxTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.deepOrange, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                for (final parameter in widget.parameterList) ...[
                  parameter,
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
