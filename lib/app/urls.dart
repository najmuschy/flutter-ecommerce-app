class Urls{

  static final String _baseUrl = 'https://ecom-rs8e.onrender.com/api' ;
  static final String signUpUrl = '$_baseUrl/auth/signup';
  static final String verifyOtpUrl = '$_baseUrl/auth/verify-otp';
  static final String loginUrl = '$_baseUrl/auth/login';


  static final String slidesUrl = '$_baseUrl/slides';
  static final String categoriesUrl = '$_baseUrl/categories';
  static String categoryListUrl(int count, int currentPage) => '$_baseUrl/categories?count=$count&page=$currentPage';
  static String productListByCategoryUrl(int count, int currentPage, String categoryId) => '$_baseUrl/products?count=$count&page=$currentPage&category=$categoryId';
  static String productListUrl = '$_baseUrl/products';
}