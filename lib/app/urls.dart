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
  static final String popularProductUrl = '$_baseUrl/products?category=67c35af85e8a445235de197b';
  static final String newProductUrl = '$_baseUrl/products?category=67cd33432e43d538695ea4bc';
  static final String specialProductUrl = '$_baseUrl/products?category=67c35b395e8a445235de197e';

  static final String addToCart = '$_baseUrl/cart';
  static final String getCart = '$_baseUrl/cart';
  static  String deleteCart(String cartId) => '$_baseUrl/cart/$cartId';
}