import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_admin/core/theme/app_colors.dart';
import 'package:real_estate_admin/core/ui/app_text_styles.dart';

class AddWidgetScreen extends StatelessWidget {
  const AddWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 30,width: 30,),
                Text("Add Widget", style: AppTextStyles.headerText(context)),
                ClipOval(
                  child: Material(
                    color: Colors.grey.shade300,
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () => context.pop(),
                      child: const SizedBox(
                        width: 30,
                        height: 30,
                        child: Icon(Icons.close,color: Colors.black,size: 24,),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const TextField()
          ]),
        ),
      ),
    );
  }
}
