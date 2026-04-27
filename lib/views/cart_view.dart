import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:just_eccomerce_app/components/cart_item_widget.dart';
import 'package:just_eccomerce_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../utils/exports.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return Scaffold(
          appBar: AppBar(
            actionsPadding: EdgeInsets.symmetric(horizontal: Sizes.md),
            backgroundColor: AppColor.kPrimaryColor,
            centerTitle: true,
            iconTheme: IconThemeData(color: AppColor.kbgColor2),
            title: Text(
              Texts.appBarTextCart,
              style: style(
                fontSize: Sizes.fontSizeLg + 2,
                color: AppColor.kbgColor2,
              ),
            ),
            actions: [
              cartProvider.cartItems.isEmpty
                  ? SizedBox()
                  : IconButton(
                      onPressed: () {
                        cartProvider.clearCart();
                      },
                      icon: Icon(
                        Iconsax.shop_remove,
                        color: AppColor.kbgColor2,
                        size: Sizes.iconMd,
                      ),
                    ),
            ],
          ),
          body: cartProvider.cartItems.isEmpty
              ? Center(
                  child: Text(
                    'Your cart is empty',
                    style: style(
                      fontSize: Sizes.fontSizeMd,
                      color: AppColor.kTextStyleColor,
                    ),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.sm + 2,
                        ),
                        itemCount: cartProvider.cartItems.length,
                        itemBuilder: (context, index) {
                          final cartItem = cartProvider.cartItems[index];
                          return CartItemWidget(cartItem: cartItem);
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(Sizes.md),
                      decoration: BoxDecoration(
                        color: AppColor.kbgColor2,
                        border: Border(
                          top: BorderSide(color: AppColor.borderPrimary),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Quantity:',
                                style: style(
                                  fontSize: Sizes.fontSizeLg,
                                  color: AppColor.kTextStyleColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                cartProvider.totalItems.toString(),
                                style: style(
                                  fontSize: Sizes.fontSizeLg,
                                  color: AppColor.kPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Gap(Sizes.md),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total:',
                                style: style(
                                  fontSize: Sizes.fontSizeLg,
                                  color: AppColor.kTextStyleColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                formatCurrency(
                                  cartProvider.totalPrice.toString(),
                                ),
                                style: style(
                                  fontSize: Sizes.fontSizeLg,
                                  color: AppColor.kPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Gap(Sizes.md),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigate to checkout or show message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Checkout not implemented yet',
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.kPrimaryColor,
                                padding: EdgeInsets.symmetric(
                                  vertical: Sizes.md,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.borderRadiusMd,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Checkout',
                                style: style(
                                  fontSize: Sizes.fontSizeMd,
                                  color: AppColor.kbgColor2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
