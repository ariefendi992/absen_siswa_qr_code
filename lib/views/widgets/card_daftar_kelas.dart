import 'package:absen_siswa_qr_code/utils/theme.dart';
import 'package:flutter/material.dart';

class CardDaftarKelasWidget extends StatelessWidget {
  const CardDaftarKelasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(18),
        shadowColor: allColor[6],
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: newColorList[2],
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
              colors: [
                allColor[4],
                allColor[4],
                allColor[6],
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              tileMode: TileMode.clamp,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              /// * STAR ICON DESIGN
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: primaryExtraSoft.withAlpha(250),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border(
                      top: BorderSide.none,
                      right: BorderSide.none,
                      bottom: BorderSide.none,
                      left: BorderSide.none,
                    ),
                    color: primaryExtraSoft.withAlpha(250),
                  ),
                  child: Icon(
                    Icons.people_alt_rounded,
                    color: newColorList[3].withAlpha(200),
                    shadows: [
                      Shadow(
                        color: kWhiteColor,
                        blurRadius: 2,
                        offset: Offset(0, 2.0),
                      )
                    ],
                    size: 40,
                  ),
                ),
              ),
              //* END ICON DESIGN
              Expanded(
                flex: MediaQuery.of(context).size.width.toInt(),
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'VIII-3',
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 16,
                            fontWeight: medium),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'St. Nurbaya, S.Pd., M.Pd.',
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 18,
                            fontWeight: medium),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: kWhiteColor,
                  size: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
