class RouterGuards {
  static String? checkAuthRedirect({required bool isAuthenticated, required String currentPath}) {
    if (!isAuthenticated &&
        currentPath != '/login' &&
        currentPath != '/signup' &&
        currentPath != '/welcome' &&
        currentPath != '/splash' &&
        !currentPath.startsWith('/onboarding')) {
      return '/login';
    }
    return null;
  }

  static String? checkRoleRedirect({required bool isOwner}) {
    if (isOwner) {
      return '/owner/dashboard';
    }
    return '/tenant/home';
  }
}
