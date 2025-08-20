class ApiConst {
  static const hostDlUrl = "https://techblog.sasansafari.com";

  static const hostAddress = "https://techblog.sasansafari.com/Techblog/api";
  static const baseUrl = "$hostAddress/";

  static const getHomeItems = "${baseUrl}home/?command=index";
  static const getBlogItems = "${baseUrl}article/get.php?command=new&user_id=";
}
