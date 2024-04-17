import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

const themeColor = Colors.blueGrey;

class ClickableWidget extends StatefulWidget {
  final double? onPressZoomPer;
  final Widget widget;

  final Callback onTap;

  final Callback? onTapDown;

  const ClickableWidget({
    super.key,
    required this.widget,
    required this.onTap,
    this.onPressZoomPer,
    this.onTapDown,
  });

  @override
  State<ClickableWidget> createState() => _ClickableWidgetState();
}

class _ClickableWidgetState extends State<ClickableWidget> {
  bool beingPressed = false;
  Future<void> _tapDown(TapDownDetails details) async {
    HapticFeedback.mediumImpact();

    widget.onTapDown?.call();
    // Get.find<SoundController>().clickSound();
    setState(() {
      beingPressed = true;
    });
  }

  void _tapUp(TapUpDetails details) {
    HapticFeedback.mediumImpact();

    setState(() {
      beingPressed = false;

      // Future.delayed(const Duration(milliseconds: 350), () {
      widget.onTap.call();
      // });
    });

    // Future.delayed(const Duration(milliseconds: 100), () {
    //   widget.onTap.call();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onDoubleTap: () {
      //   widget.onTap.call();
      // },

      onTapDown: _tapDown,
      onTapUp: _tapUp,

      // onTap: () {
      //   setState(() {
      //     _toggle = !_toggle;
      //   });
      // },
      child: widget.widget.animate(target: beingPressed ? 1 : 0).scale(
              end: Offset(
            widget.onPressZoomPer != null
                ? (1.0 + (0.01 * widget.onPressZoomPer!))
                : 0.95,
            widget.onPressZoomPer != null
                ? (1.0 + (0.01 * widget.onPressZoomPer!))
                : 0.95,
          )),
    );
  }
}

class MyCustomButton extends StatefulWidget {
  final Icon? icon;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final bool isFilled;
  final Callback? onTap;

  final Callback? onTapDown;
  final double? width;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;

  final double? fontSize;
  final Color? textColor;

  final String text;
  const MyCustomButton(
      {super.key,
      this.onTap,
      this.isFilled = true,
      this.width,
      this.color,
      required this.text,
      this.borderRadius,
      this.padding,
      this.borderColor,
      this.fontWeight,
      this.fontFamily,
      this.icon,
      this.fontSize,
      this.textColor,
      this.onTapDown});

  @override
  State<MyCustomButton> createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  bool beingPressed = false;
  Future<void> _tapDown(TapDownDetails details) async {
    HapticFeedback.mediumImpact();
    widget.onTapDown?.call();
    // Get.find<SoundController>().clickSound();

    setState(() {
      beingPressed = true;
    });
  }

  void _tapUp(TapUpDetails details) {
    HapticFeedback.mediumImpact();

    setState(() {
      beingPressed = false;

      // Future.delayed(const Duration(milliseconds: 350), () {
      widget.onTap?.call();
      // });
    });

    // Future.delayed(const Duration(milliseconds: 0), () {
    //   widget.onTap?.call();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,

      // onTap: () {
      //   setState(() {
      //     _toggle = !_toggle;
      //   });
      // },
      child: (widget.isFilled
              ? Container(
                  width: widget.width,
                  decoration: BoxDecoration(
                    border: widget.borderColor != null
                        ? Border.all(color: widget.borderColor!)
                        : null,
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(1),
                    color: widget.color ?? themeColor,
                    // gradient: widget.color == null
                    //     ? const LinearGradient(
                    //         colors: [
                    //           Color(0xffFF003D),
                    //           Color(0xffFF5656),
                    //         ],
                    //       )
                    //     : null,
                    // boxShadow: [
                    //   BoxShadow(
                    //       offset: const Offset(0, 5),
                    //       color: Colors.red.shade50,
                    //       blurRadius: 10)
                    // ],
                  ),
                  // width: 200,
                  child: Center(
                    child: Padding(
                      padding: widget.padding ??
                          const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                      child: Text(
                        widget.text,
                        style: TextStyle(
                            color: widget.textColor ?? Colors.white,
                            fontSize: widget.fontSize,
                            fontFamily: widget.fontFamily,
                            fontWeight: widget.fontWeight ?? FontWeight.normal),
                      ),
                    ),
                  ),
                )
              : Container(
                  width: widget.width,
                  decoration: BoxDecoration(
                      borderRadius:
                          widget.borderRadius ?? BorderRadius.circular(1),
                      border: Border.all(
                          color: widget.borderColor ??
                              (widget.color ?? themeColor)),
                      color: Colors.white),
                  child: Center(
                    child: Padding(
                      padding: widget.padding ??
                          const EdgeInsets.symmetric(
                              horizontal: 40 - 2, vertical: 12 - 2),
                      child: widget.icon != null
                          ? Row(
                              children: [
                                widget.icon!,
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  widget.text,
                                  style: TextStyle(
                                      color: widget.textColor ?? widget.color,
                                      fontSize: widget.fontSize,
                                      fontFamily: widget.fontFamily,
                                      fontWeight: widget.fontWeight ??
                                          FontWeight.normal),
                                ),
                              ],
                            )
                          : Text(
                              widget.text,
                              style: TextStyle(
                                  color: widget.textColor ??
                                      widget.color ??
                                      themeColor,
                                  fontSize: widget.fontSize,
                                  fontWeight:
                                      widget.fontWeight ?? FontWeight.normal),
                            ),
                    ),
                  ),
                ))
          .animate(target: beingPressed ? 1 : 0)
          .scale(
            end: const Offset(0.8, 0.8),
          ),
    );
  }
}
