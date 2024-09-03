import 'dart:convert';

class Payment {
  final String? message;
  final PaymentMethods? paymentMethods;

  Payment({
    this.message,
    this.paymentMethods,
  });

  factory Payment.fromJson(String str) => Payment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Payment.fromMap(Map<String, dynamic> json) => Payment(
        message: json["message"],
        paymentMethods: json["payment_methods"] == null
            ? null
            : PaymentMethods.fromMap(json["payment_methods"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "payment_methods": paymentMethods?.toMap(),
      };
}

class PaymentMethods {
  final EWallet? eWallet;

  PaymentMethods({
    this.eWallet,
  });

  factory PaymentMethods.fromJson(String str) =>
      PaymentMethods.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentMethods.fromMap(Map<String, dynamic> json) => PaymentMethods(
        eWallet:
            json["e_wallet"] == null ? null : EWallet.fromMap(json["e_wallet"]),
      );

  Map<String, dynamic> toMap() => {
        "e_wallet": eWallet?.toMap(),
      };
}

class EWallet {
  final String? idOvo;
  final String? idDana;
  final String? idLinkaja;
  final String? idShopeepay;

  EWallet({
    this.idOvo,
    this.idDana,
    this.idLinkaja,
    this.idShopeepay,
  });

  factory EWallet.fromJson(String str) => EWallet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EWallet.fromMap(Map<String, dynamic> json) => EWallet(
        idOvo: json["ID_OVO"],
        idDana: json["ID_DANA"],
        idLinkaja: json["ID_LINKAJA"],
        idShopeepay: json["ID_SHOPEEPAY"],
      );

  Map<String, dynamic> toMap() => {
        "ID_OVO": idOvo,
        "ID_DANA": idDana,
        "ID_LINKAJA": idLinkaja,
        "ID_SHOPEEPAY": idShopeepay,
      };
}
