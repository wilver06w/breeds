part of 'package:breeds/src/features/cart/_childrens/home/page.dart';

class ItemResumCart extends StatelessWidget {
  const ItemResumCart({
    super.key,
    required this.left,
    required this.right,
  });

  final String left;
  final String right;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        XigoTextMedium(
          left,
          weight: FontWeight.w300,
        ),
        XigoTextMedium(
          right,
          weight: FontWeight.w300,
        ),
      ],
    );
  }
}
