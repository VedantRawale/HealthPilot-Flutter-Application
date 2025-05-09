import 'package:flutter/material.dart';
import 'package:health_pilot/features/packages_feature/presentation/widgets/packageitem_addtocart_button.dart';
import 'package:health_pilot/features/packages_feature/presentation/widgets/title_widget.dart';
import 'package:health_pilot/features/packages_feature/presentation/widgets/view_more_button.dart';
import 'package:provider/provider.dart';

import '../../../../business/entities/products.dart';
import '../../../../core/constants/constants.dart';
import 'description_widget.dart';
import 'medicine_and_safeicon_widget.dart';

class PackageCard extends StatefulWidget {
  final Product product;
  const PackageCard({required this.product, super.key});

  @override
  State<PackageCard> createState() => _PackageCardState();
}

class _PackageCardState extends State<PackageCard> {
  @override
  Widget build(BuildContext context) {
    List<String> firstThreeLines =
        widget.product.description.split('\n').take(3).toList();
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Card(
          elevation: 4,
          child: Container(
              width: 270,
              height: 200,

              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const MedicineAndSafeIconWidget(),
                  const SizedBox(height: 5),
                  TitleWidget(product: widget.product),
                  const SizedBox(height: 5),
                  DescriptionWidget(firstThreeLines: firstThreeLines),
                  const SizedBox(height: 5),
                  const ViewMoreButton(),
                  const SizedBox(height: 2),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Row(
                          children: [
                            Text(
                              '$rupeecode ${widget.product.discountprice}/-',
                              style: const TextStyle(
                                color: kColor2,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 30),
                            PackageItemAddToCartButton(
                              product: widget.product,
                            ),
                          ],
                        ),
                      )),
                ],
              )),
        ));
  }
}
