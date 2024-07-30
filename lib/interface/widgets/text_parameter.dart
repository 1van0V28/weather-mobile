import 'package:flutter/material.dart';

class TextParameter extends StatefulWidget {
  final String parameterName;
  final dynamic parameter;
  final String parameterType;
  final Color parameterNameColor;
  final Color parameterColor;
  final double parameterSize;

  const TextParameter({
    super.key,
    required this.parameterName,
    required this.parameter,
    required this.parameterType,
    required this.parameterNameColor,
    required this.parameterColor,
    required this.parameterSize,
  });

  @override
  State<TextParameter> createState() => _TextParameterState();
}

class _TextParameterState extends State<TextParameter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Text(
            widget.parameterName,
            style: TextStyle(color: widget.parameterNameColor, fontSize: widget.parameterSize),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              '${widget.parameter} ${widget.parameterType}',
              style: TextStyle(
                color: widget.parameterColor,
                fontSize: widget.parameterSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
