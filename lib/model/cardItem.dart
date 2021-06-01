import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Padding cardItem(context, value, title, img) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width / 3.6,
          width: MediaQuery.of(context).size.width / 3.6,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.25,
                blurRadius: 5,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        img,
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(height: 5),
                      Text(
                        title,
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          textStyle: TextStyle(color: HexColor("#06492C")),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        value,
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          textStyle: TextStyle(color: HexColor("#06492C")),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Padding cardItemDouble(context, value1, value2, title, img1, img2) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.width / 3.6,
          width: (MediaQuery.of(context).size.width / 3.6) * 2 + 16,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.25,
                blurRadius: 5,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          textStyle: TextStyle(color: HexColor("#06492C")),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(children: [
                        Image.asset(
                          img1,
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          value1,
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            textStyle: TextStyle(color: HexColor("#06492C")),
                          ),
                        ),
                      ]),
                      Row(children: [
                        Image.asset(
                          img2,
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          value2,
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            textStyle: TextStyle(color: HexColor("#06492C")),
                          ),
                        ),
                      ])
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
