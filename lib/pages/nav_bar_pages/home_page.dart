import 'package:ecommercapp/models/product_model.dart';
import 'package:ecommercapp/utlis/app_assest.dart';
import 'package:ecommercapp/widget/hedar_of_list.dart';
import 'package:ecommercapp/widget/iteam_sale.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                AppAssets.topBannerHomePageAssest,
                height: size.height * 0.3,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.4,
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.3,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Text(
                  'Street Clothes',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          HeaderOfList(
              title: 'Sale',
              titleViewAll: 'View All',
              descrption: 'Super Summary Sales',
              onTap: () {}),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: dummyProduct
                  .map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ItemSale(
                  product: e,
                ),
              ))
                  .toList(),
            ),
          ),
          HeaderOfList(
              title: 'New',
              titleViewAll: 'View All',
              descrption: 'Super Summary Sales',
              onTap: () {}),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: dummyProduct
                  .map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ItemSale(
                  product: e,
                ),
              ))
                  .toList(),
            ),
          ),











        ],
      ),
    );
  }
}