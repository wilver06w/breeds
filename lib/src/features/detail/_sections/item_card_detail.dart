part of 'package:breeds/src/features/detail/page.dart';

class ItemDetailCard extends StatelessWidget {
  const ItemDetailCard({
    super.key,
    required this.title,
    required this.desc,
  });

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        ProTiendaSpacing.sm,
      ),
      margin: const EdgeInsets.only(bottom: ProTiendaSpacing.xs),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          XigoText.labelText(
            label: title,
            color: Colors.white,
            textStyle: GoogleFonts.lato(),
          ),
          const Gap(ProTiendaSpacing.xs),
          XigoText.small(
            label: desc,
            color: Colors.white,
            textOverflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
