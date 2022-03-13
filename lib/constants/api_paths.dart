class ApiPaths {
  static const String baseUrl = "http://10.0.2.2:8000/";
  static const String registerUrl = baseUrl + "user/register";
  static const String loginUrl = baseUrl + "user/login";
  static const String getAllPostsUrl = baseUrl + "post/get";
  static const String getMyPostsUrl = baseUrl + "post/my_post";
  static const String createPostUrl = baseUrl + "post/create_post";

  static const String getAllStoryUrl = baseUrl + "story/get";
  static const String createStoryUrl = baseUrl + "story/create";

  static const String myWalletUrl = baseUrl + "wallet/get";

  static const String donationUrl = baseUrl + "donation/create";

  static const String notificationsURl = baseUrl + "notification/get";
}
