import 'package:flutter/material.dart';

import '../../dropdown_search.dart';

class PopupProps<T> {
  ///popup title
  final Widget? title;

  ///the search box will be shown if true, hidden otherwise
  final bool showSearchBox;

  final DropdownSearchPopupItemBuilder<T>? itemBuilder;

  /// object that passes all props to search field
  final TextFieldProps searchFieldProps;

  /// props for selection list view
  final ListViewProps listViewProps;

  /// scrollbar properties
  final ScrollbarProps scrollbarProps;

  /// callback executed before applying value change
  ///delay before searching, change it to Duration(milliseconds: 0)
  ///if you do not use online search
  final Duration? searchDelay;

  ///called when popup is dismissed
  final VoidCallback? onDismissed;

  ///custom layout for empty results
  final EmptyBuilder? emptyBuilder;

  ///custom layout for loading items
  final LoadingBuilder? loadingBuilder;

  ///custom layout for error
  final ErrorBuilder? errorBuilder;

  ///defines if an item of the popup is enabled or not, if the item is disabled,
  ///it cannot be clicked
  final DropdownSearchPopupItemEnabled<T>? disabledItemFn;

  ///popup mode
  final Mode mode;

  ///select the selected item in the menu/dialog/bottomSheet of items
  final bool showSelectedItems;

  ///true if the filter on items is applied onlie (via API/DB/...)
  final bool isFilterOnline;

  ///favorite items props
  final FavoriteItemProps<T> favoriteItemProps;

  ///dialog mode props
  final DialogProps dialogProps;

  ///BottomSheet mode props
  final BottomSheetProps bottomSheetProps;

  ///ModalBottomSheet mode props
  final ModalBottomSheetProps modalBottomSheetProps;

  ///Menu mode props
  final MenuProps menuProps;

  ///fit height depending on nb of result or keep height fix.
  final FlexFit fit;

  ///used as container to the popup widget
  ///this could be very useful if you want to add extra actions/widget to the popup
  ///the popup widget is considered as a child
  final PopupBuilder? containerBuilder;

  ///popup constraints
  final BoxConstraints constraints;

  ///if true , the callbacks (onTap, onLongClick...) will be handled by the user
  final bool interceptCallBacks;

  const PopupProps._({
    this.mode = Mode.MENU,
    this.fit = FlexFit.tight,
    this.title,
    this.showSearchBox = false,
    this.bottomSheetProps = const BottomSheetProps(),
    this.dialogProps = const DialogProps(),
    this.modalBottomSheetProps = const ModalBottomSheetProps(),
    this.menuProps = const MenuProps(),
    this.searchFieldProps = const TextFieldProps(),
    this.scrollbarProps = const ScrollbarProps(),
    this.listViewProps = const ListViewProps(),
    this.favoriteItemProps = const FavoriteItemProps(),
    this.searchDelay,
    this.onDismissed,
    this.emptyBuilder,
    this.itemBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    this.showSelectedItems = false,
    this.disabledItemFn,
    this.isFilterOnline = false,
    this.containerBuilder,
    this.constraints = const BoxConstraints(),
    this.interceptCallBacks = false,
  });

  const PopupProps.menu({
    this.title,
    this.fit = FlexFit.tight,
    this.showSearchBox = false,
    this.menuProps = const MenuProps(),
    this.searchFieldProps = const TextFieldProps(),
    this.scrollbarProps = const ScrollbarProps(),
    this.listViewProps = const ListViewProps(),
    this.favoriteItemProps = const FavoriteItemProps(),
    this.searchDelay,
    this.onDismissed,
    this.emptyBuilder,
    this.itemBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    this.showSelectedItems = false,
    this.disabledItemFn,
    this.isFilterOnline = false,
    this.containerBuilder,
    this.constraints = const BoxConstraints(maxHeight: 350),
    this.interceptCallBacks = false,
  })  : this.mode = Mode.MENU,
        this.bottomSheetProps = const BottomSheetProps(),
        this.dialogProps = const DialogProps(),
        this.modalBottomSheetProps = const ModalBottomSheetProps();

  const PopupProps.dialog({
    this.fit = FlexFit.tight,
    this.title,
    this.showSearchBox = false,
    this.dialogProps = const DialogProps(),
    this.searchFieldProps = const TextFieldProps(),
    this.scrollbarProps = const ScrollbarProps(),
    this.listViewProps = const ListViewProps(),
    this.favoriteItemProps = const FavoriteItemProps(),
    this.searchDelay,
    this.onDismissed,
    this.emptyBuilder,
    this.itemBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    this.showSelectedItems = false,
    this.disabledItemFn,
    this.isFilterOnline = false,
    this.containerBuilder,
    this.constraints = const BoxConstraints(
      minWidth: 500,
      maxWidth: 500,
      maxHeight: 600,
    ),
    this.interceptCallBacks = false,
  })  : this.mode = Mode.DIALOG,
        this.menuProps = const MenuProps(),
        this.bottomSheetProps = const BottomSheetProps(),
        this.modalBottomSheetProps = const ModalBottomSheetProps();

