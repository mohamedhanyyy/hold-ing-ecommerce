import 'package:ecommerce/features/categories/presentation/widgets/categories_widget.dart';
import 'package:ecommerce/features/home/presentation/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/strings.dart';
import '../../../../core/resources/styles.dart';
import '../widgets/products_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 35.h), child: HomeAppbar()),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
              child: Text(AppStrings.categories,style: blackTextW500Font14),
            ),
            CategoriesWidget(),
            Padding(
              padding: EdgeInsets.only(top: 36.h, bottom: 15.h),
              child: Text(AppStrings.products,style: blackTextW500Font17),
            ),
            ProductsWidget()
          ],
        ),
      ),
    );
  }
}
