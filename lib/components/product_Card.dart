import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:just_eccomerce_app/models/product_model.dart';
import 'package:just_eccomerce_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/exports.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      padding: EdgeInsets.all(Sizes.md),
      margin: EdgeInsets.only(bottom: Sizes.sm, top: Sizes.sm),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.borderPrimary, width: 2),
        borderRadius: BorderRadius.circular(Sizes.borderRadiusLg),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(Sizes.borderRadiusMd),
            child: CachedNetworkImage(
              imageUrl: product.image,
              fit: BoxFit.cover,
              height: Sizes.imageCarouselHeight + 50,
              width: double.maxFinite,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(color: Colors.red),
              ),
              errorWidget: (context, url, error) => Icon(Iconsax.image),
            ),
          ),
          Gap(10),
          Text(
            product.name,
            style: style(
              fontSize: Sizes.fontSizeLg,
              color: AppColor.kTextStyleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(8),
          Text(
            product.description,
            style: style(
              fontSize: Sizes.fontSizeMd,
              color: AppColor.kTextStyleColorGray,
            ),
          ),
          Gap(10),
          Divider(color: AppColor.borderPrimary, thickness: 2),

          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                formatCurrency(product.price.toString()),
                style: style(
                  fontSize: Sizes.fontSizeLg,
                  color: AppColor.kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Iconsax.heart,
                    color: AppColor.kTextStyleColor,
                    size: Sizes.iconSm,
                  ),
                  Gap(5),
                  GestureDetector(
                    onTap: () {
                      // Handle add to cart action here and check if the product is already in the cart
                      if (!cartProvider.isInCart(product)) {
                        cartProvider.addToCart(product);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${product.name} added to cart!"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "${product.name} is already in the cart!",
                            ),
                          ),
                        );
                      }
                    },

                    child: Icon(Iconsax.shopping_cart, size: Sizes.iconSm + 4),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
