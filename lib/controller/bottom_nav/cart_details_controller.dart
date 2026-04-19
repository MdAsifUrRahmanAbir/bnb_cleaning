import 'package:bnb_clean/backend/utils/custom_snackbar.dart';
import 'package:bnb_clean/utils/basic_screen_imports.dart';

import '../../backend/model/cart/service_success_model.dart';
import '../../backend/model/common/common_success_model.dart';
import '../../backend/services/cart_service.dart';
import 'price_controller.dart';
import 'shopping_cart_controller.dart';

class CartDetailsController extends GetxController with CartService {
  final shoppingCartController = Get.find<ShoppingCartController>();
  final priceController = Get.find<PriceController>();

  RxBool bnbServiceEnable = true.obs;
  List airbnbArray = [];

  // RxBool lineHireForAirBnb = false.obs;
  RxBool lineHireEnable = true.obs;
  RxBool lineHireClicked = false.obs;
  List lineHireArray = [];

  RxBool midstayEnable = true.obs;
  RxBool midstayClicked = false.obs;
  List midStayArray = [];

  RxBool productAndBundleEnable = false.obs;
  List productArray = [];

  RxBool otherServiceEnable = false.obs;
  List optionalsArray = [];

// @override
//   void dispose() {
//   initializeServices();
//     super.dispose();
//   }

  /// ------------------------------------- >>
  final _isDateUpdateLoading = false.obs;
  bool get isDateUpdateLoading => _isDateUpdateLoading.value;

  late CommonSuccessModel _cartDateUpdateModel;
  CommonSuccessModel get cartDateUpdateModel => _cartDateUpdateModel;

