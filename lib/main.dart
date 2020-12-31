import 'package:flutter/material.dart';
import 'package:urban_dictionary/enter_term_page.dart';
import 'package:urban_dictionary/networking_service.dart';
import 'package:urban_dictionary/term.dart';
import 'package:urban_dictionary/term_detail_page.dart';
import 'package:urban_dictionary/terms_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
  // This widget is the root of your application.
}

class _MyAppState extends State<MyApp> {
  String _searchedTerm;
  Term _selectedTerm;
  List<Term> _terms = [];

  final _networkingService  = NetworkingService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dictionary App',
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Navigator(
          pages: [
            //Show Enter term page
            MaterialPage(
                key: EnterTermPage.valueKey,
                child: EnterTermPage(
                  searchForTerm: _searchForTerm,
                )),

            //Show Terms Page if search term has value
            if (_searchedTerm != null && _searchedTerm.isNotEmpty)
              MaterialPage(
                  key: TermsPage.valueKey,
                  child: TermsPage(
                    title: _searchedTerm,
                    terms: this._terms,
                    didSelectTerm: _didSelectedTerm,
                  )),

            // Show term details page
            if(_selectedTerm!=null)
              MaterialPage(key:TermDetailPage.valueKey,child: TermDetailPage(term: _selectedTerm,))
          ],
          onPopPage: (rout, result) {

            final materialPage = rout.settings as MaterialPage;
            final pageKey = materialPage.key;
            if(pageKey == TermsPage.valueKey){
              this._searchedTerm = null;
            }
            if(pageKey == TermDetailPage.valueKey){
              this._selectedTerm = null;
            }
            return rout.didPop(result);
          },
        ));
  }

  void _searchForTerm(String term) async {
    final terms = await _networkingService.defineTerm(term);
    setState(() {
      this._terms=terms;
      this._searchedTerm = term;
    });
  }

  void _didSelectedTerm(Term term){
    setState(() {
      this._selectedTerm =term;
    });
  }
}
