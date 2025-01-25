import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/styles.dart';
import '../../../../shared/widgets/custom_loading_widget.dart';
import '../../cubit/get_categories_cubit.dart';
import '../../cubit/get_categories_state.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoryState>(
        builder: (context, state) {
      if (state is GetCategoryLoading) {
        return CustomLoadingWidget();
      } else if (state is GetCategoryDone) {
        return SizedBox(
          height: 100.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = state.categoriesModel[index];

              return Padding(
                 padding: EdgeInsetsDirectional.only(end: 12.w),
                child: Column(
                  children: [

                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                            width: 80,
                            height: 80,
                            imageUrl: '${category.image}')),
                    SizedBox(height: 8.h),
                    Text(
                      '${category.name}',
                      style: grey2TextW500Font12,
                    )
                  ],
                ),
              );
            },
            itemCount: state.categoriesModel.length,
            shrinkWrap: true,
          ),
        );
      }
      return SizedBox.shrink();
    });
  }
}
