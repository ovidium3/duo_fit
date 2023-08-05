import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

// Not implemented fully yet, currently appears in a disabled state
// Rest timer that can be activated either on tapping or on set completion
class RestTimerPopup extends StatefulWidget {
  final ValueNotifier<int> timerValueNotifier;
  final Function(int) onTimerChanged;

  const RestTimerPopup({
    required this.timerValueNotifier,
    required this.onTimerChanged,
    super.key,
  });

  @override
  RestTimerPopupState createState() => RestTimerPopupState();
}

class RestTimerPopupState extends State<RestTimerPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Rest Timer'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('+10s'),
            onTap: () {
              widget.onTimerChanged(widget.timerValueNotifier.value + 10);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('-10s'),
            onTap: () {
              widget.onTimerChanged(widget.timerValueNotifier.value - 10);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Skip'),
            onTap: () {
              widget.onTimerChanged(-1);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class RestTimerButton extends StatefulWidget {
  final String title;
  final IconData disabledIcon;
  final bool isEnabled;
  final Function(int) onTimerChanged;

  const RestTimerButton({
    this.title = 'Timer',
    this.disabledIcon = Icons.timer,
    this.isEnabled = true,
    required this.onTimerChanged,
    super.key,
  });

  @override
  RestTimerButtonState createState() => RestTimerButtonState();
}

class RestTimerButtonState extends State<RestTimerButton> {
  late ValueNotifier<int> timerValueNotifier;

  @override
  void initState() {
    super.initState();
    timerValueNotifier = ValueNotifier(0);
  }

  @override
  void dispose() {
    timerValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
        color: widget.isEnabled
            ? ColorConstants.primaryColor
            : ColorConstants.disabled,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: ColorConstants.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            widget.isEnabled
                ? showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return RestTimerPopup(
                        timerValueNotifier: timerValueNotifier,
                        onTimerChanged: (value) {
                          timerValueNotifier.value = value;
                          widget.onTimerChanged(value);
                        },
                      );
                    },
                  )
                : null;
          },
          child: Center(
            child: ValueListenableBuilder<int>(
              valueListenable: timerValueNotifier,
              builder: (context, value, child) {
                if (widget.isEnabled) {
                  return Text(
                    '${widget.title}: $value',
                    style: const TextStyle(
                      color: ColorConstants.textWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else {
                  return Icon(
                    widget.disabledIcon,
                    color: ColorConstants.textWhite,
                    size: 24,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
