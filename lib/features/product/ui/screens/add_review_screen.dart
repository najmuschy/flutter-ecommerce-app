import 'package:flutter/material.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key});

  static String name = '/add-review' ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Add Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40 ),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              SizedBox(height: 16,),
              TextFormField(
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: 'Add your review',

                  contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                ),
              ),
              SizedBox(height: 16,),
              ElevatedButton(onPressed: (){}, child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
