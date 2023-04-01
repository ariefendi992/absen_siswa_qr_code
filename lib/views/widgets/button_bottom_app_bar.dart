import 'package:absen_siswa_qr_code/cubit/page/page_cubit.dart';
import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonAppBarWidget extends StatelessWidget {
  final String title;
  final IconData iconPrimary;
  final IconData iconSecondary;
  final int index;

  const ButtonAppBarWidget({
    super.key,
    required this.title,
    required this.iconPrimary,
    required this.iconSecondary,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Container(
          height: 60,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipOval(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: () {
                context.read<PageCubit>().setPage(index);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    context.read<PageCubit>().state == index
                        ? iconPrimary
                        : iconSecondary,
                    color: context.read<PageCubit>().state == index
                        ? kPrimaryColor
                        : kGreyColor,
                    size: 24,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: medium,
                      color: context.read<PageCubit>().state == index
                          ? kPrimaryColor
                          : kGreyColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
