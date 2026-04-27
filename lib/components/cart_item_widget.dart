import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:just_eccomerce_app/data/cart_item_model.dart';
import 'package:just_eccomerce_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/exports.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.cartItem,

    // required this.onRemove,
  });

  final CartItemModel cartItem;

  //  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Sizes.md),
      margin: EdgeInsets.only(bottom: Sizes.sm, top: Sizes.md),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.borderPrimary, width: 1),
        borderRadius: BorderRadius.circular(Sizes.borderRadiusMd),
        // color: AppColor.kbgColor2,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.borderRadiusMd),
            child: CachedNetworkImage(
              imageUrl: cartItem.product.image,
              fit: BoxFit.cover,
              height: Sizes.productImageSize,
              width: Sizes.productImageSize,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(color: Colors.grey),
              ),
              errorWidget: (context, url, error) => Icon(Iconsax.image),
            ),
          ),
          Gap(Sizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.name,
                  style: style(
                    fontSize: Sizes.fontSizeMd,
                    color: AppColor.kTextStyleColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(Sizes.xs),
                Text(
                  " ${cartItem.product.description}",
                  style: style(
                    fontSize: Sizes.fontSizeSm,
                    color: AppColor.kTextStyleColorGray,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(Sizes.xs),
                Text(
                  formatCurrency(cartItem.product.price.toString()),
                  // formatCurrency(cartItem.product.price.toString()),
                  style: style(
                    fontSize: Sizes.fontSizeMd,
                    color: AppColor.kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Provider.of<CartProvider>(
                        context,
                        listen: false,
                      ).decrementQuantity(cartItem.product);
                    },
                    icon: Icon(Iconsax.minus, size: Sizes.iconSm),
                  ),
                  Text(
                    '${cartItem.quantity}',
                    style: style(
                      fontSize: Sizes.fontSizeMd,
                      color: AppColor.kTextStyleColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<CartProvider>(
                        context,
                        listen: false,
                      ).incrementQuantity(cartItem.product);
                    },
                    icon: Icon(Iconsax.add, size: Sizes.iconSm),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Provider.of<CartProvider>(
                    context,
                    listen: false,
                  ).removeFromCart(cartItem.product);
                },
                icon: Icon(
                  Iconsax.trash,
                  color: Colors.red,
                  size: Sizes.iconSm,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
