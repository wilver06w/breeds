import 'package:breeds_widget/app/widget/app_bar_global.dart';
import 'package:breeds_widget/app/widget/button/btn.dart';
import 'package:breeds_widget/app/widget/container_circle_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:breeds/src/features/addresses/add/bloc/bloc.dart';
import 'package:breeds/src/features/addresses/add/repository.dart';
import 'package:network_breeds/app/network/http_client.dart'
    hide ModularWatchExtension;
import 'package:l10n_breeds/app/breeds_ui.dart';
import 'package:models_breeds/app/models/data_citys.dart';
import 'package:models_breeds/app/models/data_departament.dart';
import 'package:utils_breeds/utils/config/client_config.dart';
import 'package:utils_breeds/utils/constant/colors.dart';
import 'package:utils_breeds/utils/constant/navigation.dart';
import 'package:utils_breeds/utils/constant/spacing.dart';
import 'package:utils_breeds/utils/helpers/input/input.dart';
import 'package:utils_breeds/utils/helpers/text/text.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return BlocProvider(
      create: (context) => BlocAddAddress(
        repository: Repository(
          yuGiOhHttpClient: Modular.get<XigoHttpClient>(),
        ),
      )..add(LoadDeapartamentEvent()),
      child: BlocListener<BlocAddAddress, AddAddressState>(
        listener: (context, state) {
          if (state is ChangedDepartamentSelectedState) {
            context.read<BlocAddAddress>().add(LoadCityEvent());
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarGlobal(
            onTapIcon: () {
              Modular.to.pop();
            },
            haveSearch: false,
            havCart: false,
            title: BreedUiValues.delivery,
          ),
          body: ListView(
            padding: const EdgeInsets.all(ProTiendaSpacing.lg),
            children: [
              XigoTextHeading6(
                BreedUiValues.shippingAddress,
                weight: FontWeight.w500,
              ),
              const Gap(ProTiendaSpacing.lg),
              ContainerCircleColor(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              BreedUiValues.icCheck,
                            ),
                            const Gap(ProTiendaSpacing.sm),
                            XigoTextLarge(
                              BreedUiValues.yourData,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              BreedUiValues.icEdit,
                            ),
                            const Gap(ProTiendaSpacing.xs),
                            XigoTextSmall(
                              BreedUiValues.editData,
                              color: ProTiendasUiColors.crayolaGreen,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(ProTiendaSpacing.xs),
                    XigoTextLarge(
                      '${app.clien?.nombre} ${app.clien?.apellido}',
                      color: ProTiendasUiColors.primaryColor,
                      weight: FontWeight.w300,
                    ),
                    const Gap(ProTiendaSpacing.xs),
                    XigoTextLarge(
                      app.clien?.correo ?? '',
                      color: ProTiendasUiColors.primaryColor,
                      weight: FontWeight.w300,
                    ),
                    const Gap(ProTiendaSpacing.xs),
                    XigoTextLarge(
                      '${app.country.prefix} ${app.clien?.telefono ?? ''}',
                      color: ProTiendasUiColors.primaryColor,
                      weight: FontWeight.w300,
                    ),
                  ],
                ),
              ),
              const Gap(ProTiendaSpacing.md),
              Row(
                children: [
                  ContainerCircleColor(
                    padding: const EdgeInsets.symmetric(
                      horizontal: ProTiendaSpacing.sl,
                      vertical: ProTiendaSpacing.xs,
                    ),
                    widget: DropdownButton<String>(
                      hint: XigoTextMedium(
                        BreedUiValues.type,
                        weight: FontWeight.w500,
                      ),
                      style: null,
                      items: BreedUiValues.addressList
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: XigoTextMedium(
                                item,
                                weight: FontWeight.w500,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),
                  const Gap(ProTiendaSpacing.md),
                  Expanded(
                    child: XigoTextField(
                      controller: null,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                      hintText: BreedUiValues.number,
                      fillColor: Colors.white,
                      filled: true,
                      validator: (value) {
                        if ((value ?? '').isEmpty) {
                          return '${BreedUiValues.number} ${BreedUiValues.onRequired}';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              const Gap(ProTiendaSpacing.sl),
              ContainerCircleColor(
                padding: const EdgeInsets.symmetric(
                  horizontal: ProTiendaSpacing.sl,
                ),
                widget: BlocBuilder<BlocAddAddress, AddAddressState>(
                  builder: (context, state) {
                    return DropdownButton<Datum>(
                      isExpanded: true,
                      value: state.model.departamentSelected,
                      hint: XigoTextMedium(
                        BreedUiValues.department,
                        weight: FontWeight.w500,
                      ),
                      items: state.model.dataDepartament?.data
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: XigoTextMedium(
                                item.nombre,
                                weight: FontWeight.w500,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        context.read<BlocAddAddress>().add(
                              ChangedDepartamentSelectedEvent(
                                departamentSelected: value ??
                                    Datum(
                                      id: 0,
                                      nombre: '',
                                    ),
                              ),
                            );
                      },
                    );
                  },
                ),
              ),
              const Gap(ProTiendaSpacing.sl),
              ContainerCircleColor(
                padding: const EdgeInsets.symmetric(
                  horizontal: ProTiendaSpacing.sl,
                ),
                widget: BlocBuilder<BlocAddAddress, AddAddressState>(
                  builder: (context, state) {
                    return DropdownButton<City>(
                      isExpanded: true,
                      value: state.model.citySelected?.departamentoId == 0
                          ? null
                          : state.model.citySelected,
                      hint: XigoTextMedium(
                        BreedUiValues.city,
                        weight: FontWeight.w500,
                      ),
                      items: state.model.dataCitys?.data
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: XigoTextMedium(
                                item.nombre,
                                weight: FontWeight.w500,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        context.read<BlocAddAddress>().add(
                              ChangedCitySelectedEvent(
                                citySelected: value ??
                                    City(
                                      id: 0,
                                      nombre: '',
                                      departamentoId:
                                          state.model.departamentSelected?.id ??
                                              0,
                                    ),
                              ),
                            );
                      },
                    );
                  },
                ),
              ),
              const Gap(ProTiendaSpacing.sl),
              XigoTextField(
                controller: null,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    15,
                  ),
                ),
                hintText: BreedUiValues.addressBuildingApartment,
                fillColor: Colors.white,
                filled: true,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return '${BreedUiValues.addressBuildingApartment} ${BreedUiValues.onRequired}';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              const Gap(ProTiendaSpacing.sl),
              XigoTextField(
                controller: null,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    15,
                  ),
                ),
                hintText: BreedUiValues.neighborhood,
                fillColor: Colors.white,
                filled: true,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return '${BreedUiValues.neighborhood} ${BreedUiValues.onRequired}';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              const Gap(ProTiendaSpacing.sl),
              SwitchListTile(
                value: true,
                activeColor: ProTiendasUiColors.primaryColor,
                title: XigoTextCaptionS(
                  BreedUiValues.saveShippingAddress,
                  color: ProTiendasUiColors.primaryColor,
                  weight: FontWeight.w300,
                ),
                onChanged: (value) {},
              ),
              XigoTextCaptionS(
                BreedUiValues.billingInformation,
                weight: FontWeight.w400,
              ),
              XigoTextSmall(
                BreedUiValues.whatInformationShouldAppearInvoice,
                weight: FontWeight.w300,
              ),
              const Gap(ProTiendaSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ContainerCircleColor(
                      widget: XigoTextCaptionS(
                        BreedUiValues.theSameShippingInformation,
                        weight: FontWeight.w300,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const Gap(ProTiendaSpacing.md),
                  Expanded(
                    child: ContainerCircleColor(
                      widget: XigoTextCaptionS(
                        BreedUiValues.theDataAnotherPersonCompany,
                        weight: FontWeight.w300,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(ProTiendaSpacing.md),
              XigoBtnPrimary(
                label: BreedUiValues.continu,
                backgroundColor: ProTiendasUiColors.secondaryColor,
                btnSize: XigoBtnSize.big,
                labelColor: ProTiendasUiColors.primaryColor,
                onTap: () {
                  ProTiendasRoute.navPayment();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
