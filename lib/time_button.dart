import 'package:flutter/material.dart';

class TimeButton extends StatelessWidget {
  final int time;
  final void Function(int)? onPressed;

  const TimeButton({
    super.key,
    required this.time,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: const Color(0xffF4F4F6),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              onPressed?.call(time);
            },
            child: Text(
              "$time",
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontFamily: "Syne",
                fontSize: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
