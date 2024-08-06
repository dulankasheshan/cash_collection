// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
//
// class ReceiptScanScreen extends StatefulWidget {
//   const ReceiptScanScreen({super.key});
//
//   @override
//   State<ReceiptScanScreen> createState() => _ReceiptScanScreenState();
// }
//
// class _ReceiptScanScreenState extends State<ReceiptScanScreen> {
//   final ImagePicker _picker = ImagePicker();
//
//   Future<void> _getImage() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.camera);
//     if (image != null) {
//       Provider.of<ImageProvider>(context, listen: false).setImagePath(image.path);
//       Navigator.of(context).pop();
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _getImage();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Receipt Scan'),
//       ),
//       body: const Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
