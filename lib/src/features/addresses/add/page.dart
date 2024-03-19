import 'package:breeds_widget/app/widget/app_bar_global.dart';
import 'package:breeds_widget/app/widget/button/btn.dart';
import 'package:breeds_widget/app/widget/container_circle_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:breeds/src/core/utils/constant/navigation.dart';
import 'package:breeds/src/shared/models/data_citys.dart';
import 'package:breeds/src/shared/models/data_departament.dart';
import 'package:breeds/src/features/addresses/add/bloc/bloc.dart';
import 'package:breeds/src/features/addresses/add/repository.dart';
import 'package:breeds/src/core/utils/constant/colors.dart';
import 'package:breeds/src/core/utils/config/client_config.dart';
import 'package:breeds/src/core/network/http_client.dart'
    hide ModularWatchExtension;
import 'package:breeds/src/core/utils/helpers/input/input.dart';
import 'package:breeds/src/core/utils/constant/spacing.dart';
import 'package:breeds/src/core/utils/helpers/text/text.dart';
import 'package:breeds/src/core/utils/constant/protienda_ui.dart';

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
            title: ProTiendasUiValues.delivery,
          ),
          body: ListView(
            padding: const EdgeInsets.all(ProTiendaSpacing.lg),
            children: [
              XigoTextHeading6(
                ProTiendasUiValues.shippingAddress,
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
                              ProTiendasUiValues.icCheck,
                            ),
                            const Gap(ProTiendaSpacing.sm),
                            XigoTextLarge(
                              ProTiendasUiValues.yourData,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              ProTiendasUiValues.icEdit,
                            ),
                            const Gap(ProTiendaSpacing.xs),
                            XigoTextSmall(
                              ProTiendasUiValues.editData,
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
                        ProTiendasUiValues.type,
                        weight: FontWeight.w500,
                      ),
                      style: null,
                      items: ProTiendasUiValues.addressList
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
                      hintText: ProTiendasUiValues.number,
                      fillColor: Colors.white,
                      filled: true,
                      validator: (value) {
                        if ((value ?? '').isEmpty) {
                          return '${ProTiendasUiValues.number} ${ProTiendasUiValues.onRequired}';
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
                        ProTiendasUiValues.department,
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
                        ProTiendasUiValues.city,
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
                hintText: ProTiendasUiValues.addressBuildingApartment,
                fillColor: Colors.white,
                filled: true,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return '${ProTiendasUiValues.addressBuildingApartment} ${ProTiendasUiValues.onRequired}';
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
                hintText: ProTiendasUiValues.neighborhood,
                fillColor: Colors.white,
                filled: true,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return '${ProTiendasUiValues.neighborhood} ${ProTiendasUiValues.onRequired}';
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
                  ProTiendasUiValues.saveShippingAddress,
                  color: ProTiendasUiColors.primaryColor,
                  weight: FontWeight.w300,
                ),
                onChanged: (value) {},
              ),
              XigoTextCaptionS(
                ProTiendasUiValues.billingInformation,
                weight: FontWeight.w400,
              ),
              XigoTextSmall(
                ProTiendasUiValues.whatInformationShouldAppearInvoice,
                weight: FontWeight.w300,
              ),
              const Gap(ProTiendaSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ContainerCircleColor(
                      widget: XigoTextCaptionS(
                        ProTiendasUiValues.theSameShippingInformation,
                        weight: FontWeight.w300,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const Gap(ProTiendaSpacing.md),
                  Expanded(
                    child: ContainerCircleColor(
                      widget: XigoTextCaptionS(
                        ProTiendasUiValues.theDataAnotherPersonCompany,
                        weight: FontWeight.w300,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(ProTiendaSpacing.md),
              XigoBtnPrimary(
                label: ProTiendasUiValues.continu,
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
