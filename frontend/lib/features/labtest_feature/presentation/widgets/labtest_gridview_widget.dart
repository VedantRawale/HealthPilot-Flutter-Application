import 'package:flutter/material.dart';
import '../../../../business/entities/products.dart';
import 'labtest_griditem_widget.dart';

class LabTestGridView extends StatefulWidget {
  final List<Product> testList;
  const LabTestGridView({required this.testList, super.key});

  @override
  State<LabTestGridView> createState() => _LabTestGridViewState();
}

class _LabTestGridViewState extends State<LabTestGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.testList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return LabTestGridItem(product: widget.testList[index]);
        });
  }
}
