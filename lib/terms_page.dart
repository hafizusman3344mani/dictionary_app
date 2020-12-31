import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:urban_dictionary/term.dart';

class TermsPage extends StatelessWidget {
  static final valueKey = ValueKey('TermsPage');
  TermsPage({Key key, this.title,this.terms,this.didSelectTerm}) : super(key: key);
  final String title;
  final List<Term> terms;
  final ValueChanged<Term> didSelectTerm;

  Widget termList() {
    return ListView.builder(
        itemCount: terms.length,
        itemBuilder: (context, index) {
          final term = terms[index];
          return Card(
            child: Column(
              children: [
                ListTile(title: Text('${term.word}'),subtitle: Html(data:term.htmlDefinition),onTap: ()=>didSelectTerm(term),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.favorite,color: Colors.red,),
                          Text('${term.likes}')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.error,color: Colors.black,),
                          Text('${term.dislikes}')
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: SafeArea(minimum: EdgeInsets.symmetric(horizontal: 16,vertical: 8),child: termList()),
    );
  }
}
