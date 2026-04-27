import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:just_eccomerce_app/components/product_Card.dart';
import 'package:just_eccomerce_app/providers/product_provider.dart';
import 'package:just_eccomerce_app/utils/colors.dart';
import 'package:just_eccomerce_app/utils/constants.dart';
import 'package:just_eccomerce_app/utils/sizes.dart';
import 'package:just_eccomerce_app/views/cart_view.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    final productProdiver = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        title: Text(
          'Just Eccomerce App',
          style: style(fontSize: Sizes.fontSizeLg, color: AppColor.kbgColor2),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Iconsax.heart,
                    color: AppColor.kbgColor2,
                    size: Sizes.iconMd,
                  ),
                ),
                Gap(15),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartView()),
                    );
                  },
                  child: Icon(
                    Iconsax.shopping_cart,
                    color: AppColor.kbgColor2,
                    size: Sizes.iconMd,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: productProdiver.isLoading
          ? Center(child: CircularProgressIndicator.adaptive())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Consumer<ProductProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    itemCount: provider.products.length,
                    itemBuilder: (context, index) =>
                        ProductCard(product: provider.products[index]),
                  );
                },
              ),
            ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).loadProducts();
  }
}
