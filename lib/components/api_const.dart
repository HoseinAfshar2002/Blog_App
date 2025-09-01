class ApiConst {
  static const hostDlUrl = "https://techblog.sasansafari.com";

  static const hostAddress = "https://techblog.sasansafari.com/Techblog/api";
  static const baseUrl = "$hostAddress/";

  static const getHomeItems = "${baseUrl}home/?command=index";
  static const getBlogListItems = "${baseUrl}article/get.php?command=new&user_id=";
  static const postRegister = "${baseUrl}register/action.php";
  static const publishByMe = "${baseUrl}article/get.php?command=published_by_me&user_id=";

}
