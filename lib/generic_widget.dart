import 'package:flutter/material.dart';

class GenericWidget extends StatefulWidget {
  GenericWidget({Key? key}) : super(key: key);

  @override
  State<GenericWidget> createState() => _GenericWidgetState();
}

class _GenericWidgetState extends State<GenericWidget> {
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if(!isLoading)
         Container(

            height: 100,
            margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/test.png'), // Replace with the path to your image asset.
                fit: BoxFit.cover,

                // You can use different BoxFit options like BoxFit.fill, BoxFit.contain, etc.
              ),
            ),
            child: Column(
              children:const  [
                  Text("Today Offers",
                  maxLines: 2,
                  style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Icon(Icons.arrow_back_outlined),

              ],
            ),
          ),
        if(isLoading)
          Container(

            height: 100, width: 40,
            margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(10),

            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                 RotatedBox(
                  quarterTurns: 3, // Rotates text 90 degrees counter-clockwise (vertically).
                  child: Text(
                    'Today Offers',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                ),

              ],
            ),
          ),
        Expanded(
          child: Container(
             height: 100,
             margin: const EdgeInsets.symmetric(vertical: 16,horizontal: 0.0),
            padding: const EdgeInsets.all(0.0),
             child: PageView.builder(
               controller: PageController(
                 initialPage: 0,
                 viewportFraction: 1.0,
                 // Adjust the visible width of items.
               ),
              onPageChanged: (value) {
                if(value>0)
                  {
                    setState(() {
                      isLoading=true;
                    });
                  }
                if(value==0)
                  {
                    setState(() {
                      isLoading=false;
                    });
                  }
              },
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                height: 100,
                margin: const EdgeInsets.only(right: 2),

                decoration:  BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),

                  ),
                alignment: Alignment.center,
                child: Text("Item ${index}",
                  textAlign: TextAlign.center,
                  style:const  TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
