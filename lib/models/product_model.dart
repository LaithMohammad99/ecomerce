import 'package:ecommercapp/utlis/app_assest.dart';

class ProductModel {
  final String id;
  final String title;
  final int price;
  final int? discount;
  final String imageUrl;
  final String category;
  final double? rate;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      this.discount,
      required this.imageUrl,
      required this.category,
      this.rate});
}

List<ProductModel> dummyProduct = [
  ProductModel(
      id: '1',
      title: 'T-shirt',
      price: 100,
      imageUrl: AppAssets.imageItemshirt,
      category: 'Clothes',
      discount: 20),
  ProductModel(
      id: '2',
      title: 'T-shirt',
      price: 300,
      imageUrl:
          'https://cdn.shopify.com/s/files/1/1195/1382/products/2_188fd1ee-6e48-4c3d-9856-6b44a26e2df6_3000x3000.jpg?v=1668467334',
      category: 'Clothes',
      discount: 20),
  ProductModel(
      id: '3',
      title: 'T-shirt',
      price: 200,
      imageUrl:
          'https://assets.vogue.in/photos/5faba1e96e6a3d78b88a5165/2:3/w_2240,c_limit/QE%20656%203.jpg',
      category: 'Clothes',
      discount: 20),
  ProductModel(
      id: '4',
      title: 'T-shirt',
      price: 300,
      imageUrl: AppAssets.imageItemshirt,
      category: 'Clothes',
      discount: 20),
];
