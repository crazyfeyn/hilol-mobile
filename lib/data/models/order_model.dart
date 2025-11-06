class OrderModel {
  final String id;
  final String date;
  final double total;
  final List<OrderProductModel> products;
  final String paymentMethod;
  final String cardLastFour;
  final String cardType;
  final DeliveryAddress deliveryAddress;

  OrderModel({
    required this.id,
    required this.date,
    required this.total,
    required this.products,
    required this.paymentMethod,
    required this.cardLastFour,
    required this.cardType,
    required this.deliveryAddress,
  });
}

class OrderProductModel {
  final String name;
  final String brand;
  final double price;
  final int quantity;
  final String imagePath;
  final String nickname;

  OrderProductModel({
    required this.name,
    required this.brand,
    required this.price,
    required this.quantity,
    required this.imagePath,
    required this.nickname,
  });
}

class DeliveryAddress {
  final String name;
  final String phone;
  final String street;
  final String city;
  final String postalCode;
  final String country;

  DeliveryAddress({
    required this.name,
    required this.phone,
    required this.street,
    required this.city,
    required this.postalCode,
    required this.country,
  });

  String get fullAddress => '$street, $city, $postalCode, $country';
}
