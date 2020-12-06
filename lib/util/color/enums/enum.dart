/// screen which should be displayed in profile screen
enum ProfileScreenType { registration, login, profile }

/// auth screen identification
enum AuthScreenType {registration, login,}

/// error response state
enum ErrorResponceStatus { display, dismiss }

/// progress indicator state
enum ProgressIndicaterStatus { display, dismiss }

/// network response for screen display data
enum NetWorkResponseStatus {
  ResponseData,
  ResponseError,
  ResponseEmpty,
  NetworkError
}

/// case handling for survey screen
enum StyleStatus { SurveyCompleted, SurveyInComplete, TakeSurvey, NetworkError }

/// survey handling state
enum SurveyHandlingState { NewSurvey, SurveyUpdate, SurveyEidt }

/// address screen navigation type
enum AddressType {
  /// new address
  newAddress,

  /// edit address
  editAddress
}

/// address screen navigation type
enum OrderSummaryScreenType {
  /// new address
  newAddress,
  /// order summary
  orderSumary
}
/// border gradient
enum BorderType { center, top, bottom }

enum Characteristics { skin, eye, hair }
enum OnclickOfOrderItem { viewDetails, trackShippment }

//enum OrderStatus { orderCancel, orderReturn, onlyPayOption , none }
enum OrderStatus { orderCancel, orderReturn, onlyPayOption, PaymentSuccessful, OrderIsPlaced, OrderIsShipped, OutForDelivery, Delivered, OrderIsOnHold, Completed , none }

var listOfBrands = [
  'https://storage.googleapis.com/modistabox-cdn/brands/Apm.png',
  'https://storage.googleapis.com/modistabox-cdn/brands/Buffalo.png',
  'https://storage.googleapis.com/modistabox-cdn/brands/Butterflytwists.png',
  'https://storage.googleapis.com/modistabox-cdn/brands/Bysimon.png',
  'https://storage.googleapis.com/modistabox-cdn/brands/Freepeople.png',
  'https://storage.googleapis.com/modistabox-cdn/brands/IAM.png',
  'https://storage.googleapis.com/modistabox-cdn/brands/Lmane.png',
  'https://storage.googleapis.com/modistabox-cdn/brands/Lacomedi.png',
  'https://storage.googleapis.com/modistabox-cdn/brands/Majique.png',
  'https://storage.googleapis.com/modistabox-cdn/brands/Slydes.png',
];
var popularStyle = [
  'https://storage.googleapis.com/modistabox-cdn/popular-styles/DSC00632.png',
  'https://storage.googleapis.com/modistabox-cdn/popular-styles/DSC00673.png',
  'https://storage.googleapis.com/modistabox-cdn/popular-styles/DSC00845.png',
  'https://storage.googleapis.com/modistabox-cdn/popular-styles/DSC00984.png',
  'https://storage.googleapis.com/modistabox-cdn/popular-styles/DSC01033.png',
  'https://storage.googleapis.com/modistabox-cdn/popular-styles/DSC01043.png',
  'https://storage.googleapis.com/modistabox-cdn/popular-styles/DSC01320.png',
  'https://storage.googleapis.com/modistabox-cdn/popular-styles/DSC01372.png',
];

enum Screen{allLooks,userLooks}

enum TagSearchType{SimilarProducts,ProductTagged}
