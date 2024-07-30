import 'package:flutter/material.dart';

class IconParameter extends StatefulWidget {
  final IconData weatherIcon;
  final dynamic parameter;
  final String parameterType;
  final Color iconColor;
  final Color parameterColor;
  final double parameterSize;

  const IconParameter({
    super.key,
    required this.weatherIcon,
    required this.parameter,
    required this.parameterType,
    required this.iconColor,
    required this.parameterColor,
    required this.parameterSize,
  });

  @override
  State<IconParameter> createState() => _ParameterState();
}

class _ParameterState extends State<IconParameter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Icon(
            widget.weatherIcon,
            color: widget.iconColor,
            size: widget.parameterSize,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 10),
            child: Text(
              '${widget.parameter} ${widget.parameterType}',
              style: TextStyle(
                color: widget.parameterColor,
                fontSize: widget.parameterSize - 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
