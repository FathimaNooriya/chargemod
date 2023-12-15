class ApiEndPoints {
  static String baseUrl =
      'https://as-uat.console.chargemod.com/temporary/sde1flutterATSR';
  static String organizationId = '/64941897fdb322dbf94ad2b8';
  static String projectId = '/6494141957d29409895704d2';
  static String inventoryStock = '/1.0.0';

  static String signIn = '/signIn';
  static String resendOTP = '/resend';
  static String verifyOTP = '/verify';
  static String registerUserDetails = '/register';
  static String refreshToken = '/refresh';
  static String getUserDetails = '/get-customer';
  static String logout = '/logout';

  static String healthCheckAPI = 'https://as-uat.console.chargemod.com/health';
  static String getAllLocation =
      '/8.5465282/76.9151412/all-locations?limit=10&page=1';
  static String getAllLocation2 =
      "/:latitude/:longitude/all-locations?limit=10&page=1";
}
