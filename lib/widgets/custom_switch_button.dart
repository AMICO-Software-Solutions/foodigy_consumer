
import 'package:flutter/material.dart';
import 'package:foodigy/utilities/const_color.dart';

class SwitchButton extends StatefulWidget {
  final bool value;
  final Function(bool) onChanged;
  final double scale;
  const SwitchButton({Key? key, required this.value, required this.onChanged, required this.scale}) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: widget.scale,
      child: Switch.adaptive(
        //thumbColor: MaterialStateProperty.all(Colors.red),
        //trackColor: MaterialStateProperty.all(Colors.orange),

        activeColor: firstColor,
        activeTrackColor: firstColor.withOpacity(0.4),
        // inactiveThumbColor: Colors.orange,
        // inactiveTrackColor: Colors.black87,
        splashRadius: 100,
        value: widget.value,
        onChanged: widget.onChanged
      ),
    );
  }
}
