import 'package:get/get.dart';
import '../../pages/authentication_page/common/authentication_page_binding.dart';
import '../../pages/authentication_page/views/authentication_page.dart';
import '../../pages/card_management/card_form_page/common/card_form_page_binding.dart';
import '../../pages/card_management/card_form_page/views/card_form_page.dart';
import '../../pages/card_management/card_preview_page/common/card_preview_page_binding.dart';
import '../../pages/card_management/card_preview_page/views/card_page_preview.dart';
import '../../pages/edit_profile_page/common/edit_profile_page_binding.dart';
import '../../pages/edit_profile_page/views/edit_profile_page.dart';
import '../../pages/electronic_signature_page/common/electronic_signature_page_binding.dart';
import '../../pages/electronic_signature_page/views/electronic_signature_page.dart';
import '../../pages/near_jobs_page/commons/near_jobs_page_bindings.dart';
import '../../pages/near_jobs_page/views/near_jobs_page.dart';
import '../../pages/notifications_setting_page/common/notification_setting_page_binding.dart';
import '../../pages/notifications_setting_page/views/notifications_setting.dart';
import '../utils/constants/nested_keys.dart';
import 'route_names.dart';

class NestedRoutePages {
  Map<int, List<GetPageRoute<dynamic>>> get nestedPages => {
        nestedKeys.jobsListNestedKey: _jobListPages(),
        nestedKeys.balanceNestedKey: [],
        nestedKeys.accountNestedKey: _accountPages(),
      };

  List<GetPageRoute<dynamic>> _accountPages() => [
        GetPageRoute(
          routeName: routeNames.notificationSetting,
          page: NotificationSettingPage.new,
          binding: NotificationSettingPageBinding(),
        ),
        GetPageRoute(
          routeName: routeNames.editProfile,
          page: EditProfilePage.new,
          binding: EditProfilePageBinding(),
        ),
        GetPageRoute(
          routeName: routeNames.cardPreview,
          page: CardPreviewPage.new,
          binding: CardPreviewPageBinding(),
        ),
        GetPageRoute(
          routeName: routeNames.cardForm,
          page: CardFormPage.new,
          binding: CardFormPageBinding(),
        ),
        GetPageRoute(
          routeName: routeNames.authentication,
          page: AuthenticationPage.new,
          binding: AuthenticationPageBinding(),
        ),
      ];

  List<GetPageRoute<dynamic>> _jobListPages() => [
        GetPageRoute(
          routeName: routeNames.nearJobs,
          page: NearJobsPage.new,
          binding: NearJobsPageBinding(),
        ),
        GetPageRoute(
          routeName: routeNames.electronicSignature,
          page: ElectronicSignaturePage.new,
          binding: ElectronicSignaturePageBinding(),
        ),
      ];
}

final nestedRoutePages = NestedRoutePages();
