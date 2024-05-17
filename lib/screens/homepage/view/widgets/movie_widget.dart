import 'package:flutter/material.dart';

class MovieWidget extends StatelessWidget {
 const MovieWidget({super.key, required this.text,required this.mQuerySize});
  final String text;
  final Size mQuerySize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mQuerySize.height/3,
      width: mQuerySize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
                padding: const EdgeInsets.only(top: 5,bottom: 5,left: 15),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
          SizedBox(
            height: mQuerySize.height/4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    width: 110,
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqiBu7vjmwrGmXbOnrFxDgmmlYwh4OUomm9FnF0i8lvBuUyD3yWEd_38mV7nM_XQIktU8&usqp=CAU')),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
