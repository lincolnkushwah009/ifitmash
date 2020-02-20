import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppConfig{
  static final String apiUrl = "https://ifitmash.club/api/";
//      "http://ec2-18-221-64-116.us-east-2.compute.amazonaws.com:9090/qualityOnlinePrice/";

//   static final String apiUrl = 'https://800mycoke.ae/app/';
  static final String workout='searchWorkout';
  static final String invoice="services/invoice.jsp";
  static final String termsAndConditions="services/getTermsAndCondition.jsp";
  static final String changePassword="services/changePassword.jsp";
  static final String loginAction = "services/LoginAction.jsp";
  static final String forgotPasswordAction = "services/forgetPasswordAction.jsp";
  static final String productDataAction = "services/product.jsp";
  static final String placeOrderAction = "services/generateOrder.jsp";
  static final String trackOrderAction = 'services/orderscreen.jsp';
  static final String specialProducts = 'services/specialProduct.jsp';
  static final String yourOfferApi = "services/getAllOffers.jsp";
  static final String reedemDataApi = "services/redeemResources.jsp";
  static final String reedemPlaceOrderApi = "services/redeemRequest.jsp";
  static final String updateCustomerDetailsApi = 'services/updateCustomerDetails.jsp';
  static final String updateCustomerImageApi = 'services/UDCustomerAction.jsp';
  static final String updateTermsConditionApi = 'services/accepTermsAndCondition.jsp';
  static final String loadOnlinePricingApi = 'services/pricing.jsp';
  static final String fcmTokenPushToApi = 'services/fcm.jsp';
  static final String noticications = 'services/notificationLogs.jsp';

  static final cokeColor = new Color.fromRGBO(224, 19, 26, 1);
  static final listMenuHeaderBackColor = new Color.fromRGBO(234, 235, 237, 1);
  static final listMenuHeaderBackDownColor = new Color.fromRGBO(255, 255, 255, 1);
  static final thumsUpColor = new Color.fromRGBO(14, 37, 104, 1);
  static final myofferColor = new Color.fromRGBO(255, 255, 255, 1);
  static final profileColor = new Color.fromRGBO(193, 193, 193, 1);
  static final profileFooterColor = new Color.fromRGBO(220, 220, 220, 1);

  static var homeObject;

  // User Details
  static String userID = "";
  static String workoutId='';
  static String loginData = "";
  static Map<String, dynamic> brand_details;
  static Map<String, dynamic> productDetails;
  static Map<String, dynamic> termeAndConditions = {};
  static var cartIndex = 0;

  static BuildContext buyContext;

  static Map<String, dynamic> customer_details;

  static var customer_list;

  static BuildContext notifiationContext;

  static bool storeVisible = false;

  static var offerClickId;

  static var context;

  static Map<String, dynamic> creditProcess;
  static Map<String, dynamic> moqDetails;

  static var loadLocalImage = false;
  static var image;
  static bool showTC = false;

  static var minRedeemRewards = 0;
  static String date;

  static Map<String, dynamic> sliderImages;

  static var loyaltyPointsFlag;
  static var salesorg;
  static var dddFlag;
  static var onlinePrice;
  static var alternateBrandCode;
  static var alternateBrandCodeSelect;
  static var beforeCutOff;
  static var defaultDDBefore;
  static var standardDate;
  static var defaultDDAfter;
  static var dateSelected;
  static var afterCutOff;
  static var deliveryDate;
  static var cutoff;
  static var disChannel10;
  static var disChannel30;
  static var disChannel40;
  static var alternateEmail;
  static var httpStatusCodeRec;
}