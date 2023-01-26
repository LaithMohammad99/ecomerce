import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ItemSale extends StatefulWidget {
  final ProductModel product;

  const ItemSale({Key? key, required this.product}) : super(key: key);

  @override
  State<ItemSale> createState() => _ItemSaleState();
}

class _ItemSaleState extends State<ItemSale> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Stack(
              children: [
                Image.network(
                  '${widget.product.imageUrl}',
                  width: 180,
                  height: size * 0.22,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text(
                        '${widget.product.price}%',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            widget.product.category,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            widget.product.title,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 6,
          ),
          Text.rich(
            TextSpan(children: <TextSpan>[
              TextSpan(
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Colors.grey, decoration: TextDecoration.lineThrough),
                text: '${widget.product.price}\$',
              ),
              TextSpan(
                text:
                ' ${widget.product.price * widget.product.discount! /
                    100}\$',
              ),
            ]),
          ),
        ],
      ),
    );
  }
}