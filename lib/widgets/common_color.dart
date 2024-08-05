// import '../config.dart';
//
// LinearGradient gradientColor(BuildContext context,
//     {AlignmentGeometry? begin, AlignmentGeometry? end}) {
//   return LinearGradient(
//       colors: [
//         appColor(context).appTheme.primary,
//         appColor(context).appTheme.gradient,
//       ],
//       begin: begin ?? Alignment.bottomCenter,
//       end: end ?? Alignment.topCenter,
//       stops: const [0.0, 15.0],
//       tileMode: TileMode.decal);
// }
//
// ShapeDecoration receiverBox(context) => ShapeDecoration(
//     gradient: LinearGradient(colors: [
//       appColor(context).appTheme.lightText.withOpacity(0.1),
//       appColor(context).appTheme.lightText.withOpacity(0.1)
//     ]),
//     shape: SmoothRectangleBorder(
//         borderRadius:
//         SmoothBorderRadius(cornerRadius: 10, cornerSmoothing: 1)));
//
// RadialGradient radialGradient(BuildContext context) {
//   return RadialGradient(colors: [
//     appColor(context).appTheme.primary,
//     appColor(context).appTheme.gradient,
//   ]);
// }
//
// LinearGradient gradientColorChange(BuildContext context,
//     {AlignmentGeometry? begin,
//       AlignmentGeometry? end,
//       Color? firstColor,
//       Color? secColor}) {
//   return LinearGradient(
//       colors: [
//         firstColor ?? appColor(context).appTheme.trans,
//         secColor ?? appColor(context).appTheme.trans,
//       ],
//       begin: begin ?? Alignment.bottomCenter,
//       end: end ?? Alignment.topCenter,
//       stops: const [0.0, 15.0],
//       tileMode: TileMode.decal);
// }
