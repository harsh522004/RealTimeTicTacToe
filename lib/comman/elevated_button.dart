import 'package:flutter/material.dart';
import 'package:socketex/responsive/responsive.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.child});
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Responsive(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(elevation: 10),
      onPressed: onTap,
      child: child,
    ).w(context.screenWidth * 0.5).h(50));
  }
}
