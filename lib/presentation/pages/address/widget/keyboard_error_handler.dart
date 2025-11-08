// import 'package:flutter/material.dart';

// class KeyboardErrorHandler extends StatefulWidget {
//   final Widget child;

//   const KeyboardErrorHandler({super.key, required this.child});

//   @override
//   State<KeyboardErrorHandler> createState() => _KeyboardErrorHandlerState();
// }

// class _KeyboardErrorHandlerState extends State<KeyboardErrorHandler> {
//   final FocusNode _focusNode = FocusNode();

//   @override
//   Widget build(BuildContext context) {
//     return Focus(
//       focusNode: _focusNode,
//       canRequestFocus: false,
//       // ignore: deprecated_member_use
//       onKey: (FocusNode node, RawKeyEvent event) {
//         // This can help prevent the keyboard assertion errors
//         return KeyEventResult.skipRemainingHandlers;
//       },
//       child: widget.child,
//     );
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }
// }
