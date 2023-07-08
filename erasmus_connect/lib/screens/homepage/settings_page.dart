import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // settingsWgL (279:3173)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfff7ebe1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroups2eqFP2 (Gan8VAW26713T1GYvBS2EQ)
              width: double.infinity,
              height: 678*fem,
              child: Stack(
                children: [
                  Positioned(
                    // autogroupqqyvnNx (Gan4ETFmYtj429MAUWqqyv)
                    left: 15*fem,
                    top: 103*fem,
                    child: Container(
                      width: 288*fem,
                      height: 111*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // hesapW44 (279:3261)
                            left: 12.5*fem,
                            top: 91*fem,
                            child: Align(
                              child: SizedBox(
                                width: 48*fem,
                                height: 20*fem,
                                child: Text(
                                  'Hesap',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Inter',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2125*ffem/fem,
                                    letterSpacing: -0.32*fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // vectormVn (279:3262)
                            left: 259*fem,
                            top: 96*fem,
                            child: Align(
                              child: SizedBox(
                                width: 16.41*fem,
                                height: 14.83*fem,
                                child: Image.asset(
                                  'assets/page-1/images/vector-7rt.png',
                                  width: 16.41*fem,
                                  height: 14.83*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // frame23358gck (287:2395)
                            left: 0*fem,
                            top: 0*fem,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(8.5*fem, 0*fem, 5*fem, 0*fem),
                              width: 288*fem,
                              height: 106.48*fem,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(30*fem),
                              ),
                              child: Container(
                                // group12462oBa (287:2396)
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(30*fem),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x3f000000),
                                      offset: Offset(0*fem, 4*fem),
                                      blurRadius: 2*fem,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogroupzqfeK9v (Gan4ch7iKQzKSNjmxnzQfe)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.11*fem),
                                      width: double.infinity,
                                      height: 62.3*fem,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            // rectangle413RCx (287:2397)
                                            left: 0*fem,
                                            top: 0*fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 274.5*fem,
                                                height: 62*fem,
                                                child: Image.asset(
                                                  'assets/page-1/images/rectangle-413.png',
                                                  width: 274.5*fem,
                                                  height: 62*fem,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            // handehande12KZE (279:3276)
                                            left: 62.5*fem,
                                            top: 11*fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 82*fem,
                                                height: 39*fem,
                                                child: Text(
                                                  'Hande\n@Hande12',
                                                  style: SafeGoogleFont (
                                                    'Inter',
                                                    fontSize: 16*ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.2125*ffem/fem,
                                                    letterSpacing: -0.32*fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            // avatarQ4t (326:673)
                                            left: 12.5*fem,
                                            top: 11*fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 40*fem,
                                                height: 40*fem,
                                                child: Image.asset(
                                                  'assets/page-1/images/avatar-phS.png',
                                                  width: 40*fem,
                                                  height: 40*fem,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            // statusibN (326:676)
                                            left: 39.5*fem,
                                            top: 37*fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 10*fem,
                                                height: 10*fem,
                                                child: Container(
                                                  decoration: BoxDecoration (
                                                    borderRadius: BorderRadius.circular(5*fem),
                                                    color: Color(0xffc4c4c4),
                                                    gradient: LinearGradient (
                                                      begin: Alignment(0, -1),
                                                      end: Alignment(0, 1),
                                                      colors: <Color>[Color(0xfffeca2f), Color(0xfffb8927)],
                                                      stops: <double>[0, 1],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            // icoutlinemodeeditoutlineaNg (287:2414)
                                            left: 233.5*fem,
                                            top: 20.9975585938*fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 18*fem,
                                                height: 18*fem,
                                                child: Image.asset(
                                                  'assets/page-1/images/ic-outline-mode-edit-outline.png',
                                                  width: 18*fem,
                                                  height: 18*fem,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // autogroup9xkg5KS (Gan4k2EqHo8PehvVCg9XkG)
                                      margin: EdgeInsets.fromLTRB(4.93*fem, 0*fem, 8.43*fem, 0*fem),
                                      width: double.infinity,
                                      height: 32.07*fem,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // autogroupmta4omE (Gan5X5n5p3xhe4KVe3MTA4)
                    left: 27*fem,
                    top: 271.9375*fem,
                    child: Container(
                      width: 266.13*fem,
                      height: 33.98*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // karanlkmodKja (279:3264)
                            margin: EdgeInsets.fromLTRB(0*fem, 2.14*fem, 103.91*fem, 0*fem),
                            child: Text(
                              'Karanlık mod',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Inter',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2125*ffem/fem,
                                letterSpacing: -0.32*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // autogroupeaxwpwE (Gan6HZVyM6VEUX6icbeaXW)
                            width: 65.22*fem,
                            height: double.infinity,
                            child: Stack(
                              children: [
                                Positioned(
                                  // vectorwW4 (279:3266)
                                  left: 35.0935058594*fem,
                                  top: 13.0625*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 16.41*fem,
                                      height: 14.83*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-dBA.png',
                                        width: 16.41*fem,
                                        height: 14.83*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // light1FWk (328:861)
                                  left: 4.0935058594*fem,
                                  top: 3.0625*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 60*fem,
                                      height: 30*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/light-1.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2515Mpg (328:877)
                                  left: 53.7275390625*fem,
                                  top: 0.8525390625*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 11.5*fem,
                                      height: 5.87*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2515.png',
                                        width: 11.5*fem,
                                        height: 5.87*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2516Tsi (328:878)
                                  left: 54.0310058594*fem,
                                  top: 2.25*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 10.9*fem,
                                      height: 10.32*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2516.png',
                                        width: 10.9*fem,
                                        height: 10.32*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2517NUt (328:879)
                                  left: 61.4578857422*fem,
                                  top: 3.125*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 0.14*fem,
                                      height: 0.68*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2517.png',
                                        width: 0.14*fem,
                                        height: 0.68*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2518UXv (328:880)
                                  left: 54.4765625*fem,
                                  top: 23.40625*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 9.83*fem,
                                      height: 10.51*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2518.png',
                                        width: 9.83*fem,
                                        height: 10.51*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2519bsS (328:881)
                                  left: 63.8435058594*fem,
                                  top: 25.28125*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 0.78*fem,
                                      height: 1.31*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2519.png',
                                        width: 0.78*fem,
                                        height: 1.31*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2520vui (328:882)
                                  left: 57.6872558594*fem,
                                  top: 25.15625*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 6.81*fem,
                                      height: 7.19*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2520.png',
                                        width: 6.81*fem,
                                        height: 7.19*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2524RrU (328:887)
                                  left: 2.4060058594*fem,
                                  top: 29.6875*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 5.3*fem,
                                      height: 4.3*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2524.png',
                                        width: 5.3*fem,
                                        height: 4.3*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2525LiY (328:888)
                                  left: 3.3942871094*fem,
                                  top: 23.4724121094*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 4.89*fem,
                                      height: 9.95*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2525.png',
                                        width: 4.89*fem,
                                        height: 9.95*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2526U44 (328:889)
                                  left: 5.0935058594*fem,
                                  top: 28.125*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 8.38*fem,
                                      height: 5.69*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2526.png',
                                        width: 8.38*fem,
                                        height: 5.69*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2527o6L (328:890)
                                  left: 6.7810058594*fem,
                                  top: 29.625*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 0.44*fem,
                                      height: 0.38*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2527.png',
                                        width: 0.44*fem,
                                        height: 0.38*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2529KKa (328:893)
                                  left: 11.4060058594*fem,
                                  top: 32.3125*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 0.06*fem,
                                      height: 0.25*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2529.png',
                                        width: 0.06*fem,
                                        height: 0.25*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector25303mN (328:894)
                                  left: 0*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 14.55*fem,
                                      height: 13*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2530.png',
                                        width: 14.55*fem,
                                        height: 13*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2531mBa (328:897)
                                  left: 7.7028808594*fem,
                                  top: 9.234375*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 0.03*fem,
                                      height: 0.17*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2531.png',
                                        width: 0.03*fem,
                                        height: 0.17*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2532V7a (328:902)
                                  left: 6.1560058594*fem,
                                  top: 10.421875*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 0.53*fem,
                                      height: 1.31*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2532.png',
                                        width: 0.53*fem,
                                        height: 1.31*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2534nsN (328:909)
                                  left: 8.3747558594*fem,
                                  top: 7.390625*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 0.06*fem,
                                      height: 0.05*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2534.png',
                                        width: 0.06*fem,
                                        height: 0.05*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2535WoN (328:911)
                                  left: 7.6872558594*fem,
                                  top: 8.078125*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 0.08*fem,
                                      height: 0.34*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2535.png',
                                        width: 0.08*fem,
                                        height: 0.34*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2536ePn (328:912)
                                  left: 7.0310058594*fem,
                                  top: 8.859375*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 0.22*fem,
                                      height: 0.61*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2536.png',
                                        width: 0.22*fem,
                                        height: 0.61*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2537Nag (328:913)
                                  left: 6.3591308594*fem,
                                  top: 10.09375*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 0.25*fem,
                                      height: 0.53*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2537.png',
                                        width: 0.25*fem,
                                        height: 0.53*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2538uac (328:914)
                                  left: 5.6560058594*fem,
                                  top: 11.734375*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 0.14*fem,
                                      height: 0.45*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2538.png',
                                        width: 0.14*fem,
                                        height: 0.45*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2539Esn (328:915)
                                  left: 5.2497558594*fem,
                                  top: 13.25*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 0.09*fem,
                                      height: 0.53*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2539.png',
                                        width: 0.09*fem,
                                        height: 0.53*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2540AFe (328:916)
                                  left: 4.9060058594*fem,
                                  top: 14.625*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 0.08*fem,
                                      height: 0.69*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2540.png',
                                        width: 0.08*fem,
                                        height: 0.69*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2541tSY (328:917)
                                  left: 4.6560058594*fem,
                                  top: 3.75*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 10.94*fem,
                                      height: 11.44*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2541.png',
                                        width: 10.94*fem,
                                        height: 11.44*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector25421GG (328:918)
                                  left: 4.5863037109*fem,
                                  top: 15.25*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 20.53*fem,
                                      height: 18.13*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2542.png',
                                        width: 20.53*fem,
                                        height: 18.13*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2543ve8 (328:919)
                                  left: 24.5310058594*fem,
                                  top: 19.875*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 38.44*fem,
                                      height: 13.22*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2543.png',
                                        width: 38.44*fem,
                                        height: 13.22*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // vector2544rGt (328:920)
                                  left: 51.1560058594*fem,
                                  top: 3.7426757812*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 12.48*fem,
                                      height: 20.6*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/vector-2544.png',
                                        width: 12.48*fem,
                                        height: 20.6*fem,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // autogroup7zrnmue (Gan7HnKxhrXQD6rGuw7ZRN)
                    left: 28*fem,
                    top: 334*fem,
                    child: Container(
                      width: 262.41*fem,
                      height: 20*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // bildirimleri4C (289:1280)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 171*fem, 0*fem),
                            child: Text(
                              'Bildirimler',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Inter',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2125*ffem/fem,
                                letterSpacing: -0.32*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // vectorEHS (279:3271)
                            width: 16.41*fem,
                            height: 14.83*fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-E6g.png',
                              width: 16.41*fem,
                              height: 14.83*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // autogroupgg4tAB6 (Gan7T7PkVFRrfLipJsgG4t)
                    left: 29*fem,
                    top: 374*fem,
                    child: Container(
                      width: 263.41*fem,
                      height: 20*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // engellenenkullanclarHWc (279:3268)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 80*fem, 0*fem),
                            child: Text(
                              'Engellenen Kullanıcılar',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Inter',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2125*ffem/fem,
                                letterSpacing: -0.32*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // vectornyA (279:3272)
                            width: 16.41*fem,
                            height: 14.83*fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-BRv.png',
                              width: 16.41*fem,
                              height: 14.83*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // autogrouppnj8wLG (Gan7aXM4k6BcU5rMUJPnJ8)
                    left: 29*fem,
                    top: 407*fem,
                    child: Container(
                      width: 261.41*fem,
                      height: 20*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // gvenlikCX6 (279:3269)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 180*fem, 0*fem),
                            child: Text(
                              'Güvenlik',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Inter',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2125*ffem/fem,
                                letterSpacing: -0.32*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // vectorHoS (279:3285)
                            margin: EdgeInsets.fromLTRB(0*fem, 0.83*fem, 0*fem, 0*fem),
                            width: 16.41*fem,
                            height: 14.83*fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-pRz.png',
                              width: 16.41*fem,
                              height: 14.83*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // autogroupkjngcqi (Gan7hX9QadrxJmFm21KJnG)
                    left: 27*fem,
                    top: 440*fem,
                    child: Container(
                      width: 268.41*fem,
                      height: 20.83*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // skasorulansorularMHW (279:3282)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 93*fem, 0.83*fem),
                            child: Text(
                              'Sıkça Sorulan Sorular',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Inter',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2125*ffem/fem,
                                letterSpacing: -0.32*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // vectorrk4 (279:3287)
                            width: 16.41*fem,
                            height: 14.83*fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-6Fe.png',
                              width: 16.41*fem,
                              height: 14.83*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // autogroupbxbvPEC (Gan7wRutyGbxPi7kBsbxbv)
                    left: 25.5*fem,
                    top: 506*fem,
                    child: Container(
                      width: 266.91*fem,
                      height: 23.83*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // gizlilikpolitikas7fz (279:3284)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 130.5*fem, 3.83*fem),
                            child: Text(
                              'Gizlilik Politikası',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Inter',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2125*ffem/fem,
                                letterSpacing: -0.32*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // vectorDj2 (289:1281)
                            width: 16.41*fem,
                            height: 14.83*fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-rgk.png',
                              width: 16.41*fem,
                              height: 14.83*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // autogroupurrtkyr (Gan7prGXZ212X6SUFtURrt)
                    left: 26*fem,
                    top: 473*fem,
                    child: Container(
                      width: 268.41*fem,
                      height: 24.83*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // kullanmartlar6H2 (279:3283)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 129*fem, 4.83*fem),
                            child: Text(
                              'Kullanım Şartları',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Inter',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2125*ffem/fem,
                                letterSpacing: -0.32*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // vectorcFN (279:3288)
                            width: 16.41*fem,
                            height: 14.83*fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-jmN.png',
                              width: 16.41*fem,
                              height: 14.83*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // autogroup66b6xKE (Gan58gFkUcU5313EJg66B6)
                    left: 26.5*fem,
                    top: 238*fem,
                    child: Container(
                      width: 263.91*fem,
                      height: 20*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // dilseeneiGqi (279:3263)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 153.5*fem, 0*fem),
                            child: Text(
                              'Dil Seçeneği\n',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Inter',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2125*ffem/fem,
                                letterSpacing: -0.32*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // vectorzFv (279:3265)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.17*fem),
                            width: 16.41*fem,
                            height: 14.83*fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-Md6.png',
                              width: 16.41*fem,
                              height: 14.83*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // buttonlogoutudn (279:3273)
                    left: 137*fem,
                    top: 625*fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(30.5*fem, 10*fem, 10*fem, 10*fem),
                      width: 119*fem,
                      height: 40*fem,
                      decoration: BoxDecoration (
                        color: Color(0xfffab02b),
                        borderRadius: BorderRadius.circular(12*fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // kCct (279:3274)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20.5*fem, 0*fem),
                            child: Text(
                              'Çıkış',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Inter',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2125*ffem/fem,
                                letterSpacing: -0.32*fem,
                                color: Color(0xffbe2234),
                              ),
                            ),
                          ),
                          Container(
                            // vectoribE (279:3275)
                            width: 20*fem,
                            height: 20*fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-XgQ.png',
                              width: 20*fem,
                              height: 20*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // backfWU (326:681)
                    left: 21*fem,
                    top: 48*fem,
                    child: Align(
                      child: SizedBox(
                        width: 41*fem,
                        height: 41*fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'assets/page-1/images/back-mgQ.png',
                            width: 41*fem,
                            height: 41*fem,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // barsstatusbariphonelightMu6 (365:771)
                    left: 29.5*fem,
                    top: 14*fem,
                    child: Container(
                      width: 326.16*fem,
                      height: 20*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // timefet (365:786)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 232.5*fem, 0*fem),
                            child: Text(
                              '9:41',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'SF Pro Text',
                                fontSize: 15*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.3333333333*ffem/fem,
                                letterSpacing: -0.2399999946*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // cellularconnectionamr (365:780)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                            width: 17*fem,
                            height: 10.67*fem,
                            child: Image.asset(
                              'assets/page-1/images/cellular-connection-Ffr.png',
                              width: 17*fem,
                              height: 10.67*fem,
                            ),
                          ),
                          Container(
                            // wifiW9i (365:776)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0.34*fem),
                            width: 15.33*fem,
                            height: 11*fem,
                            child: Image.asset(
                              'assets/page-1/images/wifi-wXa.png',
                              width: 15.33*fem,
                              height: 11*fem,
                            ),
                          ),
                          Container(
                            // batterypgC (365:772)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                            width: 24.33*fem,
                            height: 11.33*fem,
                            child: Image.asset(
                              'assets/page-1/images/battery-81A.png',
                              width: 24.33*fem,
                              height: 11.33*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupydxr8wn (Gan8AqhDf9ervBJmpUYDXr)
              width: 375*fem,
              height: 189*fem,
              child: Image.asset(
                'assets/page-1/images/auto-group-ydxr.png',
                width: 375*fem,
                height: 189*fem,
              ),
            ),
          ],
        ),
      ),
          );
  }
}