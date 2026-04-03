import 'package:go_router/go_router.dart';

import '../constants/route_constants.dart';
import 'router_guards.dart';

import '../../features/onboarding/presentation/screens/splash_screen.dart';
import '../../features/onboarding/presentation/screens/welcome_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_wrapper_screen.dart';
import '../../features/onboarding/presentation/screens/step1_owner_profile_screen.dart';
import '../../features/onboarding/presentation/screens/step2_add_building_screen.dart';
import '../../features/onboarding/presentation/screens/step3_add_rooms_screen.dart';
import '../../features/onboarding/presentation/screens/step4_electricity_settings_screen.dart';
import '../../features/onboarding/presentation/screens/step5_all_set_screen.dart';
import '../../features/dashboard/presentation/screens/owner_dashboard_screen.dart';
import '../../features/buildings/presentation/screens/buildings_list_screen.dart';
import '../../features/buildings/presentation/screens/building_detail_screen.dart';
import '../../features/tenants/presentation/screens/tenants_list_screen.dart';
import '../../features/tenants/presentation/screens/tenant_profile_screen.dart' as owner_tenant;
import '../../features/tenants/presentation/screens/add_edit_tenant_screen.dart';
import '../../features/rent/presentation/screens/rent_collection_screen.dart';
import '../../features/electricity/presentation/screens/electricity_screen.dart';
import '../../features/electricity/presentation/screens/bill_review_screen.dart';
import '../../features/reports/presentation/screens/reports_screen.dart';
import '../../features/owner_settings/presentation/screens/owner_settings_screen.dart';
import '../../features/tenant_app/presentation/screens/tenant_home_screen.dart';
import '../../features/tenant_app/presentation/screens/tenant_bills_screen.dart';
import '../../features/tenant_app/presentation/screens/tenant_profile_screen.dart' as tenant_app;
import '../../shared/widgets/scaffold_with_owner_nav_bar.dart';
import '../../shared/widgets/scaffold_with_tenant_nav_bar.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';

GoRouter get appRouter => GoRouter(
      initialLocation: kSplashRoute,
      redirect: (context, state) {
        // TODO: wire Firebase auth and user role provider.
        const isAuthenticated = true; // Temporarily true for UI preview Phase 3
        const isOwner = true;

        final authRedirect = RouterGuards.checkAuthRedirect(
          isAuthenticated: isAuthenticated,
          currentPath: state.matchedLocation,
        );
        if (authRedirect != null) return authRedirect;

        if (state.matchedLocation == '/') {
          return RouterGuards.checkRoleRedirect(isOwner: isOwner);
        }
        return null;
      },
      routes: [
        GoRoute(path: kSplashRoute, name: 'splash', builder: (_, __) => const SplashScreen()),
        GoRoute(path: kWelcomeRoute, name: 'welcome', builder: (_, __) => const WelcomeScreen()),
        GoRoute(path: kLoginRoute, name: 'login', builder: (_, __) => const LoginScreen()),
        GoRoute(path: kSignupRoute, name: 'signup', builder: (_, __) => const SignupScreen()),

        ShellRoute(
          builder: (context, state, child) => ScaffoldWithOwnerNavBar(child: child),
          routes: [
            GoRoute(path: kOwnerDashboardRoute, name: 'owner-dashboard', builder: (_, __) => const OwnerDashboardScreen()),
            GoRoute(path: kBuildingsRoute, name: 'buildings', builder: (_, __) => const BuildingsListScreen()),
            GoRoute(path: kBuildingDetailRoute, name: 'building-detail', builder: (_, __) => const BuildingDetailScreen()),
            GoRoute(path: kTenantsRoute, name: 'tenants', builder: (_, __) => const TenantsListScreen()),
            GoRoute(path: kOwnerTenantProfileRoute, name: 'owner-tenant-profile', builder: (_, __) => const owner_tenant.TenantProfileScreen()),
            GoRoute(path: kAddTenantRoute, name: 'add-tenant', builder: (_, __) => const AddEditTenantScreen()),
            GoRoute(path: kRentRoute, name: 'rent-collection', builder: (_, __) => const RentCollectionScreen()),
            GoRoute(path: kElectricityRoute, name: 'electricity', builder: (_, __) => const ElectricityScreen()),
            GoRoute(path: kBillReviewRoute, name: 'bill-review', builder: (_, __) => const BillReviewScreen()),
            GoRoute(path: kReportsRoute, name: 'reports', builder: (_, __) => const ReportsScreen()),
            GoRoute(path: kOwnerSettingsRoute, name: 'owner-settings', builder: (_, __) => const OwnerSettingsScreen()),
          ],
        ),

        GoRoute(path: kOnboardingRoute, name: 'onboarding', builder: (_, __) => const OnboardingWrapperScreen()),
        GoRoute(path: kOnboardingStep1Route, name: 'onboarding-step1', builder: (_, __) => const Step1OwnerProfileScreen()),
        GoRoute(path: kOnboardingStep2Route, name: 'onboarding-step2', builder: (_, __) => const Step2AddBuildingScreen()),
        GoRoute(path: kOnboardingStep3Route, name: 'onboarding-step3', builder: (_, __) => const Step3AddRoomsScreen()),
        GoRoute(path: kOnboardingStep4Route, name: 'onboarding-step4', builder: (_, __) => const Step4ElectricitySettingsScreen()),
        GoRoute(path: kOnboardingStep5Route, name: 'onboarding-step5', builder: (_, __) => const Step5AllSetScreen()),

        ShellRoute(
          builder: (context, state, child) => ScaffoldWithTenantNavBar(child: child),
          routes: [
            GoRoute(path: kTenantHomeRoute, name: 'tenant-home', builder: (_, __) => const TenantHomeScreen()),
            GoRoute(path: kTenantBillsRoute, name: 'tenant-bills', builder: (_, __) => const TenantBillsScreen()),
            GoRoute(path: kTenantProfileRoute, name: 'tenant-profile', builder: (_, __) => const tenant_app.TenantProfileScreen()),
          ],
        ),
      ],
    );
