class NavigationModel {
  NavigationModel({required this.currentPage, required this.activeModal});

  final Page currentPage;
  final Modal activeModal;

  NavigationModel copyWith({
    Page? page,
    Modal? modal,
  }) =>
      NavigationModel(
        currentPage: page ?? currentPage,
        activeModal: modal ?? activeModal,
      );
}

final NavigationModel initialNavigationModel = NavigationModel(currentPage: Page.home, activeModal: Modal.none);

enum Page {
  home,
}

enum Modal {
  none,
  menu,
}
