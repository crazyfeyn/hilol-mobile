class OrderModel {
  final List<OrderProductRequest> products;
  final String receiverPhone;
  final String receiverAddress;
  final String additionalInfo;
  final String receiverName;

  OrderModel({
    required this.products,
    required this.receiverPhone,
    required this.receiverAddress,
    required this.additionalInfo,
    required this.receiverName,
  });

  Map<String, dynamic> toJson() {
    return {
      'products': products.map((p) => p.toJson()).toList(),
      'receiverPhone': receiverPhone,
      'receiverAddress': receiverAddress,
      'additionalInfo': additionalInfo,
      'receiverName': receiverName,
    };
  }

  OrderModel copyWith({
    List<OrderProductRequest>? products,
    String? receiverPhone,
    String? receiverAddress,
    String? additionalInfo,
    String? receiverName,
  }) {
    return OrderModel(
      products: products ?? this.products,
      receiverPhone: receiverPhone ?? this.receiverPhone,
      receiverAddress: receiverAddress ?? this.receiverAddress,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      receiverName: receiverName ?? this.receiverName,
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
    return OrderData(
      orderId: json['orderId'] ?? 0,
      totalPrice: (json['totalPrice'] ?? 0).toDouble(),
      currency: json['currency'] ?? '',
      orderStatus: json['orderStatus'] ?? 'NEW',
      imageIdentity: json['imageIdentity'] ?? '',
      receiverAddress: json['receiverAddress'] ?? '',
      receiverPhone: json['receiverPhone'] ?? '',
      receiverName: json['receiverName'] ?? '',
      products:
          (json['products'] as List<dynamic>?)
              ?.map((product) => OrderProductData.fromJson(product))
              .toList() ??
          [],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'totalPrice': totalPrice,
      'currency': currency,
      'orderStatus': orderStatus,
      'imageIdentity': imageIdentity,
      'receiverAddress': receiverAddress,
      'receiverPhone': receiverPhone,
      'receiverName': receiverName,
      'products': products.map((product) => product.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  OrderData copyWith({
    int? orderId,
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
  final String currency;
  final int amount;
  final int measurementId;

  OrderProductData({
    required this.orderId,
    required this.productId,
    required this.price,
    required this.currency,
    required this.amount,
    required this.measurementId,
  });

  factory OrderProductData.fromJson(Map<String, dynamic> json) {
    return OrderProductData(
      orderId: json['orderId'] ?? 0,
      productId: json['productId'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
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
      'currency': currency,
      'amount': amount,
      'measurementId': measurementId,
    };
  }

  OrderProductData copyWith({
    int? orderId,
    int? productId,
    double? price,
    String? currency,
    int? amount,
    int? measurementId,
  }) {
    return OrderProductData(
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      amount: amount ?? this.amount,
      measurementId: measurementId ?? this.measurementId,
    );
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

  ApiError copyWith({
    int? code,
    String? message,
    int? httpStatus,
    String? details,
  }) {
    return ApiError(
      code: code ?? this.code,
      message: message ?? this.message,
      httpStatus: httpStatus ?? this.httpStatus,
      details: details ?? this.details,
    );
  }
}
