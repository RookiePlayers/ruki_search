// ignore_for_file: must_be_immutable

library ruki_search;

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart' as fa;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

///SearchPage
///A search page that can be used to search for data
class SearchPage extends StatefulWidget {
  static Widget searchBarButton(BuildContext context,
          {Color backgroundColor = Colors.white,
          Color buttonColor = Colors.white24,
          IconData searchIcon = LineIcons.search,
          IconData closeIcon = LineIcons.times,
          IconData backIcon = LineIcons.chevronLeft,
          Color? iconColor,
          BorderRadius borderRadius =
              const BorderRadius.all(Radius.circular(12)),
          EdgeInsets padding =
              const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
          EdgeInsets? resultPadding,
          TextStyle? textStyle,
          TextStyle? inputTextstyle,
          Color? inputBackgroundColor,
          InputBorder? inputBorder,
          String placeholder = "Search",
          Border border = const Border(),
          String initialQuery = "",
          bool showExit = true,
          Duration? resultsAnimationDuration,
          num? resultsAnimationOffset,
          Widget? searchLeading,
          Widget? searchTrailing,
          Widget? emptyScreen,
          Widget? resultScreen,
          Widget? errorScreen,
          Widget? loadingScreen,
          Widget? header,
          Widget? history,
          dynamic paginationCursor,
          num? paginationLimit,
          bool enableLazyLoading = true,
          bool enableLoadMoreScroll = true,
          bool liveSearch = true,
          num? paginationOffset = 1,
          bool paginateByPageNumber = false,
          Widget? loadMoreWidget,
          Widget? loadingWidget,
          Widget Function(ISearchable)? resultBuilder,
          Widget Function(ISearchable)? suggestionsBuilder,
          Future<List<ISearchable>> Function(String)? suggestions,
          Future<List<ISearchable>> Function(String)? request,
          Future<List<ISearchable>> Function(String, dynamic)? lazyRequest}) =>
      InkWell(
          onTap: () {
            SearchPage.showSearchPage(
                backgroundColor: backgroundColor,
                buttonColor: buttonColor,
                searchIcon: searchIcon,
                closeIcon: closeIcon,
                backIcon: backIcon,
                iconColor: iconColor,
                borderRadius: borderRadius,
                padding: padding,
                resultPadding: resultPadding,
                textStyle: textStyle,
                inputTextstyle: inputTextstyle,
                resultsAnimationDuration: resultsAnimationDuration,
                resultsAnimationOffset: resultsAnimationOffset,
                inputBackgroundColor: inputBackgroundColor,
                inputBorder: inputBorder,
                placeholder: placeholder,
                border: border,
                context: context,
                initialQuery: initialQuery,
                showExit: showExit,
                searchLeading: searchLeading,
                searchTrailing: searchTrailing,
                emptyScreen: emptyScreen,
                resultScreen: resultScreen,
                errorScreen: errorScreen,
                loadingScreen: loadingScreen,
                header: header,
                history: history,
                paginationCursor: paginationCursor,
                paginationLimit: paginationLimit,
                enableLoadMoreScroll: enableLoadMoreScroll,
                enableLazyLoading: enableLazyLoading,
                liveSearch: liveSearch,
                resultBuilder: resultBuilder ?? (s) => Container(),
                suggestionsBuilder: suggestionsBuilder,
                suggestions: suggestions,
                request: request,
                paginationOffset: paginationOffset,
                paginateByPageNumber: paginateByPageNumber,
                lazyRequest: lazyRequest,
                loadMoreWidget: loadMoreWidget,
                loadingWidget: loadingWidget);
          },
          child: Container(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            padding: padding,
            decoration: BoxDecoration(
                border: border, borderRadius: borderRadius, color: buttonColor),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Icon(
                  searchIcon,
                  color: iconColor,
                )),
                const SizedBox(
                  width: 3,
                ),
                Expanded(
                    flex: 8,
                    child: Text(
                      placeholder,
                      style: textStyle ??
                          Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 14),
                    )),
              ],
            ),
          ));

  static Route<T> createRoute<T>(Widget child, {String? routeName}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: routeName),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) =>
          child,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          FadeTransition(
        opacity: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.fastLinearToSlowEaseIn,
          ),
        ),
        child: child,
      ),
    );
  }

  static Future<T?> showSearchPage<T>(
      {required BuildContext context,
      Color backgroundColor = Colors.white,
      Color buttonColor = Colors.white24,
      IconData searchIcon = LineIcons.search,
      IconData closeIcon = LineIcons.times,
      IconData backIcon = LineIcons.chevronLeft,
      Color? iconColor,
      BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
      EdgeInsets padding =
          const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
      EdgeInsets? resultPadding,
      TextStyle? textStyle,
      TextStyle? inputTextstyle,
      Duration? resultsAnimationDuration,
      num? resultsAnimationOffset,
      Color? inputBackgroundColor,
      InputBorder? inputBorder,
      String placeholder = "Search",
      Border border = const Border(),
      String? query = '',
      bool useRootNavigator = false,
      bool liveSearch = true,
      String initialQuery = "",
      bool showExit = true,
      Widget? searchLeading,
      Widget? searchTrailing,
      Widget? emptyScreen,
      Widget? resultScreen,
      Widget? errorScreen,
      Widget? loadingScreen,
      Widget? header,
      Widget? history,
      dynamic paginationCursor,
      num? paginationLimit,
      bool enableLazyLoading = false,
      bool enableLoadMoreScroll = false,
      bool paginateByPageNumber = false,
      num? paginationOffset = 1,
      Widget? loadMoreWidget,
      Widget? loadingWidget,
      required Widget Function(ISearchable) resultBuilder,
      Widget Function(ISearchable)? suggestionsBuilder,
      Future<List<ISearchable>> Function(String)? suggestions,
      Future<List<ISearchable>> Function(String)? request,
      Future<List<ISearchable>> Function(String, dynamic)? lazyRequest}) {
    return Navigator.of(context, rootNavigator: useRootNavigator)
        .push(createRoute(
      SearchPage(
        backgroundColor: backgroundColor,
        buttonColor: buttonColor,
        iconColor: iconColor,
        searchIcon: searchIcon,
        closeIcon: closeIcon,
        backIcon: backIcon,
        borderRadius: borderRadius,
        padding: padding,
        resultPadding: resultPadding,
        textStyle: textStyle,
        inputTextstyle: inputTextstyle,
        resultsAnimationDuration: resultsAnimationDuration,
        resultsAnimationOffset: resultsAnimationOffset,
        inputBackgroundColor: inputBackgroundColor,
        inputBorder: inputBorder,
        placeholder: placeholder,
        border: border,
        initialQuery: query ?? "",
        showExit: showExit,
        liveSearch: liveSearch,
        searchLeading: searchLeading,
        searchTrailing: searchTrailing,
        emptyScreen: emptyScreen,
        resultScreen: resultScreen,
        errorScreen: errorScreen,
        loadingScreen: loadingScreen,
        header: header,
        history: history,
        paginationCursor: paginationCursor,
        enableLoadMoreScroll: enableLoadMoreScroll,
        enableLazyLoading: enableLazyLoading,
        resultBuilder: resultBuilder,
        suggestionsBuilder: suggestionsBuilder,
        suggestions: suggestions,
        request: request,
        lazyRequest: lazyRequest,
        paginateByPageNumber: paginateByPageNumber,
        paginationOffset: paginationOffset,
        paginationLimit: paginationLimit,
        loadMoreWidget: loadMoreWidget,
        loadingWidget: loadingWidget,
      ),
    ));
  }

  SearchPage(
      {super.key,
      this.backgroundColor = Colors.white24,
      this.buttonColor = Colors.white24,
      this.iconColor,
      this.searchIcon = LineIcons.search,
      this.closeIcon = LineIcons.times,
      this.backIcon = LineIcons.chevronLeft,
      this.borderRadius = const BorderRadius.all(Radius.circular(12)),
      this.padding = const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
      this.textStyle,
      this.inputTextstyle,
      this.resultsAnimationDuration,
      this.resultsAnimationOffset,
      this.inputBackgroundColor,
      this.inputBorder,
      this.resultPadding,
      this.placeholder = "Search",
      this.border = const Border(),
      this.initialQuery = "",
      this.showExit = true,
      this.liveSearch = true,
      this.searchLeading,
      this.searchTrailing,
      this.emptyScreen,
      this.resultScreen,
      this.errorScreen,
      this.loadingScreen,
      this.header,
      this.history,
      this.request,
      this.lazyRequest,
      this.suggestions,
      this.paginationLimit = 30,
      this.paginationCursor = 1,
      this.paginationOffset = 1,
      this.paginateByPageNumber = false,
      this.enableLazyLoading = false,
      this.enableLoadMoreScroll = false,
      this.loadMoreWidget,
      this.loadingWidget,
      required this.resultBuilder,
      this.suggestionsBuilder}) {
    if (enableLazyLoading) {
      assert(lazyRequest != null,
          "Lazy loading is enabled! Please use lazyRequest instead of request");
      request = null;
    } else {
      assert(request != null,
          "Please pass in your request as a Future, and it must return type ISearchable");
      lazyRequest = null;
    }
  }
  final Color backgroundColor;
  final Color buttonColor;
  final Color? iconColor;
  final IconData searchIcon;
  final IconData closeIcon;
  final IconData backIcon;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final EdgeInsets? resultPadding;
  final TextStyle? textStyle;
  final TextStyle? inputTextstyle;
  final Duration? resultsAnimationDuration;
  final num? resultsAnimationOffset;
  final Color? inputBackgroundColor;
  final InputBorder? inputBorder;
  final String placeholder;
  final Border border;
  final String initialQuery;
  final bool showExit;
  final Widget? searchLeading;
  final Widget? searchTrailing;
  final Widget? emptyScreen;
  final Widget? resultScreen;
  final Widget? errorScreen;
  final Widget? loadingScreen;
  final Widget? header;
  final Widget? history;
  final dynamic paginationCursor;
  final num? paginationLimit;
  final bool enableLazyLoading;
  final bool enableLoadMoreScroll;
  final bool liveSearch;
  final bool paginateByPageNumber;
  final num? paginationOffset;
  final Widget? loadMoreWidget;
  final Widget? loadingWidget;
  final Widget Function(ISearchable) resultBuilder;
  final Widget Function(ISearchable)? suggestionsBuilder;
  final Future<List<ISearchable>> Function(String)? suggestions;
  Future<List<ISearchable>> Function(String)? request;
  Future<List<ISearchable>> Function(String, dynamic)?
      lazyRequest; //param = query, param 2 = offset

  @override
  State<SearchPage> createState() => _SearchPageState();
}

