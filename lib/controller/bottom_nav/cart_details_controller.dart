
import 'package:bnb_clean/backend/utils/custom_snackbar.dart';
import 'package:bnb_clean/utils/basic_screen_imports.dart';
import 'package:get/get.dart';

import '../../backend/model/cart/service_success_model.dart';
import '../../backend/services/cart_service.dart';
import 'price_controller.dart';
import 'shopping_cart_controller.dart';

class CartDetailsController extends GetxController with CartService{

  final shoppingCartController = Get.find<ShoppingCartController>();
  final priceController = Get.find<PriceController>();


  RxBool bnbServiceEnable = true.obs;
  List airbnbArray = [];

  RxBool lineHireEnable = true.obs;
  List lineHireArray = [];

  RxBool midstayEnable = true.obs;
  List midStayArray = [];

  RxBool productAndBundleEnable = false.obs;
  List productArray = [];

  RxBool otherServiceEnable = false.obs;
  List optionalsArray = [];


  // Initially enabling the first three services
  void initializeServices() {
    bnbServiceEnable.value = true;
    lineHireEnable.value = true;
    midstayEnable.value = true;
    productAndBundleEnable.value = false;
    otherServiceEnable.value = false;

    totalServices = [];
    totalPrice.value = 0.0;
    onlyLineSelected = 0;
    submitEnable.value = false;

    for (var e in priceController.priceListModel.airbnbCleanings) {
      airbnbArray.add(0);
    }
    for (var e in priceController.priceListModel.linenHires) {
      lineHireArray.add(0);
    }
    for (var e in priceController.priceListModel.midCleanings) {
      midStayArray.add(0);
    }
    for (var e in priceController.priceListModel.products) {
      productArray.add(0);
    }
    for (var e in priceController.priceListModel.bundles) {
      optionalsArray.add(0);
    }
  }

  @override
  void onInit() {
    initializeServices();
    super.onInit();
  }

  void onAirbnbSelected(bool isSelected) {
    if (isSelected) {
      midstayEnable.value = false;
      productAndBundleEnable.value = true;
      otherServiceEnable.value = true;
      airbnbUpdateProcess();
    } else {
      initializeServices();
    }
  }

  void onMidstaySelected(bool isSelected) {
    if (isSelected) {
      bnbServiceEnable.value = false;
      midStayUpdateProcess();
    } else {
      initializeServices();
    }
  }

  void onLineHireSelected(bool isSelected) {

    if (isSelected) {
      productAndBundleEnable.value = true;
      otherServiceEnable.value = true;
      if(midstayEnable.value){
        bnbServiceEnable.value = false;
        midstayEnable.value = true;
      }else{
        bnbServiceEnable.value = true;
        midstayEnable.value = false;
      }
      lineUpdateProcess();
    } else {
      initializeServices();
    }
  }

  RxBool submitEnable = false.obs;
  List<ServiceSuccessModel> totalServices = [];
  RxDouble totalPrice = 0.0.obs;
  int onlyLineSelected = 0; /// if zero then it is only line hire

  /// ------------------------------------- >>
  final _isUpdateLoading = false.obs;
  bool get isUpdateLoading => _isUpdateLoading.value;


  late ServiceSuccessModel _airbnbUpdateModel;
  ServiceSuccessModel get airbnbUpdateModel => _airbnbUpdateModel;

  RxBool airbnbEnable = false.obs;
  List airbnbPrice = [];
  List airbnbQty = [];
  List airbnbName = [];

