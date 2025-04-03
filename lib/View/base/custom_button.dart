
import 'package:flutter/material.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton({super.key, required this.text, this.onPressed});
//   final String text;
//   final Function()? onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Color(0xffE65D00),
//         minimumSize: Size(Get.width, 56),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }

class CustomButton extends StatelessWidget {
  final String label;
  final Color? color;
  final VoidCallback onTap;

  const CustomButton({super.key, required this.label, this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:color?? Color(0xffE65D00),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}