enum _SearchPage { suggestions, results }

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchController>(
        create: (context) => SearchController(),
        child: Scaffold(
            body: SearchDelegate(
          backgroundColor: widget.backgroundColor,
          iconColor: widget.iconColor,
          searchIcon: widget.searchIcon,
          closeIcon: widget.closeIcon,
          backIcon: widget.backIcon,
          borderRadius: widget.borderRadius,
          padding: widget.padding,
          textStyle: widget.textStyle,
          inputTextstyle: widget.inputTextstyle,
          resultsAnimationDuration: widget.resultsAnimationDuration,
          resultsAnimationOffset: widget.resultsAnimationOffset,
          inputBackgroundColor: widget.inputBackgroundColor,
          inputBorder: widget.inputBorder,
          placeholder: widget.placeholder,
          border: widget.border,
          initialQuery: widget.initialQuery,
          liveSearch: widget.liveSearch,
          showExit: widget.showExit,
          searchLeading: widget.searchLeading,
          searchTrailing: widget.searchTrailing,
          emptyScreen: widget.emptyScreen,
          resultScreen: widget.resultScreen,
          errorScreen: widget.errorScreen,
          loadingScreen: widget.loadingScreen,
          header: widget.header,
          history: widget.history,
          paginationCursor: widget.paginationCursor,
          enableLazyLoading: widget.enableLazyLoading,
          enableLoadMoreScroll: widget.enableLoadMoreScroll,
          resultBuilder: widget.resultBuilder,
          suggestionsBuilder: widget.suggestionsBuilder,
          suggestions: widget.suggestions,
          request: widget.request,
          lazyRequest: widget.lazyRequest,
          paginationOffset: widget.paginationOffset,
          paginateByPageNumber: widget.paginateByPageNumber,
          paginationLimit: widget.paginationLimit,
          loadMoreWidget: widget.loadMoreWidget,
          loadingWidget: widget.loadingWidget,
        )));
  }
}

