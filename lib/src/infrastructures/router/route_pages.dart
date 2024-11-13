import 'package:get/get.dart';

import '../../pages/dashboard/commons/dashboard_page_bindings.dart';
import '../../pages/dashboard/views/dashboard_page.dart';
import '../../pages/introduction_page/common/introduction_page_binding.dart';
import '../../pages/introduction_page/views/introduction_page.dart';
import '../../pages/login/common/login_page_binding.dart';
import '../../pages/login/view/login_page.dart';
import '../../pages/sign_up_pages/code_confirmation_page/common/confirmation_code_page_binding.dart';
import '../../pages/sign_up_pages/code_confirmation_page/views/confirmation_code_page.dart';
import '../../pages/sign_up_pages/phone_confirmation_page/common/phone_confirmation_page_binding.dart';
import '../../pages/sign_up_pages/phone_confirmation_page/views/phone_confirmation_page.dart';
import '../../pages/sign_up_pages/sign_up/common/sign_up_page_binding.dart';
import '../../pages/sign_up_pages/sign_up/views/sign_up_page.dart';
import '../../pages/splash/common/splash_bindings.dart';
import '../../pages/splash/view/splash_page_view.dart';
import 'route_names.dart';

class RoutePages {
  final String initialRoute = routeNames.splash;

  final List<GetPage<dynamic>> pages = [
    GetPage(
      binding: SplashBinding(),
      name: routeNames.splash,
      page: SplashPage.new,
    ),
    GetPage(
      name: routeNames.introduction,
      page: IntroductionPage.new,
      binding: IntroductionPageBinding(),
    ),
    GetPage(
      name: routeNames.phoneConfirmation,
      page: PhoneConfirmationPage.new,
      binding: PhoneConfirmationPageBinding(),
    ),
    GetPage(
      name: routeNames.confirmationCode,
      page: ConfirmationCodePage.new,
      binding: ConfirmationCodePageBinding(),
    ),
    GetPage(
      name: routeNames.signUp,
      page: SignUpPage.new,
      binding: SignUpBinding(),
    ),
    GetPage(
      name: routeNames.login,
      page: LoginPage.new,
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: routeNames.dashboard,
      page: DashboardPage.new,
      binding: DashboardPageBinding(),
    ),
  ];
}

final routePages = RoutePages();
