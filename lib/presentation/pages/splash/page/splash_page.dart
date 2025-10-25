import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_in/page/sign_in_page.dart';
import 'package:commerce_mobile/presentation/pages/home/home/page/home_page.dart';
import 'package:commerce_mobile/presentation/pages/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  static const String path = "/splash_page";

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: ProfileView(),
    );
  }
}


class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  WidgetsBinding get _binding => WidgetsBinding.instance;

  void _initState(_) {
    context.read<SplashBloc>().add(SplashFetchUserData());
  }

  @override
  void initState() {
    _binding.addPostFrameCallback(_initState);
    super.initState();
  }

  @override
  void deactivate() {
    context.read<SplashBloc>().add(SplashDispose());
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if(state.formzStatus.isSuccess) {
          if(DBService.isLoggedIn()) {
            NavigationService.go(context, HomePage.path);
          } else {
            NavigationService.go(context, SignInPage.path);
          }
        }
      },
      child: Scaffold(backgroundColor: AppColors.primary500),
    );
  }
}