class SearchDelegate extends StatefulWidget {
  const SearchDelegate(
      {super.key,
      this.backgroundColor = Colors.white,
      this.buttonColor,
      this.iconColor,
      this.searchIcon = LineIcons.search,
      this.closeIcon = LineIcons.times,
      this.backIcon = LineIcons.chevronLeft,
      this.borderRadius = const BorderRadius.all(Radius.circular(12)),
      this.padding = const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
      this.resultPadding,
      this.textStyle,
      this.inputTextstyle,
      this.resultsAnimationDuration,
      this.resultsAnimationOffset,
      this.inputBackgroundColor,
      this.inputBorder,
      this.placeholder = "Search",
      this.border = const Border(),
      this.initialQuery = "",
      this.showExit = true,
      this.liveSearch = true,
      this.searchLeading,
      this.searchTrailing,
      this.emptyScreen,
      this.resultScreen,
      this.errorScreen,
      this.loadingScreen,
      this.header,
      this.history,
      this.request,
      this.lazyRequest,
      this.suggestions,
      this.paginationLimit = 30,
      this.paginationCursor = 1,
      this.paginateByPageNumber = false,
      this.paginationOffset = 1,
      this.enableLazyLoading = false,
      this.enableLoadMoreScroll = false,
      this.loadMoreWidget,
      this.loadingWidget,
      required this.resultBuilder,
      this.suggestionsBuilder});

