import 'package:flutter/material.dart';
import 'package:health_pilot/features/labtest_feature/presentation/widgets/subtitle_with_icon_widget.dart';
import 'package:health_pilot/features/labtest_feature/presentation/widgets/subtitle_with_prices_widget.dart';
import 'package:health_pilot/features/labtest_feature/presentation/widgets/titlecontainer_widget.dart';
import 'package:health_pilot/features/labtest_feature/presentation/widgets/viewdetails_button.dart';
import 'package:provider/provider.dart';

import '../../../../business/entities/products.dart';
import '../../../../core/constants/constants.dart';
import '../../../cart_feature/business/usecases/getcart.dart';
import 'addtocart_button.dart';

class LabTestGridItem extends StatefulWidget {
  final Product product;
  const LabTestGridItem({required this.product, super.key});

  @override
  State<LabTestGridItem> createState() => _LabTestGridItemState();
}

class _LabTestGridItemState extends State<LabTestGridItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
          alignment: Alignment.center,
          width: 150,
          height: 100,
          // color: Colors.red,
          child: Column(
            children: [
              TitleContainerWidget(product: widget.product),
              const SizedBox(height: 5),
              SubtitleWithIconWidget(product: widget.product),
              SubtitleWithPricesWidget(product: widget.product,),
              AddToCartButton(product: widget.product),
              ViewDetailsButton(),
            ],
          )),
    );
  }
}

