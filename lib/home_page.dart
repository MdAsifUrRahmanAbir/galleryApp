
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gallery_app/ProviderController.dart';
import 'package:gallery_app/view_page.dart';
import 'package:provider/provider.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    Provider.of<ProviderController>(context, listen: false).getOrderData();
    //productsData.getOrderData();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final dataList = Provider.of<ProviderController>(context).modelList;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        title: const Text('My Artworks',style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
        centerTitle: true,
        actions: const [
          Center(child: Text('Share',style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w700))),
          SizedBox(width: 10,)
        ],
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SizedBox(width: 4,),
            Icon(Icons.settings, color: Colors.amber,),
            SizedBox(width: 2,),
            Icon(Icons.filter_list_alt, color: Colors.amber,),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.08),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextButton(
                    onPressed: () {

                    },
                    child: Row(
                      children: const [
                        Text(
                          'Search Products',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(flex: 14,child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: dataList.isEmpty? const Center(
              child: SpinKitFadingCube(
                color: Colors.amber,
                size: 50.0,
              ),
            ):StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: dataList.length,
              itemBuilder: (BuildContext context, int i) =>  InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewPage(model: dataList[i],)));
                },

                child: Container(

                  margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(image:
                      NetworkImage('${dataList[i].downloadUrl}'), fit: BoxFit.cover, )
                  ),
                  height: 220,
                  width: 180,
                  padding: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.bottomCenter,
                  child:  Text('${dataList[i].author}', textAlign: TextAlign.center,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),

                ),
              ),
              staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 5 : 2.5),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          )),
        ],
      ),
    );
  }
}