  final Color backgroundColor;
  final Color? buttonColor;
  final Color? iconColor;
  final IconData searchIcon;
  final IconData closeIcon;
  final IconData backIcon;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final EdgeInsets? resultPadding;
  final TextStyle? textStyle;
  final TextStyle? inputTextstyle;
  final Duration? resultsAnimationDuration;
  final num? resultsAnimationOffset;
  final Color? inputBackgroundColor;
  final InputBorder? inputBorder;
  final String placeholder;
  final Border border;
  final String initialQuery;
  final bool showExit;
  final Widget? searchLeading;
  final Widget? searchTrailing;
  final Widget? emptyScreen;
  final Widget? resultScreen;
  final Widget? errorScreen;
  final Widget? loadingScreen;
  final Widget? header;
  final Widget? history;
  final dynamic paginationCursor;
  final num? paginationLimit;
  final num? paginationOffset;
  final bool paginateByPageNumber;
  final bool enableLazyLoading;
  final bool enableLoadMoreScroll;
  final bool liveSearch;
  final Widget? loadMoreWidget;
  final Widget? loadingWidget;
  final Widget Function(ISearchable) resultBuilder;
  final Widget Function(ISearchable)? suggestionsBuilder;
  final Future<List<ISearchable>> Function(String)? suggestions;
  final Future<List<ISearchable>> Function(String)? request;
  final Future<List<ISearchable>> Function(String, dynamic)? lazyRequest;

  @override
  State<SearchDelegate> createState() => _SearchDelegateState();
}

class _SearchDelegateState extends State<SearchDelegate> {
  _SearchPage _currentPage = _SearchPage.results;
  late SearchController searchController;
  final TextEditingController _queryController = TextEditingController();
  dynamic paginationNextCursor;
  ScrollController scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  List<ISearchable> lazyLoadedSearchItems = [];
  late num paginationOffset;
  bool loading = false;