  ///* AirbnbUpdate in process
  Future<ServiceSuccessModel> airbnbUpdateProcess() async {
    _isUpdateLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      "price": airbnbPrice,
      "qty": airbnbQty,
      "name": airbnbName,
      "order_id": shoppingCartController.orderId,
      "date": shoppingCartController.selectedDate,
      "property_name": shoppingCartController.propertyName
    };
    await airbnbUpdateProcessApi(body: inputBody).then((value) {
      _airbnbUpdateModel = value!;

      onlyLineSelected ++;
      totalServices.add(_airbnbUpdateModel);
      if(_airbnbUpdateModel.success[2] != null){
        CustomSnackBar.error(_airbnbUpdateModel.success[2]);
      }
      else if(!submitEnable.value){
        CustomSnackBar.error("Please Select Line Hire.");
      }

      _isUpdateLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isUpdateLoading.value = false;
    update();
    return _airbnbUpdateModel;
  }


  /// ------------------------------------- >>
  late ServiceSuccessModel _lineUpdateModel;
  ServiceSuccessModel get lineUpdateModel => _lineUpdateModel;

  RxBool lineEnable = false.obs;
  List lineHirePrice = [];
  List lineHireQty = [];
  List lineHireName = [];

  ///* LineUpdate in process
  Future<ServiceSuccessModel> lineUpdateProcess() async {
    _isUpdateLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      "price": lineHirePrice,
      "qty": lineHireQty,
      "name": lineHireName,
      "order_id": shoppingCartController.orderId,
      "date": shoppingCartController.selectedDate,
      "property_name": shoppingCartController.propertyName
    };
    await lineUpdateProcessApi(body: inputBody).then((value) {
      _lineUpdateModel = value!;

      submitEnable.value = true;
      totalServices.add(_lineUpdateModel);

      _isUpdateLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isUpdateLoading.value = false;
    update();
    return _lineUpdateModel;
  }


  /// ------------------------------------- >>
  late ServiceSuccessModel _midStayUpdateModel;
  ServiceSuccessModel get midStayUpdateModel => _midStayUpdateModel;

  RxBool midStayEnable = false.obs;
  List midStayPrice = [];
  List midStayQty = [];
  List midStayName = [];

  ///* MidStayUpdate in process
  Future<ServiceSuccessModel> midStayUpdateProcess() async {
    _isUpdateLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      "price": midStayPrice,
      "qty": midStayQty,
      "name": midStayName,
      "order_id": shoppingCartController.orderId,
      "date": shoppingCartController.selectedDate,
      "property_name": shoppingCartController.propertyName
    };
    await midStayUpdateProcessApi(body: inputBody).then((value) {
      _midStayUpdateModel = value!;

      onlyLineSelected ++;
      submitEnable.value = true;
      totalServices.add(_midStayUpdateModel);

      _isUpdateLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isUpdateLoading.value = false;
    update();
    return _midStayUpdateModel;
  }


  /// ------------------------------------- >>
  late ServiceSuccessModel _productAndBundleUpdateModel;
  ServiceSuccessModel get productAndBundleUpdateModel => _productAndBundleUpdateModel;

  RxBool proAndBundleEnable = false.obs;
  List productAndBundlePrice = [];
  List productAndBundleQty = [];
  List productAndBundleName = [];

  ///* ProductAndBundleUpdate in process
  Future<ServiceSuccessModel> productAndBundleUpdateProcess() async {
    _isUpdateLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      "price": productAndBundlePrice,
      "qty": productAndBundleQty,
      "name": productAndBundleName,
      "order_id": shoppingCartController.orderId,
      "date": shoppingCartController.selectedDate,
      "property_name": shoppingCartController.propertyName
    };
    await productAndBundleUpdateProcessApi(body: inputBody).then((value) {
      _productAndBundleUpdateModel = value!;

      onlyLineSelected ++;
      submitEnable.value = true;
      totalServices.add(_productAndBundleUpdateModel);

      _isUpdateLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isUpdateLoading.value = false;
    update();
    return _productAndBundleUpdateModel;
  }


  /// ------------------------------------- >>
  late ServiceSuccessModel _othersUpdateModel;
  ServiceSuccessModel get othersUpdateModel => _othersUpdateModel;

  RxBool optionalsEnable = false.obs;
  List optionalsPrice = [];
  List optionalsQty = [];
  List optionalsName = [];

  ///* OthersUpdate in process
  Future<ServiceSuccessModel> optionalsUpdateProcess() async {
    _isUpdateLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      "price": optionalsPrice,
      "qty": optionalsQty,
      "name": optionalsName,
      "order_id": shoppingCartController.orderId,
      "date": shoppingCartController.selectedDate,
      "property_name": shoppingCartController.propertyName
    };
    await othersUpdateProcessApi(body: inputBody).then((value) {
      _othersUpdateModel = value!;

      onlyLineSelected ++;
      submitEnable.value = true;
      totalServices.add(_othersUpdateModel);

      _isUpdateLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isUpdateLoading.value = false;
    update();
    return _othersUpdateModel;
  }
}