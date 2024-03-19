part of 'package:breeds/src/features/detail/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        const Gap(ProTiendaSpacing.md),
        const BodySeparated(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XigoTextHeading4(
                ProTiendasUiValues.amazon,
                color: Colors.black,
                weight: FontWeight.w600,
              ),
              Gap(ProTiendaSpacing.md),
            ],
          ),
        ),
        ImagenWidget(
          image:
              'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=360&t=st=1707431887~exp=1707432487~hmac=4f842955cc47805a82701a1de5cce2c5c3ce945c432ee45d645aeaa38e85eb98',
          height: YuGiOhResponsive.heightSizeByContext(
            context,
            pixels: size.height * 0.3,
          ),
          width: YuGiOhResponsive.withSizeByContext(
            context,
            pixels: size.width * 0.3,
          ),
        ),
        BodySeparated(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(ProTiendaSpacing.md),
              const XigoTextHeading6(
                '\$3.000.000',
                color: ProTiendasUiColors.crayolaGreen,
                weight: FontWeight.w600,
              ),
              const Gap(ProTiendaSpacing.sm),
              XigoTextHeading6(
                ProTiendasUiValues.sendFree,
                color: ProTiendasUiColors.secondaryColor,
                weight: FontWeight.w600,
              ),
              const Gap(ProTiendaSpacing.sm),
              const Row(
                children: [
                  ItemDescription(
                    title: 'Capacidad:',
                    description: '64 GB',
                  ),
                  Gap(ProTiendaSpacing.xxl),
                  ItemVaration(
                    title: '64 GB',
                    isSelected: true,
                  ),
                  Gap(ProTiendaSpacing.sm),
                  ItemVaration(
                    title: '128 GB',
                  ),
                  Gap(ProTiendaSpacing.sm),
                  ItemVaration(
                    title: '256 GB',
                  ),
                ],
              ),
              const Gap(ProTiendaSpacing.sm),
              const ItemDescription(
                title: 'Color:',
                description: 'Gris',
              ),
              const Gap(ProTiendaSpacing.sl),
              SizedBox(
                height: 270,
                child: BlocBuilder<BlocDetail, DetailState>(
                  builder: (context, state) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: ProTiendaSpacing.xxs,
                          ),
                          margin:
                              const EdgeInsets.only(left: ProTiendaSpacing.sl),
                          child: CardProductVertical(
                            id: (index + 40),
                            priceBefore: '\$480.000',
                            price: '\$450.000',
                            desct: '10% Dto',
                            image:
                                'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=360&t=st=1707431887~exp=1707432487~hmac=4f842955cc47805a82701a1de5cce2c5c3ce945c432ee45d645aeaa38e85eb98',
                            title:
                                '${ProTiendasUiValues.balonFutbol} ${(index + 40)}',
                            isFreeSend: true,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const Gap(ProTiendaSpacing.md),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: ProTiendaSpacing.md),
          child: XigoBtnPrimary(
            label: ProTiendasUiValues.buyNow,
            backgroundColor: ProTiendasUiColors.secondaryColor,
            btnSize: XigoBtnSize.big,
            labelColor: ProTiendasUiColors.primaryColor,
            onTap: () {
              showToast(
                ProTiendasUiValues.completeTheData,
                backgroundColor: ProTiendasUiColors.rybBlue,
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
        const Gap(ProTiendaSpacing.sm),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: ProTiendaSpacing.md),
          child: XigoBtnOutline(
            label: ProTiendasUiValues.addCart,
            borderColor: ProTiendasUiColors.secondaryColor,
            labelColor: ProTiendasUiColors.secondaryColor,
            btnSize: XigoBtnSize.big,
            onTap: () {},
          ),
        ),
        BodySeparated(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(ProTiendaSpacing.sm),
            TitleSections(
              title: ProTiendasUiValues.characteristics,
            ),
            const Gap(ProTiendaSpacing.xs),
            const XigoTextLarge(
              'Pantalla Super Retina XDR de 6,1" \nCeramic Shield 4 veces más resistente a las caídas.\nCámara que graba en Dolby Vision\nCapacidad de 64GB',
              weight: FontWeight.w300,
            ),
            const Gap(ProTiendaSpacing.md),
            TitleSections(
              title: ProTiendasUiValues.productSummary,
            ),
            const Gap(ProTiendaSpacing.xs),
            const XigoTextLarge(
              'Descubre el Iphone 12 pro 64GB Gris. Lleva su poder más allá con el chip A14 Bionic y aprovecha toda su potencia. Disfruta de una pantalla OLED de borde a borde y gracias al Ceramic Shield es cuatro veces más resistente a las caídas. Además, ahora el modo Noche viene en todas las cámaras. El iPhone 12 es un equipo que lo tiene todo. ¡Encuentra el Iphone ideal para ti acá!',
              weight: FontWeight.w300,
            ),
            const Gap(ProTiendaSpacing.md),
            TitleSections(
              title: ProTiendasUiValues.productDescription,
            ),
            const Gap(ProTiendaSpacing.xs),
            const XigoTextLarge(
              'Fotografía profesional en tu bolsilloDescubre infinitas posibilidades para tus fotos con las 3 cámaras principales de tu equipo. Pon a prueba tu creatividad y juega con la iluminación, diferentes planos y efectos para obtener grandes resultados.Perfecta para los amantes del plano detalle. Su zoom óptico te ofrecerá la posibilidad de realizar acercamientos sin que tus capturas pierdan calidad.Capacidad y eficienciaCon su potente procesador y memoria RAM de 6 GB tu equipo alcanzará un alto rendimiento con gran velocidad de transmisión de contenidos y ejecutará múltiples aplicaciones a la vez sin demoras.Reconocimiento facial para mayor seguridadAcerca el dispositivo a tu rostro para desbloquearlo instantáneamente. Su precisa tecnología de reconocimiento facial te garantiza un acceso al equipo rápido y seguro.Batería para todo el díaSu batería de 2815 mAh se adapta a tu ritmo de vida y te garantiza energía para toda una jornada con una sola carga.',
              weight: FontWeight.w300,
            ),
            const Gap(ProTiendaSpacing.md),
          ],
        )),
        Container(
          color: ProTiendasUiColors.cultured,
          child: Padding(
            padding: const EdgeInsets.all(ProTiendaSpacing.xl),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ProTiendasUiColors.white,
                border: Border.all(
                  color: ProTiendasUiColors.lightSilver,
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: ProTiendaSpacing.md,
                vertical: ProTiendaSpacing.xs,
              ).copyWith(bottom: ProTiendaSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XigoTextLarge(
                    ProTiendasUiValues.mayInterest,
                    weight: FontWeight.bold,
                    color: ProTiendasUiColors.primaryColor,
                  ),
                  const Gap(ProTiendaSpacing.md),
                  ...List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: ProTiendaSpacing.sl,
                        vertical: ProTiendaSpacing.sm,
                      ),
                      child: CardProductHorizontal(
                        priceBefore: '\$480.000',
                        price: '\$450.000',
                        desct: '10% Dto',
                        image:
                            'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=360&t=st=1707431887~exp=1707432487~hmac=4f842955cc47805a82701a1de5cce2c5c3ce945c432ee45d645aeaa38e85eb98',
                        title:
                            'Smart Watch paraAndroid/iOS ${((index + 100))}',
                        isFreeSend: true,
                        widthImage: 100,
                        id: (index + 100),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        BodySeparated(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(ProTiendaSpacing.md),
            TitleSections(
              title: ProTiendasUiValues.opinions,
            ),
            const Gap(ProTiendaSpacing.xs),
            ...List.generate(
              5,
              (index) => ItemQualification(
                userName: 'Martha Martinez',
                descriptionQualification: 'Excelente Producto',
                date: '06/01/2024',
                qualification: index,
              ),
            ),
            const Gap(ProTiendaSpacing.md),
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(ProTiendaSpacing.md),
          child: XigoBtnPrimary(
            label: ProTiendasUiValues.leaveOpinion,
            backgroundColor: ProTiendasUiColors.secondaryColor,
            btnSize: XigoBtnSize.big,
            labelColor: ProTiendasUiColors.white,
            onTap: () {
              showToast(
                ProTiendasUiValues.completeTheData,
                backgroundColor: ProTiendasUiColors.rybBlue,
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class BodySeparated extends StatelessWidget {
  const BodySeparated({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ProTiendaSpacing.md,
      ),
      child: body,
    );
  }
}

class ItemQualification extends StatelessWidget {
  const ItemQualification({
    super.key,
    this.imagen = '',
    required this.qualification,
    required this.userName,
    required this.descriptionQualification,
    required this.date,
  });

  final String imagen;
  final int qualification;
  final String userName;
  final String descriptionQualification;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: ProTiendaSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              imagen.isEmpty
                  ? Image.asset(
                      ProTiendasUiValues.icOpinions,
                      height: 44,
                      width: 44,
                    )
                  : Image.network(
                      imagen,
                      height: 44,
                      width: 44,
                    ),
              const Gap(ProTiendaSpacing.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XigoTextLarge(
                    userName,
                    weight: FontWeight.w600,
                    color: ProTiendasUiColors.primaryColor,
                  ),
                  const Gap(ProTiendaSpacing.xs),
                  XigoTextLarge(
                    descriptionQualification,
                    weight: FontWeight.w300,
                    color: ProTiendasUiColors.black,
                  ),
                  const Gap(ProTiendaSpacing.xs),
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: ProTiendaSpacing.xxs,
                          ),
                          child: index > qualification - 1
                              ? SvgPicture.asset(
                                  ProTiendasUiValues.starEmpty,
                                  height: 13,
                                )
                              : SvgPicture.asset(
                                  ProTiendasUiValues.starFilled,
                                  height: 13,
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          XigoTextLarge(
            date,
            weight: FontWeight.w200,
            color: ProTiendasUiColors.black,
          ),
        ],
      ),
    );
  }
}

class ItemVaration extends StatelessWidget {
  const ItemVaration({
    super.key,
    required this.title,
    this.isSelected = false,
  });

  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? ProTiendasUiColors.aeroBlue : null,
        border: Border.all(
          color: isSelected
              ? ProTiendasUiColors.secondaryColor
              : ProTiendasUiColors.lightSilver,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: ProTiendaSpacing.xs,
        horizontal: ProTiendaSpacing.sm,
      ),
      child: XigoTextMedium(
        title,
        color: ProTiendasUiColors.black,
        weight: FontWeight.bold,
      ),
    );
  }
}
