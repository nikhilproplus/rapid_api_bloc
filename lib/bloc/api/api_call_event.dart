abstract class ApiEvent {}

class ApiLoadingEvent extends ApiEvent {}

class ApiSuccessEvent extends ApiEvent {}

class ApiFailedEvent extends ApiEvent {}

class ApiSearchEvent extends ApiEvent {
  ApiSearchEvent(this.searchItem);
  String searchItem = '';
}
