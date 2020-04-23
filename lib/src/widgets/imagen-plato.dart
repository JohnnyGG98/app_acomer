import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagenPlato extends StatelessWidget {

  final urlImagen;

  ImagenPlato({this.urlImagen});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      
      imageUrl: urlImagen,
      imageBuilder: (BuildContext context, imageProvider) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          child: ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover 
                ),
              ),
            )
          ),
        );
      },
      placeholder: (BuildContext context, urlImagen) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (BuildContext context, urlImagen, error) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Image.asset('assets/food.jpg'),
          ) ,
        );
      },
    );
  }

}