  @override
  void initState() {
    paginationOffset = widget.paginationOffset ?? 1;
    super.initState();

    if (widget.enableLazyLoading && widget.enableLoadMoreScroll) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        getCurrentResults();
        scrollController.addListener(_scrollListener);
        // FocusScope.of(context).requestFocus(_focusNode);
      });
    }
  }

  _scrollListener() {
    _focusNode.unfocus();
    //if at max scroll extent load more data
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      getNextResults();
    }
  }

  @override
  Widget build(BuildContext context) {
    searchController = Provider.of<SearchController>(context, listen: false);

    late Widget body;
    switch (_currentPage) {
      case _SearchPage.suggestions:
        body = Consumer<SearchController>(
            builder: ((context, value, c) =>
                _buildSuggestion(value.searchedData)));
        break;
      case _SearchPage.results:
        body = Consumer<SearchController>(builder: ((context, value, c) {
          late Widget child;
          if (value.states != SearchStates.error &&
              value.searchedData.isEmpty &&
              widget.enableLazyLoading) {
            return _buildResult(value.searchedData);
          }
          switch (value.states) {
            case SearchStates.loading:
              child = widget.loadingScreen ?? _buildLoading();
              break;
            case SearchStates.error:
              child = widget.loadingScreen ?? _buildError();
              break;
            case SearchStates.empty:
              child = widget.emptyScreen ?? _buildEmpty();
              break;
            case SearchStates.success:
              child = widget.resultScreen ?? _buildResult(value.searchedData);
              break;
          }
          return child;
        }));
    }
    return Scaffold(
        backgroundColor: widget.backgroundColor,
        body: Stack(
          children: [
            Padding(
                padding: widget.resultPadding ??
                    EdgeInsets.only(
                        top: kToolbarHeight * (widget.showExit ? 2.6 : 1.8)),
                child: body),
            Container(
              height: MediaQuery.of(context).size.height * 0.28,
              transform: Matrix4.translationValues(0, -kToolbarHeight, 0),
              width: MediaQuery.of(context).size.width,
              child: widget.header ?? Container(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: kToolbarHeight, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.showExit)
                    TextButton.icon(
                        style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        },
                        icon: Icon(widget.backIcon),
                        label: const Text("exit")),
                  _buildSearchBar()
                ],
              ),
            ),
          ],
        ));
  }

  void showResults(BuildContext context) {
    _currentPage = _SearchPage.results;
  }

  /// Transition from showing the results returned by [buildResults] to showing
  /// the suggestions returned by [buildSuggestions].
  ///
  /// Calling this method will also put the input focus back into the search
  /// field of the [AppBar].
  ///
  /// If the results are currently shown this method can be used to go back
  /// to showing the search suggestions.
  ///
  /// See also:
  ///
  ///  * [showResults] to show the search results.
  void showSuggestions(BuildContext context) {
    _currentPage = _SearchPage.suggestions;
  }

  Widget _buildSuggestion(List<ISearchable> searchedData) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: AnimationLimiter(
        child: ListView.builder(
          itemCount: searchedData.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                        child:
                            widget.suggestionsBuilder!(searchedData[index]))));
          },
          controller: scrollController,
        ),
      ),
    );
  }

  Widget _buildResult(List<ISearchable> searchedData) {
    if (widget.enableLazyLoading) {
      searchedData = lazyLoadedSearchItems;
    }
    return Align(
        alignment: Alignment.topCenter,
        child: searchedData.isNotEmpty
            ? AnimationLimiter(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      searchedData.length + (widget.enableLazyLoading ? 1 : 0),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == searchedData.length &&
                        widget.enableLazyLoading) {
                      return widget.loadMoreWidget != null
                          ? (loading
                              ? (widget.loadingWidget ??
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  ))
                              : widget.loadMoreWidget)
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: OutlinedButton(
                                  onPressed: () {
                                    getNextResults();
                                  },
                                  style: OutlinedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: widget.buttonColor,
                                      fixedSize: const Size(200, 30),
                                      side: BorderSide(
                                          color: widget.buttonColor ??
                                              Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                          width: 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: loading
                                      ? const Center(
                                          child: SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                              )))
                                      : const Text("Load More"),
                                ),
                              ),
                            );
                    }
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: widget.resultsAnimationDuration ??
                            const Duration(milliseconds: 375),
                        child: SlideAnimation(
                            verticalOffset:
                                widget.resultsAnimationOffset?.toDouble() ??
                                    50.0,
                            child: FadeInAnimation(
                                child: widget
                                    .resultBuilder(searchedData[index]))));
                  },
                  controller: scrollController,
                ),
              )
            : Center(
                child: widget.emptyScreen ??
                    Text(
                      "No Results Found",
                      style: widget.inputTextstyle,
                    ),
              ));
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError() {
    return Center(
        child: Text(
      "An error occured",
      style: widget.inputTextstyle,
    ));
  }

  Widget _buildEmpty() {
    return Center(
      child: Text(
        "No Results Found",
        style: widget.inputTextstyle,
      ),
    );
  }

  resetPaginationData() {
    lazyLoadedSearchItems.clear();
    paginationOffset = 1;
    paginationNextCursor = widget.paginateByPageNumber
        ? paginationOffset
        : widget.paginationCursor;
  }

  handleSearch(v) {
    resetPaginationData();
    if (widget.suggestions == null) {
      onSearch(v.trim());
    } else {
      searchController.networtResponse = widget.suggestions!(v.trim());
      searchController.searchSearchable();
    }
  }

  _buildSearchBar() {
    return fa.FadeInUp(
      preferences: const fa.AnimationPreferences(
          magnitude: 0.4, duration: Duration(milliseconds: 500)),
      child: ChangeNotifierProvider.value(
        value: searchController,
        child: Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
          child: Focus(
            focusNode: _focusNode,
            child: TextField(
                autofocus: true,
                controller: _queryController,
                onEditingComplete: () {
                  handleSearch(_queryController.text.trim());
                },
                onChanged: (v) {
                  if (widget.liveSearch) {
                    handleSearch(v.trim());
                  }
                },
                onSubmitted: onSearch,
                style: widget.inputTextstyle ??
                    Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: widget.padding,
                  filled: widget.inputBackgroundColor != null,
                  fillColor: widget.inputBackgroundColor,
                  isDense: true,
                  prefixIcon: !widget.showExit
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                widget.backIcon,
                                color: widget.iconColor,
                              ),
                              onPressed: () {
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                              },
                            ),
                            widget.searchLeading ?? Container()
                          ],
                        )
                      : (widget.suggestions != null)
                          ? widget.searchLeading ??
                              IconButton(
                                icon: Icon(
                                  widget.searchIcon,
                                  color: widget.iconColor ??
                                      widget.inputTextstyle?.color,
                                ),
                                onPressed: () {
                                  onSearch(_queryController.text.trim());
                                },
                              )
                          : Icon(
                              widget.searchIcon,
                              color: widget.iconColor,
                            ),
                  suffixIcon: widget.searchTrailing ??
                      IconButton(
                          onPressed: () {
                            _queryController.clear();
                          },
                          icon: Icon(
                            widget.closeIcon,
                            color: widget.iconColor,
                          )),
                  hintText: (widget.placeholder),
                  hintStyle: widget.inputTextstyle?.copyWith(
                        color: widget.inputTextstyle?.color?.withOpacity(0.5),
                      ) ??
                      Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 14),
                  border: widget.inputBorder ??
                      OutlineInputBorder(
                          borderRadius: widget.borderRadius,
                          borderSide: widget.border.bottom),
                )),
          ),
        ),
      ),
    );
  }

  void onSearch(String v) async {
    searchController.networtResponse = widget.enableLazyLoading
        ? widget.lazyRequest!(v, widget.paginationCursor ?? 1)
        : widget.request!(v);
    await searchController.searchSearchable();
    if (widget.enableLazyLoading) {
      getCurrentResults();
    }
  }

  void getCurrentResults() {
    lazyLoadedSearchItems.clear();
    lazyLoadedSearchItems.addAll(Set.from(searchController.searchedData));
    if (lazyLoadedSearchItems.isNotEmpty) {
      lazyLoadedSearchItems = lazyLoadedSearchItems.toSet().toList();
      paginationOffset++;
      paginationNextCursor = widget.paginateByPageNumber
          ? paginationOffset
          : lazyLoadedSearchItems.last.searchId();
    }
  }

  Future<void> getNextResults() async {
    if (mounted) {
      setState(() {
        loading = true;
      });
    }
    searchController = Provider.of<SearchController>(context, listen: false);
    searchController.networtResponse =
        widget.lazyRequest!(_queryController.text, paginationNextCursor ?? "");
    await searchController.searchSearchable();

    if (searchController.searchedData.isNotEmpty) {
      for (var item in searchController.searchedData) {
        if (!lazyLoadedSearchItems
            .any((e) => e.searchId() == item.searchId())) {
          lazyLoadedSearchItems.add(item);
        }
      }
      paginationOffset++;
      paginationNextCursor = widget.paginateByPageNumber
          ? paginationOffset
          : lazyLoadedSearchItems.last.searchId();
    }
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }
}