  ///* Get Cart Delete in process
  Future<CommonSuccessModel> cartDateUpdateProcess(int id, String date) async {
    _isDateUpdateLoading.value = true;
    update();

    await cartDateUpdateProcessApi(id.toString(), body: {"date": date})
        .then((value) {
          print(value);
      _cartDateUpdateModel = value!;

      _isDateUpdateLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isDateUpdateLoading.value = false;
    update();
    return _cartDateUpdateModel;
  }

  // Initially enabling the first three services
  void initializeServices() {
    // lineHireForAirBnb.value = false;
    bnbServiceEnable.value = true;
    lineHireEnable.value = true;
    midstayEnable.value = true;
    midstayClicked.value = false;
    lineHireClicked.value = false;
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

    for (var e in priceController.priceListModel.extras) {
      optionalsArray.add(0);
    }
  }

  // @override
  // void onInit() {
  //   initializeServices();
  //   super.onInit();
  // }

  void onAirbnbSelected(bool isSelected) {
    if (isSelected) {
      midstayEnable.value = false;
      productAndBundleEnable.value = true;
      otherServiceEnable.value = true;
      lineHireEnable.value = true;
      bnbServiceEnable.value = true;

      airbnbUpdateProcess();
    } else {
      initializeServices();
    }
  }

  void onMidstaySelected(bool isSelected) {
    if (isSelected) {
      bnbServiceEnable.value = false;
      lineHireEnable.value = true;
      midstayEnable.value = true;
      midstayClicked.value = true;
      productAndBundleEnable.value = true;
      otherServiceEnable.value = true;
      midStayUpdateProcess();
    } else {
      initializeServices();
    }
  }

  void onLineHireSelected(bool isSelected) {
    if (isSelected) {
      lineHireClicked.value = true;
      productAndBundleEnable.value = true;
      otherServiceEnable.value = true;
      if (midstayClicked.value) {
        bnbServiceEnable.value = false;
      } else {
        bnbServiceEnable.value = true;
      }
      debugPrint(">> bnb ${bnbServiceEnable.value}");
      debugPrint(">> mid stay ${midstayEnable.value}");
      lineUpdateProcess();
    } else {
      initializeServices();
    }
  }

  RxBool submitEnable = false.obs;
  List<ServiceSuccessModel> totalServices = [];
  RxDouble totalPrice = 0.0.obs;
  int onlyLineSelected = 0;

  /// if zero then it is only line hire

  /// ------------------------------------- >>
  final _isUpdateLoading = false.obs;
  bool get isUpdateLoading => _isUpdateLoading.value;

  late ServiceSuccessModel _airbnbUpdateModel;
  ServiceSuccessModel get airbnbUpdateModel => _airbnbUpdateModel;

  RxBool airbnbEnable = false.obs;
  List airbnbPrice = [];
  List airbnbQty = [];
  List airbnbName = [];

  bool selectBnb = false;
  bool selectLine = false;

  RxBool bnbServiceTileEnable = false.obs;

  ///* AirbnbUpdate in process
  Future<ServiceSuccessModel> airbnbUpdateProcess() async {
    _isUpdateLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      "price": airbnbPrice,
      "qty": airbnbQty,
      "name": airbnbName
    };
    await airbnbUpdateProcessApi(
            body: inputBody, orderId: shoppingCartController.orderId.toString())
        .then((value) {
      _airbnbUpdateModel = value!;

      onlyLineSelected++;
      totalServices.add(_airbnbUpdateModel);
      // debugPrint(">> 1 AirBnb ${lineHireForAirBnb.value}");
      if (_airbnbUpdateModel.success[2] != null) {
        CustomSnackBar.error(_airbnbUpdateModel.success[2]);
      } else if (!submitEnable.value) {
        if (lineHireClicked.value) {
          submitEnable.value = true;
        } else {
          CustomSnackBar.error("Please Select Line Hire.");
        }
      }

      airbnbPrice.clear();
      airbnbQty.clear();
      airbnbName.clear();
      airbnbArray.clear();

      for (var e in priceController.priceListModel.airbnbCleanings) {
        airbnbArray.add(0);
      }

      bnbServiceTileEnable.value = false;

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
  RxBool lineHireTileEnable = false.obs;

  ///* LineUpdate in process
  Future<ServiceSuccessModel> lineUpdateProcess() async {
    _isUpdateLoading.value = true;
    update();

    debugPrint(lineHirePrice.length.toString());
    debugPrint(lineHireQty.length.toString());
    debugPrint(lineHireName.length.toString());

    Map<String, dynamic> inputBody = {
      "price": lineHirePrice,
      "qty": lineHireQty,
      "name": lineHireName
    };
    await lineUpdateProcessApi(
            body: inputBody, orderId: shoppingCartController.orderId.toString())
        .then((value) {
      _lineUpdateModel = value!;

      debugPrint(lineHirePrice.length.toString());
      debugPrint(lineHireQty.length.toString());
      debugPrint(lineHireName.length.toString());

      if (totalPrice.value.isGreaterThan(39) || onlyLineSelected != 0) {
        /// checking
        submitEnable.value = true;
      }
      totalServices.add(_lineUpdateModel);

      lineHirePrice.clear();
      lineHireQty.clear();
      lineHireName.clear();
      lineHireArray.clear();

      for (var e in priceController.priceListModel.linenHires) {
        lineHireArray.add(0);
      }

      lineHireTileEnable.value = false;

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
  RxBool midstayTileEnable = false.obs;

  ///* MidStayUpdate in process
  Future<ServiceSuccessModel> midStayUpdateProcess() async {
    _isUpdateLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      "price": midStayPrice,
      "qty": midStayQty,
      "name": midStayName
    };
    await midStayUpdateProcessApi(
            body: inputBody, orderId: shoppingCartController.orderId.toString())
        .then((value) {
      _midStayUpdateModel = value!;

      onlyLineSelected++;
      submitEnable.value = true;
      totalServices.add(_midStayUpdateModel);
      CustomSnackBar.success("Mid Stay added");

      midStayPrice.clear();
      midStayQty.clear();
      midStayName.clear();
      midStayArray.clear();

      for (var e in priceController.priceListModel.midCleanings) {
        midStayArray.add(0);
      }

      midstayTileEnable.value = false;

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
  ServiceSuccessModel get productAndBundleUpdateModel =>
      _productAndBundleUpdateModel;

  RxBool proAndBundleEnable = false.obs;
  List productAndBundlePrice = [];
  List productAndBundleQty = [];
  List productAndBundleName = [];

  RxBool productAndBundleTileEnable = false.obs;

  ///* ProductAndBundleUpdate in process
  Future<ServiceSuccessModel> productAndBundleUpdateProcess() async {
    _isUpdateLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      "price": productAndBundlePrice,
      "qty": productAndBundleQty,
      "name": productAndBundleName
    };
    await productAndBundleUpdateProcessApi(
            body: inputBody, orderId: shoppingCartController.orderId.toString())
        .then((value) {
      _productAndBundleUpdateModel = value!;

      onlyLineSelected++;
      submitEnable.value = true;
      totalServices.add(_productAndBundleUpdateModel);

      CustomSnackBar.success("Products & Bundles added");

      productAndBundlePrice.clear();
      productAndBundleQty.clear();
      productAndBundleName.clear();
      productArray.clear();

      for (var e in priceController.priceListModel.products) {
        productArray.add(0);
      }

      productAndBundleTileEnable.value = false;
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
  RxBool otherServiceTileEnable = false.obs;

  ///* OthersUpdate in process
  Future<ServiceSuccessModel> optionalsUpdateProcess() async {
    _isUpdateLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      "price": optionalsPrice,
      "qty": optionalsQty,
      "name": optionalsName,
      // "order_id": shoppingCartController.orderId
    };
    await othersUpdateProcessApi(
            body: inputBody, orderId: shoppingCartController.orderId.toString())
        .then((value) {
      _othersUpdateModel = value!;

      onlyLineSelected++;
      submitEnable.value = true;
      totalServices.add(_othersUpdateModel);

      CustomSnackBar.success("Optional Extras added");

      optionalsPrice.clear();
      optionalsQty.clear();
      optionalsName.clear();
      optionalsArray.clear();

      for (var e in priceController.priceListModel.bundles) {
        optionalsArray.add(0);
      }

      otherServiceTileEnable.value = false;

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
