// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Confirmación de tu compra`
  String get confirmationPurchase {
    return Intl.message(
      'Confirmación de tu compra',
      name: 'confirmationPurchase',
      desc: '',
      args: [],
    );
  }

  /// `Error {code} \nSi el error persiste, contacta a soporte`
  String weHaveAErrorContactSuport(Object code) {
    return Intl.message(
      'Error $code \nSi el error persiste, contacta a soporte',
      name: 'weHaveAErrorContactSuport',
      desc: '',
      args: [code],
    );
  }

  /// `No estoy registrado`
  String get iAmNotRegistered {
    return Intl.message(
      'No estoy registrado',
      name: 'iAmNotRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Quiero registrarme.`
  String get wantRegister {
    return Intl.message(
      'Quiero registrarme.',
      name: 'wantRegister',
      desc: '',
      args: [],
    );
  }

  /// `Producto de MOTAXI S.A.S.`
  String get productBy {
    return Intl.message(
      'Producto de MOTAXI S.A.S.',
      name: 'productBy',
      desc: '',
      args: [],
    );
  }

  /// `Celular`
  String get cellPhone {
    return Intl.message(
      'Celular',
      name: 'cellPhone',
      desc: '',
      args: [],
    );
  }

  /// `Numero de teléfono no es válido`
  String get numberPhoneNoValid {
    return Intl.message(
      'Numero de teléfono no es válido',
      name: 'numberPhoneNoValid',
      desc: '',
      args: [],
    );
  }

  /// `Siguiente`
  String get next {
    return Intl.message(
      'Siguiente',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `e-mail`
  String get email {
    return Intl.message(
      'e-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Bienvenido`
  String get welcome {
    return Intl.message(
      'Bienvenido',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Completa los datos`
  String get completeTheData {
    return Intl.message(
      'Completa los datos',
      name: 'completeTheData',
      desc: '',
      args: [],
    );
  }

  /// `Guardar`
  String get save {
    return Intl.message(
      'Guardar',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Verificar correo electrónico`
  String get verifyEmail {
    return Intl.message(
      'Verificar correo electrónico',
      name: 'verifyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get password {
    return Intl.message(
      'Contraseña',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Registrate`
  String get register {
    return Intl.message(
      'Registrate',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Usuario registrado correctamente`
  String get userRegisterSuccesful {
    return Intl.message(
      'Usuario registrado correctamente',
      name: 'userRegisterSuccesful',
      desc: '',
      args: [],
    );
  }

  /// `Ahora puedes iniciar sesión`
  String get nowYouCanLogIn {
    return Intl.message(
      'Ahora puedes iniciar sesión',
      name: 'nowYouCanLogIn',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar sesión`
  String get sigIn {
    return Intl.message(
      'Iniciar sesión',
      name: 'sigIn',
      desc: '',
      args: [],
    );
  }

  /// `Nombre`
  String get name {
    return Intl.message(
      'Nombre',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Apellido`
  String get lastName {
    return Intl.message(
      'Apellido',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Lo Nuevo`
  String get theNew {
    return Intl.message(
      'Lo Nuevo',
      name: 'theNew',
      desc: '',
      args: [],
    );
  }

  /// `Envio Gratis`
  String get sendFree {
    return Intl.message(
      'Envio Gratis',
      name: 'sendFree',
      desc: '',
      args: [],
    );
  }

  /// `Crear cuenta`
  String get createAccount {
    return Intl.message(
      'Crear cuenta',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Falta poco!`
  String get almostThere {
    return Intl.message(
      'Falta poco!',
      name: 'almostThere',
      desc: '',
      args: [],
    );
  }

  /// `Completa tus datos para crear tu cuenta`
  String get completeDetailsCreateAccount {
    return Intl.message(
      'Completa tus datos para crear tu cuenta',
      name: 'completeDetailsCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa con`
  String get loginWith {
    return Intl.message(
      'Ingresa con',
      name: 'loginWith',
      desc: '',
      args: [],
    );
  }

  /// `Necesito ayuda para ingresar`
  String get iNeedHelpEnter {
    return Intl.message(
      'Necesito ayuda para ingresar',
      name: 'iNeedHelpEnter',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa a tu cuenta`
  String get logAccount {
    return Intl.message(
      'Ingresa a tu cuenta',
      name: 'logAccount',
      desc: '',
      args: [],
    );
  }

  /// `Hola!`
  String get hello {
    return Intl.message(
      'Hola!',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Para comprar ingresa tu cuenta`
  String get buyEnterAccount {
    return Intl.message(
      'Para comprar ingresa tu cuenta',
      name: 'buyEnterAccount',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa tu email o usuario`
  String get enterEmailUsername {
    return Intl.message(
      'Ingresa tu email o usuario',
      name: 'enterEmailUsername',
      desc: '',
      args: [],
    );
  }

  /// `¿Olvidaste tu contraseña?`
  String get didForgetPassword {
    return Intl.message(
      '¿Olvidaste tu contraseña?',
      name: 'didForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Continuar`
  String get continu {
    return Intl.message(
      'Continuar',
      name: 'continu',
      desc: '',
      args: [],
    );
  }

  /// `Buscar en Protiendas`
  String get searchProtiendas {
    return Intl.message(
      'Buscar en Protiendas',
      name: 'searchProtiendas',
      desc: '',
      args: [],
    );
  }

  /// `Añadir al carrito`
  String get addCart {
    return Intl.message(
      'Añadir al carrito',
      name: 'addCart',
      desc: '',
      args: [],
    );
  }

  /// `Comprar ahora`
  String get buyNow {
    return Intl.message(
      'Comprar ahora',
      name: 'buyNow',
      desc: '',
      args: [],
    );
  }

  /// `Características`
  String get characteristics {
    return Intl.message(
      'Características',
      name: 'characteristics',
      desc: '',
      args: [],
    );
  }

  /// `Resumen del producto`
  String get productSummary {
    return Intl.message(
      'Resumen del producto',
      name: 'productSummary',
      desc: '',
      args: [],
    );
  }

  /// `Descripción del producto`
  String get productDescription {
    return Intl.message(
      'Descripción del producto',
      name: 'productDescription',
      desc: '',
      args: [],
    );
  }

  /// `Opiniones`
  String get opinions {
    return Intl.message(
      'Opiniones',
      name: 'opinions',
      desc: '',
      args: [],
    );
  }

  /// `Deja tu opinión`
  String get leaveOpinion {
    return Intl.message(
      'Deja tu opinión',
      name: 'leaveOpinion',
      desc: '',
      args: [],
    );
  }

  /// `Te puede interesar`
  String get mayInterest {
    return Intl.message(
      'Te puede interesar',
      name: 'mayInterest',
      desc: '',
      args: [],
    );
  }

  /// `Inicio`
  String get start {
    return Intl.message(
      'Inicio',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Favoritos`
  String get favorites {
    return Intl.message(
      'Favoritos',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Notificaciones`
  String get notifications {
    return Intl.message(
      'Notificaciones',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Mi Perfil`
  String get myProfile {
    return Intl.message(
      'Mi Perfil',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Carrito de Compras`
  String get shoppingCart {
    return Intl.message(
      'Carrito de Compras',
      name: 'shoppingCart',
      desc: '',
      args: [],
    );
  }

  /// `Productos`
  String get products {
    return Intl.message(
      'Productos',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Envío`
  String get shipment {
    return Intl.message(
      'Envío',
      name: 'shipment',
      desc: '',
      args: [],
    );
  }

  /// `Continuar compra`
  String get continueShopping {
    return Intl.message(
      'Continuar compra',
      name: 'continueShopping',
      desc: '',
      args: [],
    );
  }

  /// `Elige la forma de entrega`
  String get chooseDeliveryMethod {
    return Intl.message(
      'Elige la forma de entrega',
      name: 'chooseDeliveryMethod',
      desc: '',
      args: [],
    );
  }

  /// `Entrega`
  String get delivery {
    return Intl.message(
      'Entrega',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `Enviar a tu domicilio`
  String get sendHome {
    return Intl.message(
      'Enviar a tu domicilio',
      name: 'sendHome',
      desc: '',
      args: [],
    );
  }

  /// `Agregar dirección de envío`
  String get addShippingAddress {
    return Intl.message(
      'Agregar dirección de envío',
      name: 'addShippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Retirar en un punto de entrega`
  String get pickUpDeliveryPoint {
    return Intl.message(
      'Retirar en un punto de entrega',
      name: 'pickUpDeliveryPoint',
      desc: '',
      args: [],
    );
  }

  /// `Agencia Protiendas Calle 5ta con cra 21 esquina\nAguachica - Cesar`
  String get addressOffice {
    return Intl.message(
      'Agencia Protiendas Calle 5ta con cra 21 esquina\nAguachica - Cesar',
      name: 'addressOffice',
      desc: '',
      args: [],
    );
  }

  /// `Lunes a sábado de 8 am a 6 pm`
  String get officeHours {
    return Intl.message(
      'Lunes a sábado de 8 am a 6 pm',
      name: 'officeHours',
      desc: '',
      args: [],
    );
  }

  /// `Dirección de envío`
  String get shippingAddress {
    return Intl.message(
      'Dirección de envío',
      name: 'shippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Ver en el mapa o elegir otro punto de recolección`
  String get viewMapChooseAnotherCollectionPoint {
    return Intl.message(
      'Ver en el mapa o elegir otro punto de recolección',
      name: 'viewMapChooseAnotherCollectionPoint',
      desc: '',
      args: [],
    );
  }

  /// `Tus datos`
  String get yourData {
    return Intl.message(
      'Tus datos',
      name: 'yourData',
      desc: '',
      args: [],
    );
  }

  /// `Editar tus datos`
  String get editData {
    return Intl.message(
      'Editar tus datos',
      name: 'editData',
      desc: '',
      args: [],
    );
  }

  /// `Tipo`
  String get type {
    return Intl.message(
      'Tipo',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Número`
  String get number {
    return Intl.message(
      'Número',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Departamento`
  String get department {
    return Intl.message(
      'Departamento',
      name: 'department',
      desc: '',
      args: [],
    );
  }

  /// `Ciudad`
  String get city {
    return Intl.message(
      'Ciudad',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Dirección, Edificio / Apartamento`
  String get addressBuildingApartment {
    return Intl.message(
      'Dirección, Edificio / Apartamento',
      name: 'addressBuildingApartment',
      desc: '',
      args: [],
    );
  }

  /// `Barrio`
  String get neighborhood {
    return Intl.message(
      'Barrio',
      name: 'neighborhood',
      desc: '',
      args: [],
    );
  }

  /// `Guardar dirección de envío`
  String get saveShippingAddress {
    return Intl.message(
      'Guardar dirección de envío',
      name: 'saveShippingAddress',
      desc: '',
      args: [],
    );
  }

  /// `Datos de facturación`
  String get billingInformation {
    return Intl.message(
      'Datos de facturación',
      name: 'billingInformation',
      desc: '',
      args: [],
    );
  }

  /// `¿Qué  datos desea que aparezcan en tu factura?`
  String get whatInformationShouldAppearInvoice {
    return Intl.message(
      '¿Qué  datos desea que aparezcan en tu factura?',
      name: 'whatInformationShouldAppearInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Los mismos datos del envío`
  String get theSameShippingInformation {
    return Intl.message(
      'Los mismos datos del envío',
      name: 'theSameShippingInformation',
      desc: '',
      args: [],
    );
  }

  /// `Los datos de otra persona o empresa`
  String get theDataAnotherPersonCompany {
    return Intl.message(
      'Los datos de otra persona o empresa',
      name: 'theDataAnotherPersonCompany',
      desc: '',
      args: [],
    );
  }

  /// `Método de Pago`
  String get paymentMethod {
    return Intl.message(
      'Método de Pago',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `¿Cómo quieres pagar?`
  String get howWantPay {
    return Intl.message(
      '¿Cómo quieres pagar?',
      name: 'howWantPay',
      desc: '',
      args: [],
    );
  }

  /// `Nueva tarjeta de crédito`
  String get newCreditCard {
    return Intl.message(
      'Nueva tarjeta de crédito',
      name: 'newCreditCard',
      desc: '',
      args: [],
    );
  }

  /// `Nueva tarjeta de débito`
  String get newDebitCard {
    return Intl.message(
      'Nueva tarjeta de débito',
      name: 'newDebitCard',
      desc: '',
      args: [],
    );
  }

  /// `Transferencia bancaria con PSE`
  String get bankTransferWithPse {
    return Intl.message(
      'Transferencia bancaria con PSE',
      name: 'bankTransferWithPse',
      desc: '',
      args: [],
    );
  }

  /// `Efecty`
  String get efecty {
    return Intl.message(
      'Efecty',
      name: 'efecty',
      desc: '',
      args: [],
    );
  }

  /// `Número de la tarjeta`
  String get cardNumber {
    return Intl.message(
      'Número de la tarjeta',
      name: 'cardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Nombre del títular de la tarjeta`
  String get cardHolderName {
    return Intl.message(
      'Nombre del títular de la tarjeta',
      name: 'cardHolderName',
      desc: '',
      args: [],
    );
  }

  /// `Guardar y confirmar`
  String get saveConfirm {
    return Intl.message(
      'Guardar y confirmar',
      name: 'saveConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Realizar compra`
  String get makePurchase {
    return Intl.message(
      'Realizar compra',
      name: 'makePurchase',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
