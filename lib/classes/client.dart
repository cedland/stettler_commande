import 'package:flutter/material.dart';
import 'package:stettlerproapp/classes/product.dart';

import 'order.dart';

final List<String> billingPeriod = [
  'Directe',
  'Journalière',
  'Semaine',
  'Quinzaine',
  'Mois'
];

final List<String> billingOther = [
  'Client avec rabais s/volume',
  'Ventes au comptant',
  'Avec édition Prix de Vente',
  'Avec édition du code fournisseur',
  'Avec édition feuille actions',
  'Sans envoi par courrier',
  'Client n’a pas d’e-mail',
  'Ne veut pas action email',
  'Veut recevoir action courrier',
  'Client avec emballage',
  'Rabais s/négociations et actions',
  'Sans livraison',
  'Sans édition Prix s/Bulletins',
];

class Address {
  int number;
  String street;
  String additionalAddress;
  String postalCode;
  String doorCode;
  String city;
  String statisticCode;

  Address({
    required this.number,
    required this.street,
    this.additionalAddress = "",
    required this.postalCode,
    required this.doorCode,
    required this.city,
    required this.statisticCode,
  });
}

class AccountingInfo {
  String accountNumber;
  String group;
  String paymentDeadline;
  String representant;
  int refunds;

  AccountingInfo({
    required this.accountNumber,
    required this.group,
    required this.paymentDeadline,
    this.representant = '',
    required this.refunds,
  });
}

class Transportation {
  String transportationNumber;
  String transportationCode;
  DateTime transportationDate;
  String transportationSEQ;
  String sellerCode;

  Transportation(
      {required this.transportationNumber,
      required this.transportationCode,
      required this.transportationDate,
      required this.transportationSEQ,
      required this.sellerCode});
}

class PurchaseInfo {
  String registrantSell;
  DateTime purchaseDate;
  String? registrantReturn;
  DateTime? returnDate;
  String discount;
  String discountInvoice;
  String priceCategory;
  DateTime startDeliveryHour;
  DateTime endDeliveryHour;
  List<String> billingPeriod;
  List<String> billingOther;
  String remarksDelivery;
  String remarksPhone;
  Transportation transportation;

  PurchaseInfo({
    required this.registrantSell,
    required this.purchaseDate,
    this.registrantReturn,
    this.returnDate,
    required this.discount,
    required this.discountInvoice,
    required this.priceCategory,
    required this.startDeliveryHour,
    required this.endDeliveryHour,
    required this.billingPeriod,
    required this.billingOther,
    required this.remarksDelivery,
    required this.remarksPhone,
    required this.transportation,
  });
}

class Client {
  String name;
  String surname;
  String id;
  String email;
  String phoneNumber;
  String gender;
  String language;
  String companyName;
  Address address;
  AccountingInfo accountingInfo;
  PurchaseInfo purchaseInfo;
  List<Order> orderList;
  List<Product> cartProducts;
  List<int> quantityList;
  ValueNotifier<double> totalPrice;

  Client(
      {required this.name,
      required this.surname,
      required this.id,
      required this.email,
      required this.address,
      required this.phoneNumber,
      required this.language,
      this.companyName = '',
      required this.gender,
      required this.accountingInfo,
      required this.purchaseInfo,
      required this.orderList,
      List<Product>? cartProducts,
      List<int>? quantityList,
      ValueNotifier<double>? totalPrice})
      : cartProducts = cartProducts ?? [],
        quantityList = quantityList ?? [],
        totalPrice = totalPrice ?? ValueNotifier<double>(0);
}
