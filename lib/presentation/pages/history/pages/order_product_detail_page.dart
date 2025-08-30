// Order Product Detail Page
import 'package:commerce_mobile/core/extension/extensions.dart';
import 'package:commerce_mobile/data/models/order_model.dart';
import 'package:flutter/material.dart';

class OrderProductModelDetailPage extends StatelessWidget {
  static final path = '/order_product_detail_page';
  final OrderProductModel product;
  final OrderModel order;

  const OrderProductModelDetailPage({
    super.key,
    required this.product,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Product Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: Colors.grey[200],
                  child: Icon(Icons.image, color: Colors.grey[600], size: 80),
                ),
              ),
            ),
            20.hs(),
            _buildInfoCard(
              title: 'Product Information',
              children: [
                _buildInfoRow('Product Name', product.name),
                _buildInfoRow('Brand', product.brand),
                _buildInfoRow('Price', '\$${product.price}'),
                _buildInfoRow('Quantity', '${product.quantity}'),
                _buildInfoRow('Total', '\$${product.price * product.quantity}'),
                _buildInfoRow('Nickname', product.nickname),
              ],
            ),
            16.hs(),
            _buildInfoCard(
              title: 'Order Details',
              children: [
                _buildInfoRow('Order ID', '#${order.id}'),
                _buildInfoRow('Order Date', order.date),
                _buildInfoRow('Order Total', '\$${order.total}'),
              ],
            ),
            16.hs(),
            _buildInfoCard(
              title: 'Payment Information',
              children: [
                _buildInfoRow('Payment Method', order.paymentMethod),
                _buildInfoRow(
                  'Card Used',
                  '**** **** **** ${order.cardLastFour}',
                ),
                _buildInfoRow('Card Type', order.cardType),
              ],
            ),
            16.hs(),
            _buildInfoCard(
              title: 'Delivery Address',
              children: [
                _buildInfoRow('Name', order.deliveryAddress.name),
                _buildInfoRow('Phone', order.deliveryAddress.phone),
                _buildInfoRow('Address', order.deliveryAddress.fullAddress),
                _buildInfoRow('City', order.deliveryAddress.city),
                _buildInfoRow('Postal Code', order.deliveryAddress.postalCode),
              ],
            ),
            20.hs(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          16.hs(),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
