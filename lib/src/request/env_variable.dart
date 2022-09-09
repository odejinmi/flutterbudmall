// const url = "http://10.0.2.2:3030/"; //emulator
// const url = "http://192.168.100.19:3030/"; //local network
const url = "https://budmall.staging.5starcompany.com.ng/api/"; //test env
const imageurl = "https://budmall.ng/assets/images/"; //test env

const debug = true;

// String? token;

var abitID = "";

parseURL(uri) {
  var uu = Uri.parse(url + uri);
  print(uu);
  return uu;
}

parseImageURL(uri) {
  var uu = url + "public/" + uri;
  // print(uu);
  return uu;
}
