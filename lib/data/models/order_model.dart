class OrderModel {
  final List<OrderProductRequest> products;
  final String receiverPhone;
  final String receiverAddress;
  final String additionalInfo;
  final String receiverName;
  final OrderLocation location; // ✅ Added missing field

  OrderModel({
    required this.products,
    required this.receiverPhone,
    required this.receiverAddress,
    required this.additionalInfo,
    required this.receiverName,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      'products': products.map((p) => p.toJson()).toList(),
      'receiverPhone': receiverPhone,
      'receiverAddress': receiverAddress,
      'additionalInfo': additionalInfo,
      'receiverName': receiverName,
      'location': location.toJson(), // ✅ Added
    };
  }

  OrderModel copyWith({
    List<OrderProductRequest>? products,
    String? receiverPhone,
    String? receiverAddress,
    String? additionalInfo,
    String? receiverName,
    OrderLocation? location,
  }) {
    return OrderModel(
      products: products ?? this.products,
      receiverPhone: receiverPhone ?? this.receiverPhone,
      receiverAddress: receiverAddress ?? this.receiverAddress,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      receiverName: receiverName ?? this.receiverName,
      location: location ?? this.location,
    );
  }
}

class OrderProductRequest {
  final int productId;
  final int amount;

  OrderProductRequest({required this.productId, required this.amount});

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'amount': amount};
  }

  OrderProductRequest copyWith({int? productId, int? amount}) {
    return OrderProductRequest(
      productId: productId ?? this.productId,
      amount: amount ?? this.amount,
    );
  }
}

class OrderLocation {
  final String city;
  final String region;
  final String street;
  final double altitude;
  final double longitude;

  OrderLocation({
    required this.city,
    required this.region,
    required this.street,
    required this.altitude,
    required this.longitude,
  });

  factory OrderLocation.fromJson(Map<String, dynamic> json) {
    return OrderLocation(
      city: json['city'] ?? '',
      region: json['region'] ?? '',
      street: json['street'] ?? '',
      altitude: (json['altitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'region': region,
      'street': street,
      'altitude': altitude,
      'longitude': longitude,
    };
  }

  OrderLocation copyWith({
    String? city,
    String? region,
    String? street,
    double? altitude,
    double? longitude,
  }) {
    return OrderLocation(
      city: city ?? this.city,
      region: region ?? this.region,
      street: street ?? this.street,
      altitude: altitude ?? this.altitude,
      longitude: longitude ?? this.longitude,
    );
  }
}

class OrderResponse {
  final bool success;
  final OrderData? data;
  final ApiError? error;

  OrderResponse({required this.success, this.data, this.error});

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      success: json['success'] ?? false,
      data: json['data'] != null ? OrderData.fromJson(json['data']) : null,
      error: json['error'] != null ? ApiError.fromJson(json['error']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
      'error': error?.toJson(),
    };
  }

  OrderResponse copyWith({bool? success, OrderData? data, ApiError? error}) {
    return OrderResponse(
      success: success ?? this.success,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}

class OrderData {
  final int orderId;
  final double productTotalPrice;
  final double deliveryFee;
  final double totalPrice;
  final String currency;
  final String orderStatus;
  final String imageIdentity;
  final String receiverAddress;
  final String receiverPhone;
  final String receiverName;
  final List<OrderProductData> products;
  final DateTime createdAt;

  OrderData({
    required this.orderId,
    required this.productTotalPrice,
    required this.deliveryFee,
    required this.totalPrice,
    required this.currency,
    required this.orderStatus,
    required this.imageIdentity,
    required this.receiverAddress,
    required this.receiverPhone,
    required this.receiverName,
    required this.products,
    required this.createdAt,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    final productTotalPrice = (json['productTotalPrice'] ?? 0).toDouble();
    final deliveryFee = (json['deliveryFee'] ?? 0).toDouble();
    final totalPrice =
        (json['totalPrice'] ?? (productTotalPrice + deliveryFee)).toDouble();

    return OrderData(
      orderId: json['orderId'] ?? 0,
      productTotalPrice: productTotalPrice,
      deliveryFee: deliveryFee,
      totalPrice: totalPrice,
      currency: json['currency'] ?? '',
      orderStatus: json['orderStatus'] ?? 'NEW',
      imageIdentity: json['imageIdentity'] ?? '',
      receiverAddress: json['receiverAddress'] ?? '',
      receiverPhone: json['receiverPhone'] ?? '',
      receiverName: json['receiverName'] ?? '',
      products:
          (json['products'] as List<dynamic>?)
              ?.map((p) => OrderProductData.fromJson(p))
              .toList() ??
          [],
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'productTotalPrice': productTotalPrice,
      'deliveryFee': deliveryFee,
      'totalPrice': totalPrice,
      'currency': currency,
      'orderStatus': orderStatus,
      'imageIdentity': imageIdentity,
      'receiverAddress': receiverAddress,
      'receiverPhone': receiverPhone,
      'receiverName': receiverName,
      'products': products.map((p) => p.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  OrderData copyWith({
    int? orderId,
    double? productTotalPrice,
    double? deliveryFee,
    double? totalPrice,
    String? currency,
    String? orderStatus,
    String? imageIdentity,
    String? receiverAddress,
    String? receiverPhone,
    String? receiverName,
    List<OrderProductData>? products,
    DateTime? createdAt,
  }) {
    return OrderData(
      orderId: orderId ?? this.orderId,
      productTotalPrice: productTotalPrice ?? this.productTotalPrice,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      totalPrice: totalPrice ?? this.totalPrice,
      currency: currency ?? this.currency,
      orderStatus: orderStatus ?? this.orderStatus,
      imageIdentity: imageIdentity ?? this.imageIdentity,
      receiverAddress: receiverAddress ?? this.receiverAddress,
      receiverPhone: receiverPhone ?? this.receiverPhone,
      receiverName: receiverName ?? this.receiverName,
      products: products ?? this.products,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class OrderProductData {
  final int orderId;
  final int productId;
  final double price;
  final String title;
  final String currency;
  final int amount;
  final int measurementId;

  OrderProductData({
    required this.orderId,
    required this.productId,
    required this.price,
    required this.title,
    required this.currency,
    required this.amount,
    required this.measurementId,
  });

  factory OrderProductData.fromJson(Map<String, dynamic> json) {
    return OrderProductData(
      orderId: json['orderId'] ?? 0,
      productId: json['productId'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
      title: json['title'] ?? '',
      currency: json['currency'] ?? '',
      amount: json['amount'] ?? 0,
      measurementId: json['measurementId'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'productId': productId,
      'price': price,
      'title': title,
      'currency': currency,
      'amount': amount,
      'measurementId': measurementId,
    };
  }
}

class ApiError {
  final int code;
  final String message;
  final int httpStatus;
  final String details;

  ApiError({
    required this.code,
    required this.message,
    required this.httpStatus,
    required this.details,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      httpStatus: json['httpStatus'] ?? 0,
      details: json['details'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'httpStatus': httpStatus,
      'details': details,
    };
  }
}