  const PopupProps.bottomSheet({
    this.fit = FlexFit.tight,
    this.title,
    this.showSearchBox = false,
    this.bottomSheetProps = const BottomSheetProps(),
    this.searchFieldProps = const TextFieldProps(),
    this.scrollbarProps = const ScrollbarProps(),
    this.listViewProps = const ListViewProps(),
    this.favoriteItemProps = const FavoriteItemProps(),
    this.searchDelay,
    this.onDismissed,
    this.emptyBuilder,
    this.itemBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    this.showSelectedItems = false,
    this.disabledItemFn,
    this.isFilterOnline = false,
    this.containerBuilder,
    this.constraints = const BoxConstraints(maxHeight: 500),
    this.interceptCallBacks = false,
  })  : this.mode = Mode.BOTTOM_SHEET,
        this.menuProps = const MenuProps(),
        this.dialogProps = const DialogProps(),
        this.modalBottomSheetProps = const ModalBottomSheetProps();

  const PopupProps.modalBottomSheet({
    this.title,
    this.fit = FlexFit.tight,
    this.showSearchBox = false,
    this.modalBottomSheetProps = const ModalBottomSheetProps(),
    this.searchFieldProps = const TextFieldProps(),
    this.scrollbarProps = const ScrollbarProps(),
    this.listViewProps = const ListViewProps(),
    this.favoriteItemProps = const FavoriteItemProps(),
    this.searchDelay,
    this.onDismissed,
    this.emptyBuilder,
    this.itemBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    this.showSelectedItems = false,
    this.disabledItemFn,
    this.isFilterOnline = false,
    this.containerBuilder,
    this.constraints = const BoxConstraints(maxHeight: 500),
    this.interceptCallBacks = false,
  })  : this.mode = Mode.MODAL_BOTTOM_SHEET,
        this.menuProps = const MenuProps(),
        this.dialogProps = const DialogProps(),
        this.bottomSheetProps = const BottomSheetProps();
}

class PopupPropsMultiSelection<T> extends PopupProps<T> {
  ///called when a new item added on Multi selection mode
  final OnItemAdded<T>? onItemAdded;

  ///called when a new item added on Multi selection mode
  final OnItemRemoved<T>? onItemRemoved;

  ///widget used to show checked items in multiSelection mode
  final DropdownSearchPopupItemBuilder<T>? selectionWidget;

  ///widget used to validate items in multiSelection mode
  final ValidationMultiSelectionBuilder<T>? validationWidgetBuilder;

  const PopupPropsMultiSelection._({
    mode = Mode.MENU,
    fit = FlexFit.tight,
    title,
    isFilterOnline,
    itemBuilder,
    disabledItemFn,
    showSearchBox,
    searchFieldProps = const TextFieldProps(),
    favoriteItemProps = const FavoriteItemProps(),
    modalBottomSheetProps = const ModalBottomSheetProps(),
    scrollbarProps = const ScrollbarProps(),
    listViewProps = const ListViewProps(),
    searchDelay,
    onDismissed,
    emptyBuilder,
    errorBuilder,
    loadingBuilder,
    showSelectedItems,
    bottomSheetProps = const BottomSheetProps(),
    dialogProps = const DialogProps(),
    menuProps = const MenuProps(),
    containerBuilder,
    constraints = const BoxConstraints(maxHeight: 350),
    interceptCallBacks = false,
    this.onItemAdded,
    this.onItemRemoved,
    this.selectionWidget,
    this.validationWidgetBuilder,
  }) : super._(
          mode: Mode.MENU,
          fit: FlexFit.tight,
          title: title,
          isFilterOnline: isFilterOnline,
          itemBuilder: itemBuilder,
          disabledItemFn: disabledItemFn,
          showSearchBox: showSearchBox,
          searchFieldProps: const TextFieldProps(),
          favoriteItemProps: const FavoriteItemProps(),
          modalBottomSheetProps: const ModalBottomSheetProps(),
          scrollbarProps: const ScrollbarProps(),
          listViewProps: const ListViewProps(),
          searchDelay: searchDelay,
          onDismissed: onDismissed,
          emptyBuilder: emptyBuilder,
          errorBuilder: errorBuilder,
          loadingBuilder: loadingBuilder,
          showSelectedItems: showSelectedItems,
          bottomSheetProps: const BottomSheetProps(),
          dialogProps: const DialogProps(),
          menuProps: const MenuProps(),
          containerBuilder: containerBuilder,
          constraints: const BoxConstraints(maxHeight: 350),
          interceptCallBacks: false,
        );

