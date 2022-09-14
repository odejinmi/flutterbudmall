import '../constant/custom_alert_dialog.dart';
import 'method.dart';

Future<String> getcountries() async {
  const endpoint = "countries";
  return await getApiCall(endpoint);
}

Future<String> sendcode(jsonBody) async {
  const endpoint = "sendcode";
  return await postApiCall(jsonBody, endpoint);
}

Future<String> usernamecheck(jsonBody) async {
  const endpoint = "username-check";
  return await postApiCall(jsonBody, endpoint);
}

Future<String> createAccount(jsonBody) async {
  const endpoint = "register";
  return await postApiCall(jsonBody, endpoint);
}

Future<String> authAccount(jsonBody) async {
  const endpoint = "sdkLogin";
  return await postApiCall(jsonBody, endpoint);
}

Future<String> forgetpasswordrequest(jsonBody) async {
  const endpoint = "password/email";
  return await postApiCall(jsonBody, endpoint);
}

Future<String> verifyCode(jsonBody) async {
  const endpoint = "password/verify-code";
  return await postApiCall(jsonBody, endpoint);
}

Future<String> forgetpassword(jsonBody) async {
  const endpoint = "password/reset";
  return await postApiCall(jsonBody, endpoint);
}

Future<String> dashboard() async {
  var endpoint = "user/dashboard";
  return await getApiCallTokenized(endpoint);
}

Future<String> sliders() async {
  var endpoint = "sliders";
  return await getApiCallTokenized(endpoint);
}

Future<String> removewishlist(id) async {
  var endpoint = "user/wishlist/remove/$id";
  return await getApiCallTokenized(endpoint);
}

Future<String> removecart(id) async {
  var endpoint = "user/remove_cart_item/$id";
  return await getApiCallTokenized(endpoint);
}

Future<String> getwishlist() async {
  var endpoint = "user/get_wishlist_data";
  return await getApiCallTokenized(endpoint);
}

Future<String> getcart() async {
  var endpoint = "user/cart";
  return await getApiCallTokenized(endpoint);
}

Future<String> getorders() async {
  var endpoint = "user/orders";
  return await getApiCallTokenized(endpoint);
}

Future<String> getbuydata() async {
  var endpoint = "user/buy-data";
  return await getApiCallTokenized(endpoint);
}

Future<String> getcabletv() async {
  var endpoint = "user/cabletv";
  return await getApiCallTokenized(endpoint);
}

Future<String> getpower() async {
  var endpoint = "user/power";
  return await getApiCallTokenized(endpoint);
}

Future<String> getaddress() async {
  var endpoint = "user/address";
  return await getApiCallTokenized(endpoint);
}

Future<String> getwalletbalance() async {
  var endpoint = "user/wallet/balance";
  return await getApiCallTokenized(endpoint);
}

Future<String> gettransaction() async {
  var endpoint = "user/transactions";
  return await getApiCallTokenized(endpoint);
}

Future<String> addwishlist(jsonBody) async {
  const endpoint = "user/add_to_wishlist";
  return await postApiCallTokenized(jsonBody, endpoint);
}

Future<String> addcart(jsonBody) async {
  const endpoint = "user/addToCart";
  return await postApiCallTokenized(jsonBody, endpoint);
}

Future<String> productDetail(id) async {
  var endpoint = "user/productDetails/${id}";
  return await getApiCallTokenized(endpoint);
}

Future<String> buyairtime(jsonBody) async {
  const endpoint = "user/buy-airtime";
  return await postApiCallTokenized(jsonBody, endpoint);
}

Future<String> buydata(jsonBody) async {
  const endpoint = "user/buy-data";
  return await postApiCallTokenized(jsonBody, endpoint);
}

Future<String> shippingfee(jsonBody) async {
  const endpoint = "user/shippingFee";
  return await postApiCallTokenized(jsonBody, endpoint);
}

Future<String> checkout(jsonBody) async {
  const endpoint = "user/checkout";
  return await postApiCallTokenized(jsonBody, endpoint);
}

Future<String> validateiuc(jsonBody) async {
  const endpoint = "user/validate-iuc";
  return await postApiCallTokenized(jsonBody, endpoint);
}

Future<String> validatemeter(jsonBody) async {
  const endpoint = "user/validate-meter";
  return await postApiCallTokenized(jsonBody, endpoint);
}

Future<String> paycabletv(jsonBody) async {
  const endpoint = "user/pay-cabletv";
  return await postApiCallTokenized(jsonBody, endpoint);
}

Future<String> address(jsonBody) async {
  const endpoint = "user/address";
  return await postApiCallTokenized(jsonBody, endpoint);
}

showCommonError(message, context) {
  CustomAlertDialogloader(
      context: context,
      title: "Whoops!!",
      message: message,
      negativeBtnText: 'Dismiss',
      onPostivePressed: () {},
      onNegativePressed: () {});
}

showCommonSuccess(message, context) {
  CustomAlertDialogloader(
      context: context,
      title: "Hurray!!!",
      message: message,
      negativeBtnText: 'Dismiss',
      onPostivePressed: () {},
      onNegativePressed: () {});
}

showCommonInfo(message, context) {
  CustomAlertDialogloader(
      context: context,
      title: "",
      message: message,
      negativeBtnText: 'Dismiss',
      onPostivePressed: () {},
      onNegativePressed: () {});
}
