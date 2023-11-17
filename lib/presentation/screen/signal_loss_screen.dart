import 'package:flutter/material.dart';
import 'package:movie_list_app/common/theme/app_colors.dart';
import 'package:movie_list_app/generated/l10n.dart';

import 'package:movie_list_app/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:movie_list_app/presentation/widget/button/custom_elevated_button.dart';

class SignalLossScreen extends StatelessWidget {
  static const routeName = '/signalLoss';

  const SignalLossScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(
        context,
      ),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final TextStyle? titleStyle = Theme.of(context).textTheme.titleLarge;
    return CustomAppBar(
      title: Text(S.of(context).popular, style: titleStyle),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: GestureDetector(
            onTap: () => (),
            child: const Icon(
              Icons.search,
              color: AppColors.colorBlueIcon,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }

  Center _buildBody(context) {
    final errorTextTheme = Theme.of(context).textTheme.bodySmall;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(
            Icons.cloud_off_rounded,
            size: 100,
            color: AppColors.colorBlueIcon,
          ),
          Text(
            'Произошла ошибка при загрузке данных,\n проверьте подключение к сети',
            textAlign: TextAlign.center,
            style: errorTextTheme,
          ),
          const SizedBox(
            height: 40,
          ),
          CustomElevatedButton(
            title: 'Повторить',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
