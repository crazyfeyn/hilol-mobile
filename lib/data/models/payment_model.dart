class CreatePaymentData {
  final String checkoutUrl;
  final double productTotalPrice;
  final double deliveryFee;
  final double totalAmount;
  final String currency;

  const CreatePaymentData({
    required this.checkoutUrl,
    required this.productTotalPrice,
    required this.deliveryFee,
    required this.totalAmount,
    required this.currency,
  });

  factory CreatePaymentData.fromJson(Map<String, dynamic> json) {
    final productTotalPrice = (json['productTotalPrice'] ?? 0).toDouble();
    final deliveryFee = (json['deliveryFee'] ?? 0).toDouble();

    return CreatePaymentData(
      checkoutUrl: json['checkoutUrl'] ?? '',
      productTotalPrice: productTotalPrice,
      deliveryFee: deliveryFee,
      totalAmount:
          (json['totalAmount'] ?? (productTotalPrice + deliveryFee)).toDouble(),
      currency: json['currency'] ?? 'KRW',
    );
  }
}