///States of the search
///[loading] when the search is loading
///[error] when an error occurs
///[empty] when the search returns no result
///[success] when the search is successful
enum SearchStates { loading, error, empty, success }

///Class to make data searchable
///To use this class, extend it and implement the abstract methods
///[searchId] and [data]
///[searchId] is a unique identifier for the data
///[data] is the data to be searched
///Example:
///```dart
///class User extends ISearchable {
///  final String name;
/// final String email;
/// final String id;
/// User({required this.name, required this.email, required this.id});
/// @override
/// String searchId() => id;
/// @override
/// Map<String,dynamic> data() => {"name": name, "email": email};
/// }
/// ```
/// The above example will make the User class searchable
/// The [searchId] is the unique identifier for the user
/// The [data] is the user's name and email
/// The [data] is what will be searched
/// The [searchId] is used to identify the user
abstract class ISearchable {
  String searchId();
  Map<String, dynamic> data();
}

///Abstract class for the search controller
///To use this class, extend it and implement the abstract methods
///[searchedData] and [searchSearchable]
///[searchedData] is the data to be searched
///[searchSearchable] is the method to search the data
///Example:
///```dart
///class SearchController extends ISearchableNotifier {
///  List<ISearchable> _searchedResult = [];
/// SearchStates _states = SearchStates.empty;
/// @override
/// Future<void> searchSearchable() async {
///  _states = SearchStates.loading;
/// try {
/// _searchedResult = await fetchSearchable();
/// if (_searchedResult.isEmpty) {
/// _states = SearchStates.empty;
/// } else {
/// _states = SearchStates.success;
/// }
/// } catch (e) {
/// _states = SearchStates.error;
/// }
/// notifyListeners();
/// }
/// @override
/// List<ISearchable> get searchedData => _searchedResult;
/// @override
/// SearchStates get states => _states;
/// }
/// ```

abstract class ISearchableNotifier with ChangeNotifier {
  List<ISearchable> get searchedData;
  Future<void> searchSearchable();
  SearchStates get states;
}

class SearchController extends ISearchableNotifier {
  List<ISearchable> _searchedResult = [];
  SearchStates _states = SearchStates.empty;
  bool _disposed = false;
  Future<List<ISearchable>>? networtResponse;
  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  Future<void> searchSearchable() async {
    _states = SearchStates.loading;
    try {
      _searchedResult = [];
      if (networtResponse != null) {
        _searchedResult = (await networtResponse) ?? [];
      }
      if (_searchedResult.isEmpty) {
        _states = SearchStates.empty;
      } else {
        _states = SearchStates.success;
      }
    } catch (e) {
      _states = SearchStates.error;
    }
    notifyListeners();
  }

  @override
  List<ISearchable> get searchedData => List.from(Set.from(_searchedResult));

  @override
  SearchStates get states => _states;
}
