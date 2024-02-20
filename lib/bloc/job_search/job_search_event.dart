abstract class JobSearchEvent {}

class JobSearchLoadingEvent extends JobSearchEvent {}

class JobSearchSuccessEvent extends JobSearchEvent {
  JobSearchSuccessEvent(this.searchItem);
  String searchItem = '';
}

class JobSearchFailedEvent extends JobSearchEvent {}