  const PopupPropsMultiSelection.menu({
    title,
    fit = FlexFit.tight,
    showSearchBox = false,
    searchFieldProps = const TextFieldProps(),
    menuProps = const MenuProps(),
    favoriteItemProps = const FavoriteItemProps(),
    scrollbarProps = const ScrollbarProps(),
    listViewProps = const ListViewProps(),
    searchDelay,
    onDismissed,
    emptyBuilder,
    itemBuilder,
    errorBuilder,
    loadingBuilder,
    showSelectedItems = false,
    disabledItemFn,
    isFilterOnline = false,
    containerBuilder,
    constraints = const BoxConstraints(maxHeight: 350),
    interceptCallBacks = false,
    this.onItemAdded,
    this.onItemRemoved,
    this.selectionWidget,
    this.validationWidgetBuilder,
  }) : super.menu(
          title: title,
          fit: fit,
          showSearchBox: showSearchBox,
          searchFieldProps: searchFieldProps,
          menuProps: menuProps,
          favoriteItemProps: favoriteItemProps,
          scrollbarProps: scrollbarProps,
          listViewProps: listViewProps,
          searchDelay: searchDelay,
          onDismissed: onDismissed,
          emptyBuilder: emptyBuilder,
          itemBuilder: itemBuilder,
          errorBuilder: errorBuilder,
          loadingBuilder: loadingBuilder,
          showSelectedItems: showSelectedItems,
          disabledItemFn: disabledItemFn,
          isFilterOnline: isFilterOnline,
          containerBuilder: containerBuilder,
          constraints: constraints,
          interceptCallBacks: interceptCallBacks,
        );
  const PopupPropsMultiSelection.dialog({
    title,
    fit = FlexFit.tight,
    showSearchBox = false,
    searchFieldProps = const TextFieldProps(),
    scrollbarProps = const ScrollbarProps(),
    listViewProps = const ListViewProps(),
    favoriteItemProps = const FavoriteItemProps(),
    dialogProps = const DialogProps(),
    searchDelay,
    onDismissed,
    emptyBuilder,
    itemBuilder,
    errorBuilder,
    loadingBuilder,
    showSelectedItems = false,
    disabledItemFn,
    isFilterOnline = false,
    containerBuilder,
    constraints = const BoxConstraints(
      minWidth: 500,
      maxWidth: 500,
      maxHeight: 600,
    ),
    interceptCallBacks = false,
    this.onItemAdded,
    this.onItemRemoved,
    this.selectionWidget,
    this.validationWidgetBuilder,
  }) : super.dialog();

  const PopupPropsMultiSelection.bottomSheet({
    title,
    fit = FlexFit.tight,
    showSearchBox = false,
    searchFieldProps = const TextFieldProps(),
    listViewProps = const ListViewProps(),
    favoriteItemProps = const FavoriteItemProps(),
    bottomSheetProps = const BottomSheetProps(),
    scrollbarProps = const ScrollbarProps(),
    searchDelay,
    onDismissed,
    emptyBuilder,
    itemBuilder,
    errorBuilder,
    loadingBuilder,
    showSelectedItems = false,
    disabledItemFn,
    isFilterOnline = false,
    containerBuilder,
    constraints = const BoxConstraints(maxHeight: 500),
    interceptCallBacks = false,
    this.onItemAdded,
    this.onItemRemoved,
    this.selectionWidget,
    this.validationWidgetBuilder,
  }) : super.bottomSheet();

  const PopupPropsMultiSelection.modalBottomSheet({
    title,
    isFilterOnline,
    fit = FlexFit.tight,
    itemBuilder,
    disabledItemFn,
    showSearchBox,
    searchFieldProps = const TextFieldProps(),
    favoriteItemProps = const FavoriteItemProps(),
    modalBottomSheetProps = const ModalBottomSheetProps(),
    scrollbarProps = const ScrollbarProps(),
    listViewProps = const ListViewProps(),
    searchDelay,
    onDismissed,
    emptyBuilder,
    errorBuilder,
    loadingBuilder,
    showSelectedItems,
    containerBuilder,
    constraints = const BoxConstraints(maxHeight: 500),
    interceptCallBacks = false,
    this.onItemAdded,
    this.onItemRemoved,
    this.selectionWidget,
    this.validationWidgetBuilder,
  }) : super.modalBottomSheet();

  PopupPropsMultiSelection.from(PopupProps<T> popupProps)
      : this._(
          title: popupProps.title,
          fit: popupProps.fit,
          favoriteItemProps: popupProps.favoriteItemProps,
          disabledItemFn: popupProps.disabledItemFn,
          emptyBuilder: popupProps.emptyBuilder,
          errorBuilder: popupProps.errorBuilder,
          isFilterOnline: popupProps.isFilterOnline,
          itemBuilder: popupProps.itemBuilder,
          listViewProps: popupProps.listViewProps,
          loadingBuilder: popupProps.loadingBuilder,
          modalBottomSheetProps: popupProps.modalBottomSheetProps,
          onDismissed: popupProps.onDismissed,
          scrollbarProps: popupProps.scrollbarProps,
          searchDelay: popupProps.searchDelay,
          searchFieldProps: popupProps.searchFieldProps,
          showSearchBox: popupProps.showSearchBox,
          showSelectedItems: popupProps.showSelectedItems,
          mode: popupProps.mode,
          bottomSheetProps: popupProps.bottomSheetProps,
          dialogProps: popupProps.dialogProps,
          menuProps: popupProps.menuProps,
          containerBuilder: popupProps.containerBuilder,
          constraints: popupProps.constraints,
          interceptCallBacks: popupProps.interceptCallBacks,
          onItemAdded: null,
          onItemRemoved: null,
          selectionWidget: null,
          validationWidgetBuilder: null,
        );
}
