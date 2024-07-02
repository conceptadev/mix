import 'package:flutter/painting.dart';

/// Radix color swatch
/// https://www.radix-ui.com/colors/docs/palette-composition/understanding-the-scale
///

class RadixColors {
  final ColorSwatch<int> swatch;
  final ColorSwatch<int> alphaSwatch;
  const RadixColors(this.swatch, this.alphaSwatch);

  static const amber = RadixColors(_amber, _amberAlpha);
  static const amberDark = RadixColors(_amberDark, _amberDarkAlpha);
  static const blackAlpha = RadixColors(_blackAlpha, _blackAlpha);
  static const blue = RadixColors(_blue, _blueAlpha);
  static const blueDark = RadixColors(_blueDark, _blueDarkAlpha);
  static const bronze = RadixColors(_bronze, _bronzeAlpha);
  static const bronzeDark = RadixColors(_bronzeDark, _bronzeDarkAlpha);
  static const brown = RadixColors(_brown, _brownAlpha);
  static const brownDark = RadixColors(_brownDark, _brownDarkAlpha);
  static const crimson = RadixColors(_crimson, _crimsonAlpha);
  static const crimsonDark = RadixColors(_crimsonDark, _crimsonDarkAlpha);
  static const cyan = RadixColors(_cyan, _cyanAlpha);
  static const cyanDark = RadixColors(_cyanDark, _cyanDarkAlpha);
  static const gold = RadixColors(_gold, _goldAlpha);
  static const goldDark = RadixColors(_goldDark, _goldDarkAlpha);
  static const gray = RadixColors(_gray, _grayAlpha);
  static const grayDark = RadixColors(_grayDark, _grayDarkAlpha);
  static const green = RadixColors(_green, _greenAlpha);
  static const greenDark = RadixColors(_greenDark, _greenDarkAlpha);
  static const indigo = RadixColors(_indigo, _indigoAlpha);
  static const indigoDark = RadixColors(_indigoDark, _indigoDarkAlpha);
  static const lime = RadixColors(_lime, _limeAlpha);
  static const limeDark = RadixColors(_limeDark, _limeDarkAlpha);
  static const orange = RadixColors(_orange, _orangeAlpha);
  static const orangeDark = RadixColors(_orangeDark, _orangeDarkAlpha);
  static const pink = RadixColors(_pink, _pinkAlpha);
  static const pinkDark = RadixColors(_pinkDark, _pinkDarkAlpha);
  static const purple = RadixColors(_purple, _purpleAlpha);
  static const purpleDark = RadixColors(_purpleDark, _purpleDarkAlpha);
  static const red = RadixColors(_red, _redAlpha);
  static const redDark = RadixColors(_redDark, _redDarkAlpha);
  static const teal = RadixColors(_teal, _tealAlpha);
  static const tealDark = RadixColors(_tealDark, _tealDarkAlpha);
  static const violet = RadixColors(_violet, _violetAlpha);
  static const violetDark = RadixColors(_violetDark, _violetDarkAlpha);
  static const yellow = RadixColors(_yellow, _yellowAlpha);
  static const yellowDark = RadixColors(_yellowDark, _yellowDarkAlpha);
  static const grass = RadixColors(_grass, _grassAlpha);
  static const grassDark = RadixColors(_grassDark, _grassDarkAlpha);
  static const sky = RadixColors(_sky, _skyAlpha);
  static const skyDark = RadixColors(_skyDark, _skyDarkAlpha);
  //TODO: ADD REMAINING COLORS

  Color get s1 => swatch[1]!;
  Color get s1Alpha => alphaSwatch[1]!;
  Color get s2 => swatch[2]!;
  Color get s2Alpha => alphaSwatch[2]!;
  Color get s3 => swatch[3]!;
  Color get s3Alpha => alphaSwatch[3]!;
  Color get s4 => swatch[4]!;
  Color get s4Alpha => alphaSwatch[4]!;
  Color get s5 => swatch[5]!;
  Color get s5Alpha => alphaSwatch[5]!;
  Color get s6 => swatch[6]!;
  Color get s6Alpha => alphaSwatch[6]!;
  Color get s7 => swatch[7]!;
  Color get s7Alpha => alphaSwatch[7]!;
  Color get s8 => swatch[8]!;
  Color get s8Alpha => alphaSwatch[8]!;
  Color get s9 => swatch[9]!;
  Color get s9Alpha => alphaSwatch[9]!;
  Color get s10 => swatch[10]!;
  Color get s10Alpha => alphaSwatch[10]!;
  Color get s11 => swatch[11]!;
  Color get s11Alpha => alphaSwatch[11]!;
  Color get s12 => swatch[12]!;
  Color get s12Alpha => alphaSwatch[12]!;
}

const _amber = ColorSwatch(
  0xffee9d2b,
  <int, Color>{
    1: Color(0xfffefdfb),
    2: Color(0xfffff9ed),
    3: Color(0xfffff4d5),
    4: Color(0xffffecbc),
    5: Color(0xffffe3a2),
    6: Color(0xffffd386),
    7: Color(0xfff3ba63),
    8: Color(0xffee9d2b),
    9: Color(0xffffb224),
    10: Color(0xffffa01c),
    11: Color(0xffad5700),
    12: Color(0xff4e2009)
  },
);

const _amberAlpha = ColorSwatch(
  0xd4ea8900,
  <int, Color>{
    1: Color(0x04c08205),
    2: Color(0x12ffab02),
    3: Color(0x2affbb01),
    4: Color(0x43ffb700),
    5: Color(0x5dffb300),
    6: Color(0x79ffa201),
    7: Color(0x9cec8d00),
    8: Color(0xd4ea8900),
    9: Color(0xdbffa600),
    10: Color(0xe3ff9500),
    11: Color(0xfaab5300),
    12: Color(0xf6481800)
  },
);

const _amberDark = ColorSwatch(
  0xffffb224,
  <int, Color>{
    1: Color(0xff1f1300),
    2: Color(0xff271700),
    3: Color(0xff341c00),
    4: Color(0xff3f2200),
    5: Color(0xff4a2900),
    6: Color(0xff573300),
    7: Color(0xff693f05),
    8: Color(0xff824e00),
    9: Color(0xffffb224),
    10: Color(0xffffcb47),
    11: Color(0xfff1a10d),
    12: Color(0xfffef3dd)
  },
);

const _amberDarkAlpha = ColorSwatch(
  0xfaffb625,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x09fd8300),
    3: Color(0x18fe7300),
    4: Color(0x24ff7b00),
    5: Color(0x31ff8400),
    6: Color(0x40ff9500),
    7: Color(0x54ff970f),
    8: Color(0x71ff9900),
    9: Color(0xfaffb625),
    10: Color(0xfaffce48),
    11: Color(0xefffab0e),
    12: Color(0xfafff8e1)
  },
);

const _blackAlpha = ColorSwatch(
  0xe8000000,
  <int, Color>{
    1: Color(0x03000000),
    2: Color(0x07000000),
    3: Color(0x0c000000),
    4: Color(0x12000000),
    5: Color(0x17000000),
    6: Color(0x1d000000),
    7: Color(0x24000000),
    8: Color(0x38000000),
    9: Color(0x70000000),
    10: Color(0x7a000000),
    11: Color(0x90000000),
    12: Color(0xe8000000)
  },
);

const _blue = ColorSwatch(
  0xff0091ff,
  <int, Color>{
    1: Color(0xfffbfdff),
    2: Color(0xfff5faff),
    3: Color(0xffedf6ff),
    4: Color(0xffe1f0ff),
    5: Color(0xffcee7fe),
    6: Color(0xffb7d9f8),
    7: Color(0xff96c7f2),
    8: Color(0xff5eb0ef),
    9: Color(0xff0091ff),
    10: Color(0xff0081f1),
    11: Color(0xff006adc),
    12: Color(0xff00254d)
  },
);

const _blueAlpha = ColorSwatch(
  0xfa0091ff,
  <int, Color>{
    1: Color(0x040582ff),
    2: Color(0x0a0582ff),
    3: Color(0x120280ff),
    4: Color(0x1e0180ff),
    5: Color(0x300180ef),
    6: Color(0x480177e6),
    7: Color(0x690077df),
    8: Color(0xa10082e6),
    9: Color(0xfa0091ff),
    10: Color(0xfa0080f1),
    11: Color(0xfa0066db),
    12: Color(0xfa002149)
  },
);

const _blueDark = ColorSwatch(
  0xff0091ff,
  <int, Color>{
    1: Color(0xff0f1720),
    2: Color(0xff0f1b2d),
    3: Color(0xff10243e),
    4: Color(0xff102a4c),
    5: Color(0xff0f3058),
    6: Color(0xff0d3868),
    7: Color(0xff0a4481),
    8: Color(0xff0954a5),
    9: Color(0xff0091ff),
    10: Color(0xff369eff),
    11: Color(0xff52a9ff),
    12: Color(0xffeaf6ff)
  },
);

const _blueDarkAlpha = ColorSwatch(
  0xfa0095ff,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x0f0f5afc),
    3: Color(0x221677fe),
    4: Color(0x321476fe),
    5: Color(0x400f7bfe),
    6: Color(0x52097cff),
    7: Color(0x6f047dff),
    8: Color(0x98057eff),
    9: Color(0xfa0095ff),
    10: Color(0xfa37a1ff),
    11: Color(0xfa53acff),
    12: Color(0xfaeffbff)
  },
);

const _bronze = ColorSwatch(
  0xffa18072,
  <int, Color>{
    1: Color(0xfffdfcfc),
    2: Color(0xfffdf8f6),
    3: Color(0xfff8f1ee),
    4: Color(0xfff2e8e4),
    5: Color(0xffeaddd7),
    6: Color(0xffe0cec7),
    7: Color(0xffd1b9b0),
    8: Color(0xffbfa094),
    9: Color(0xffa18072),
    10: Color(0xff977669),
    11: Color(0xff846358),
    12: Color(0xff43302b)
  },
);

const _bronzeAlpha = ColorSwatch(
  0x8d551a00,
  <int, Color>{
    1: Color(0x03580505),
    2: Color(0x09c73c05),
    3: Color(0x11972e01),
    4: Color(0x1b842600),
    5: Color(0x28792700),
    6: Color(0x38722100),
    7: Color(0x4f6e2100),
    8: Color(0x6b671d00),
    9: Color(0x8d551a00),
    10: Color(0x964e1600),
    11: Color(0xa7431100),
    12: Color(0xd41d0600)
  },
);

const _bronzeDark = ColorSwatch(
  0xffa18072,
  <int, Color>{
    1: Color(0xff191514),
    2: Color(0xff1f1917),
    3: Color(0xff2a211f),
    4: Color(0xff332824),
    5: Color(0xff3b2e29),
    6: Color(0xff453530),
    7: Color(0xff57433c),
    8: Color(0xff74594e),
    9: Color(0xffa18072),
    10: Color(0xffb08c7d),
    11: Color(0xffcba393),
    12: Color(0xfff9ede7)
  },
);

const _bronzeDarkAlpha = ColorSwatch(
  0x97ffcab3,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x07f7aa83),
    3: Color(0x13ffb7a9),
    4: Color(0x1dfdbca0),
    5: Color(0x26ffbea2),
    6: Color(0x31febca6),
    7: Color(0x45ffbfa8),
    8: Color(0x65ffc1a6),
    9: Color(0x97ffcab3),
    10: Color(0xa8ffcab4),
    11: Color(0xc5ffccb8),
    12: Color(0xf8fff3ed)
  },
);

const _brown = ColorSwatch(
  0xffad7f58,
  <int, Color>{
    1: Color(0xfffefdfc),
    2: Color(0xfffcf9f6),
    3: Color(0xfff8f1ea),
    4: Color(0xfff4e9dd),
    5: Color(0xffefddcc),
    6: Color(0xffe8cdb5),
    7: Color(0xffddb896),
    8: Color(0xffd09e72),
    9: Color(0xffad7f58),
    10: Color(0xffa07653),
    11: Color(0xff886349),
    12: Color(0xff3f2c22)
  },
);

const _brownAlpha = ColorSwatch(
  0xa7823d00,
  <int, Color>{
    1: Color(0x03ab5805),
    2: Color(0x09ab5805),
    3: Color(0x15ab5602),
    4: Color(0x22ad5a01),
    5: Color(0x33af5500),
    6: Color(0x4ab05201),
    7: Color(0x69ac5300),
    8: Color(0x8daa4f00),
    9: Color(0xa7823d00),
    10: Color(0xac723300),
    11: Color(0xb6582500),
    12: Color(0xdd220c00)
  },
);

const _brownDark = ColorSwatch(
  0xffad7f58,
  <int, Color>{
    1: Color(0xff191513),
    2: Color(0xff221813),
    3: Color(0xff2e201a),
    4: Color(0xff36261e),
    5: Color(0xff3e2c22),
    6: Color(0xff493528),
    7: Color(0xff5c4332),
    8: Color(0xff775940),
    9: Color(0xffad7f58),
    10: Color(0xffbd8b60),
    11: Color(0xffdba16e),
    12: Color(0xfffaf0e5)
  },
);

const _brownDarkAlpha = ColorSwatch(
  0xa4ffba7e,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x09ff6913),
    3: Color(0x16fd9163),
    4: Color(0x1ffe9f6c),
    5: Color(0x28feac72),
    6: Color(0x35feb079),
    7: Color(0x4afeb47e),
    8: Color(0x68febc82),
    9: Color(0xa4ffba7e),
    10: Color(0xb6ffbb7f),
    11: Color(0xd7ffbb7f),
    12: Color(0xfafff5e9)
  },
);

const _crimson = ColorSwatch(
  0xffe93d82,
  <int, Color>{
    1: Color(0xfffffcfd),
    2: Color(0xfffff7fb),
    3: Color(0xfffeeff6),
    4: Color(0xfffce5f0),
    5: Color(0xfff9d8e7),
    6: Color(0xfff4c6db),
    7: Color(0xffedadc8),
    8: Color(0xffe58fb1),
    9: Color(0xffe93d82),
    10: Color(0xffe03177),
    11: Color(0xffd31e66),
    12: Color(0xff3d0d1d)
  },
);

const _crimsonAlpha = ColorSwatch(
  0xc2e2005a,
  <int, Color>{
    1: Color(0x03ff0558),
    2: Color(0x08ff0582),
    3: Color(0x10ef0170),
    4: Color(0x1ae2006d),
    5: Color(0x27d80061),
    6: Color(0x39ce015d),
    7: Color(0x52c70053),
    8: Color(0x70c4004f),
    9: Color(0xc2e2005a),
    10: Color(0xced90057),
    11: Color(0xe1cd0052),
    12: Color(0xf2330011)
  },
);

const _crimsonDark = ColorSwatch(
  0xffe93d82,
  <int, Color>{
    1: Color(0xff1d1418),
    2: Color(0xff27141c),
    3: Color(0xff3c1827),
    4: Color(0xff481a2d),
    5: Color(0xff541b33),
    6: Color(0xff641d3b),
    7: Color(0xff801d45),
    8: Color(0xffae1955),
    9: Color(0xffe93d82),
    10: Color(0xfff04f88),
    11: Color(0xfff76190),
    12: Color(0xfffeecf4)
  },
);

const _crimsonDarkAlpha = ColorSwatch(
  0xe6ff418d,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x0bfb1471),
    3: Color(0x23fe3186),
    4: Color(0x31fe3384),
    5: Color(0x3efe3186),
    6: Color(0x50fe3186),
    7: Color(0x70fe287e),
    8: Color(0xa4ff1c77),
    9: Color(0xe6ff418d),
    10: Color(0xeeff538f),
    11: Color(0xf6ff6495),
    12: Color(0xfafff0f8)
  },
);

const _cyan = ColorSwatch(
  0xff05a2c2,
  <int, Color>{
    1: Color(0xfffafdfe),
    2: Color(0xfff2fcfd),
    3: Color(0xffe7f9fb),
    4: Color(0xffd8f3f6),
    5: Color(0xffc4eaef),
    6: Color(0xffaadee6),
    7: Color(0xff84cdda),
    8: Color(0xff3db9cf),
    9: Color(0xff05a2c2),
    10: Color(0xff0894b3),
    11: Color(0xff0c7792),
    12: Color(0xff04313c)
  },
);

const _cyanAlpha = ColorSwatch(
  0xfa00a1c1,
  <int, Color>{
    1: Color(0x05059bcd),
    2: Color(0x0d00c6d8),
    3: Color(0x1802c0d5),
    4: Color(0x2700b1c4),
    5: Color(0x3b01a4ba),
    6: Color(0x55019cb4),
    7: Color(0x7b0097b2),
    8: Color(0xc200a3c0),
    9: Color(0xfa00a1c1),
    10: Color(0xf70090b0),
    11: Color(0xf300718d),
    12: Color(0xfa002d38)
  },
);

const _cyanDark = ColorSwatch(
  0xff05a2c2,
  <int, Color>{
    1: Color(0xff07191d),
    2: Color(0xff061e24),
    3: Color(0xff072830),
    4: Color(0xff07303b),
    5: Color(0xff073844),
    6: Color(0xff064150),
    7: Color(0xff045063),
    8: Color(0xff00647d),
    9: Color(0xff05a2c2),
    10: Color(0xff00b1cc),
    11: Color(0xff00c2d7),
    12: Color(0xffe1f8fa)
  },
);

const _cyanDarkAlpha = ColorSwatch(
  0xba04d5ff,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x0800bbff),
    3: Color(0x1607cbfc),
    4: Color(0x2207c5ff),
    5: Color(0x2c07cdfe),
    6: Color(0x3a02c8ff),
    7: Color(0x4f00ccff),
    8: Color(0x6c00c8ff),
    9: Color(0xba04d5ff),
    10: Color(0xc600ddff),
    11: Color(0xd200e5fe),
    12: Color(0xf9e6fdff)
  },
);

const _gold = ColorSwatch(
  0xff978365,
  <int, Color>{
    1: Color(0xfffdfdfc),
    2: Color(0xfffbf9f2),
    3: Color(0xfff5f2e9),
    4: Color(0xffeeeadd),
    5: Color(0xffe5dfd0),
    6: Color(0xffdad1bd),
    7: Color(0xffcbbda4),
    8: Color(0xffb8a383),
    9: Color(0xff978365),
    10: Color(0xff8c795d),
    11: Color(0xff776750),
    12: Color(0xff3b352b)
  },
);

const _goldAlpha = ColorSwatch(
  0x9a533200,
  <int, Color>{
    1: Color(0x03585805),
    2: Color(0x0db08a00),
    3: Color(0x168c6a02),
    4: Color(0x22806301),
    5: Color(0x2f725201),
    6: Color(0x42704d00),
    7: Color(0x5b6e4500),
    8: Color(0x7c6d4200),
    9: Color(0x9a533200),
    10: Color(0xa24a2d00),
    11: Color(0xaf392100),
    12: Color(0xd4130c00)
  },
);

const _goldDark = ColorSwatch(
  0xff978365,
  <int, Color>{
    1: Color(0xff171613),
    2: Color(0xff1c1a15),
    3: Color(0xff26231c),
    4: Color(0xff2e2a21),
    5: Color(0xff353026),
    6: Color(0xff3e382c),
    7: Color(0xff504737),
    8: Color(0xff6b5d48),
    9: Color(0xff978365),
    10: Color(0xffa59071),
    11: Color(0xffbfa888),
    12: Color(0xfff7f4e7)
  },
);

const _goldDarkAlpha = ColorSwatch(
  0x8dffdca7,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x06facb6e),
    3: Color(0x11fede9d),
    4: Color(0x1afdde9f),
    5: Color(0x21fedda5),
    6: Color(0x2bfedfa7),
    7: Color(0x3fffdda6),
    8: Color(0x5dfed9a5),
    9: Color(0x8dffdca7),
    10: Color(0x9cffdcac),
    11: Color(0xb9ffe0b4),
    12: Color(0xf6fffcee)
  },
);

const _grass = ColorSwatch(
  0xff46a758,
  <int, Color>{
    1: Color(0xfffbfefb),
    2: Color(0xfff3fcf3),
    3: Color(0xffebf9eb),
    4: Color(0xffdff3df),
    5: Color(0xffceebcf),
    6: Color(0xffb7dfba),
    7: Color(0xff97cf9c),
    8: Color(0xff65ba75),
    9: Color(0xff46a758),
    10: Color(0xff3d9a50),
    11: Color(0xff297c3b),
    12: Color(0xff1b311e)
  },
);

const _grassAlpha = ColorSwatch(
  0xb9008619,
  <int, Color>{
    1: Color(0x0405c005),
    2: Color(0x0c05c005),
    3: Color(0x1402b302),
    4: Color(0x2001a001),
    5: Color(0x31019706),
    6: Color(0x48018e0c),
    7: Color(0x68008a0c),
    8: Color(0x9a008d1a),
    9: Color(0xb9008619),
    10: Color(0xc2007a19),
    11: Color(0xd6006316),
    12: Color(0xe4001904)
  },
);

const _grassDark = ColorSwatch(
  0xff46a758,
  <int, Color>{
    1: Color(0xff0d1912),
    2: Color(0xff0f1e13),
    3: Color(0xff132819),
    4: Color(0xff16301d),
    5: Color(0xff193921),
    6: Color(0xff1d4427),
    7: Color(0xff245530),
    8: Color(0xff2f6e3b),
    9: Color(0xff46a758),
    10: Color(0xff55b467),
    11: Color(0xff63c174),
    12: Color(0xffe5fbeb)
  },
);

const _grassDarkAlpha = ColorSwatch(
  0x9e69ff82,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x0668fc3f),
    3: Color(0x1168fc7b),
    4: Color(0x1a67ff80),
    5: Color(0x2463fe7d),
    6: Color(0x3063ff82),
    7: Color(0x4365ff84),
    8: Color(0x5e69ff82),
    9: Color(0x9e69ff82),
    10: Color(0xac78ff91),
    11: Color(0xba83ff97),
    12: Color(0xfaeafff0)
  },
);

const _gray = ColorSwatch(
  0xff8f8f8f,
  <int, Color>{
    1: Color(0xfffcfcfc),
    2: Color(0xfff8f8f8),
    3: Color(0xfff3f3f3),
    4: Color(0xffededed),
    5: Color(0xffe8e8e8),
    6: Color(0xffe2e2e2),
    7: Color(0xffdbdbdb),
    8: Color(0xffc7c7c7),
    9: Color(0xff8f8f8f),
    10: Color(0xff858585),
    11: Color(0xff6f6f6f),
    12: Color(0xff171717)
  },
);

const _grayAlpha = ColorSwatch(
  0x70000000,
  <int, Color>{
    1: Color(0x03000000),
    2: Color(0x07000000),
    3: Color(0x0c000000),
    4: Color(0x12000000),
    5: Color(0x17000000),
    6: Color(0x1d000000),
    7: Color(0x24000000),
    8: Color(0x38000000),
    9: Color(0x70000000),
    10: Color(0x7a000000),
    11: Color(0x90000000),
    12: Color(0xe8000000)
  },
);

const _grayDark = ColorSwatch(
  0xff707070,
  <int, Color>{
    1: Color(0xff161616),
    2: Color(0xff1c1c1c),
    3: Color(0xff232323),
    4: Color(0xff282828),
    5: Color(0xff2e2e2e),
    6: Color(0xff343434),
    7: Color(0xff3e3e3e),
    8: Color(0xff505050),
    9: Color(0xff707070),
    10: Color(0xff7e7e7e),
    11: Color(0xffa0a0a0),
    12: Color(0xffededed)
  },
);

const _grayDarkAlpha = ColorSwatch(
  0x62ffffff,
  <int, Color>{
    1: Color(0x00ffffff),
    2: Color(0x07ffffff),
    3: Color(0x0effffff),
    4: Color(0x14ffffff),
    5: Color(0x1affffff),
    6: Color(0x21ffffff),
    7: Color(0x2cffffff),
    8: Color(0x3fffffff),
    9: Color(0x62ffffff),
    10: Color(0x72ffffff),
    11: Color(0x97ffffff),
    12: Color(0xebffffff)
  },
);

const _green = ColorSwatch(
  0xff30a46c,
  <int, Color>{
    1: Color(0xfffbfefc),
    2: Color(0xfff2fcf5),
    3: Color(0xffe9f9ee),
    4: Color(0xffddf3e4),
    5: Color(0xffccebd7),
    6: Color(0xffb4dfc4),
    7: Color(0xff92ceac),
    8: Color(0xff5bb98c),
    9: Color(0xff30a46c),
    10: Color(0xff299764),
    11: Color(0xff18794e),
    12: Color(0xff153226)
  },
);

const _greenAlpha = ColorSwatch(
  0xcf008f4a,
  <int, Color>{
    1: Color(0x0405c043),
    2: Color(0x0d00c43b),
    3: Color(0x1602ba3c),
    4: Color(0x2201a635),
    5: Color(0x33009b36),
    6: Color(0x4b019336),
    7: Color(0x6d008c3d),
    8: Color(0xa400934c),
    9: Color(0xcf008f4a),
    10: Color(0xd6008346),
    11: Color(0xe7006b3b),
    12: Color(0xea002012)
  },
);

const _greenDark = ColorSwatch(
  0xff30a46c,
  <int, Color>{
    1: Color(0xff0d1912),
    2: Color(0xff0c1f17),
    3: Color(0xff0f291e),
    4: Color(0xff113123),
    5: Color(0xff133929),
    6: Color(0xff164430),
    7: Color(0xff1b543a),
    8: Color(0xff236e4a),
    9: Color(0xff30a46c),
    10: Color(0xff3cb179),
    11: Color(0xff4cc38a),
    12: Color(0xffe5fbeb)
  },
);

const _greenDarkAlpha = ColorSwatch(
  0x9a47ffa6,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x0700f7ca),
    3: Color(0x122afebe),
    4: Color(0x1b33feb3),
    5: Color(0x2438feb5),
    6: Color(0x303dffb1),
    7: Color(0x4243ffad),
    8: Color(0x5e49ffaa),
    9: Color(0x9a47ffa6),
    10: Color(0xa954ffaf),
    11: Color(0xbd62ffb3),
    12: Color(0xfaeafff0)
  },
);

const _indigo = ColorSwatch(
  0xff3e63dd,
  <int, Color>{
    1: Color(0xfffdfdfe),
    2: Color(0xfff8faff),
    3: Color(0xfff0f4ff),
    4: Color(0xffe6edfe),
    5: Color(0xffd9e2fc),
    6: Color(0xffc6d4f9),
    7: Color(0xffaec0f5),
    8: Color(0xff8da4ef),
    9: Color(0xff3e63dd),
    10: Color(0xff3a5ccc),
    11: Color(0xff3451b2),
    12: Color(0xff101d46)
  },
);

const _indigoAlpha = ColorSwatch(
  0xc10031d2,
  <int, Color>{
    1: Color(0x02050582),
    2: Color(0x07054cff),
    3: Color(0x0f0144ff),
    4: Color(0x190247f5),
    5: Color(0x26023ceb),
    6: Color(0x39013de4),
    7: Color(0x510038e0),
    8: Color(0x720134db),
    9: Color(0xc10031d2),
    10: Color(0xc5002cbd),
    11: Color(0xcb00259e),
    12: Color(0xef000e3a)
  },
);

const _indigoDark = ColorSwatch(
  0xff3e63dd,
  <int, Color>{
    1: Color(0xff131620),
    2: Color(0xff15192d),
    3: Color(0xff192140),
    4: Color(0xff1c274f),
    5: Color(0xff1f2c5c),
    6: Color(0xff22346e),
    7: Color(0xff273e89),
    8: Color(0xff2f4eb2),
    9: Color(0xff3e63dd),
    10: Color(0xff5373e7),
    11: Color(0xff849dff),
    12: Color(0xffeef1fd)
  },
);

const _indigoDarkAlpha = ColorSwatch(
  0xd84571ff,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x0f3549fc),
    3: Color(0x253c63fe),
    4: Color(0x363d67ff),
    5: Color(0x453f69fe),
    6: Color(0x593e6bff),
    7: Color(0x783d6aff),
    8: Color(0xa73e6bff),
    9: Color(0xd84571ff),
    10: Color(0xe45a7eff),
    11: Color(0xfa86a0ff),
    12: Color(0xfaf2f5ff)
  },
);

const _lime = ColorSwatch(
  0xff94ba2c,
  <int, Color>{
    1: Color(0xfffcfdfa),
    2: Color(0xfff7fcf0),
    3: Color(0xffeefadc),
    4: Color(0xffe4f7c7),
    5: Color(0xffd7f2b0),
    6: Color(0xffc9e894),
    7: Color(0xffb1d16a),
    8: Color(0xff94ba2c),
    9: Color(0xff99d52a),
    10: Color(0xff93c926),
    11: Color(0xff5d770d),
    12: Color(0xff263209)
  },
);

const _limeAlpha = ColorSwatch(
  0xd37eac00,
  <int, Color>{
    1: Color(0x05699b05),
    2: Color(0x0f77cc01),
    3: Color(0x2384db01),
    4: Color(0x3883db00),
    5: Color(0x4f7cd500),
    6: Color(0x6b7fc800),
    7: Color(0x9578b000),
    8: Color(0xd37eac00),
    9: Color(0xd585cd00),
    10: Color(0xd980c000),
    11: Color(0xf2547000),
    12: Color(0xf61e2b00)
  },
);

const _limeDark = ColorSwatch(
  0xff99d52a,
  <int, Color>{
    1: Color(0xff141807),
    2: Color(0xff181d08),
    3: Color(0xff1e260d),
    4: Color(0xff252e0f),
    5: Color(0xff2b3711),
    6: Color(0xff344213),
    7: Color(0xff415215),
    8: Color(0xff536716),
    9: Color(0xff99d52a),
    10: Color(0xffc4f042),
    11: Color(0xff87be22),
    12: Color(0xffeffbdd)
  },
);

const _limeDarkAlpha = ColorSwatch(
  0xd1b7ff32,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x06cafb35),
    3: Color(0x10b8fd6a),
    4: Color(0x18c4fd5b),
    5: Color(0x22befe51),
    6: Color(0x2ec5ff49),
    7: Color(0x40c8fe3f),
    8: Color(0x57ccff33),
    9: Color(0xd1b7ff32),
    10: Color(0xefd1ff46),
    11: Color(0xb7b5ff2c),
    12: Color(0xfaf4ffe1)
  },
);

const _mauve = ColorSwatch(
  0xff908e96,
  <int, Color>{
    1: Color(0xfffdfcfd),
    2: Color(0xfff9f8f9),
    3: Color(0xfff4f2f4),
    4: Color(0xffeeedef),
    5: Color(0xffe9e8ea),
    6: Color(0xffe4e2e4),
    7: Color(0xffdcdbdd),
    8: Color(0xffc8c7cb),
    9: Color(0xff908e96),
    10: Color(0xff86848d),
    11: Color(0xff6f6e77),
    12: Color(0xff1a1523)
  },
);

const _mauveAlpha = ColorSwatch(
  0x71050012,
  <int, Color>{
    1: Color(0x03580558),
    2: Color(0x07290529),
    3: Color(0x0d270027),
    4: Color(0x1210011e),
    5: Color(0x170d0218),
    6: Color(0x1d120112),
    7: Color(0x2408010f),
    8: Color(0x38050012),
    9: Color(0x71050012),
    10: Color(0x7b040013),
    11: Color(0x91020010),
    12: Color(0xea05000f)
  },
);

const _mauveDark = ColorSwatch(
  0xff706f78,
  <int, Color>{
    1: Color(0xff161618),
    2: Color(0xff1c1c1f),
    3: Color(0xff232326),
    4: Color(0xff28282c),
    5: Color(0xff2e2e32),
    6: Color(0xff34343a),
    7: Color(0xff3e3e44),
    8: Color(0xff504f57),
    9: Color(0xff706f78),
    10: Color(0xff7e7d86),
    11: Color(0xffa09fa6),
    12: Color(0xffededef)
  },
);

const _mauveDarkAlpha = ColorSwatch(
  0x6aeeecff,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x08d7d7fa),
    3: Color(0x10ebebfe),
    4: Color(0x16e5e5fe),
    5: Color(0x1deaeafe),
    6: Color(0x26e1e1fe),
    7: Color(0x31e8e8fe),
    8: Color(0x46eae7ff),
    9: Color(0x6aeeecff),
    10: Color(0x7af0eeff),
    11: Color(0x9df7f5ff),
    12: Color(0xedfdfdff)
  },
);

const _mint = ColorSwatch(
  0xff40c4aa,
  <int, Color>{
    1: Color(0xfff9fefd),
    2: Color(0xffeffefa),
    3: Color(0xffe1fbf4),
    4: Color(0xffd2f7ed),
    5: Color(0xffc0efe3),
    6: Color(0xffa5e4d4),
    7: Color(0xff7dd4c0),
    8: Color(0xff40c4aa),
    9: Color(0xff70e1c8),
    10: Color(0xff69d9c1),
    11: Color(0xff147d6f),
    12: Color(0xff09342e)
  },
);

const _mintAlpha = ColorSwatch(
  0xbf00b08d,
  <int, Color>{
    1: Color(0x0605d5ac),
    2: Color(0x1001efb0),
    3: Color(0x1e01dda2),
    4: Color(0x2d01d29a),
    5: Color(0x3f01be8f),
    6: Color(0x5a00b386),
    7: Color(0x8200ab83),
    8: Color(0xbf00b08d),
    9: Color(0x8f00c99e),
    10: Color(0x9600be95),
    11: Color(0xeb007263),
    12: Color(0xf6002d27)
  },
);

const _mintDark = ColorSwatch(
  0xff70e1c8,
  <int, Color>{
    1: Color(0xff081917),
    2: Color(0xff05201e),
    3: Color(0xff052926),
    4: Color(0xff04312c),
    5: Color(0xff033a34),
    6: Color(0xff01453d),
    7: Color(0xff00564a),
    8: Color(0xff006d5b),
    9: Color(0xff70e1c8),
    10: Color(0xff95f3d9),
    11: Color(0xff25d0ab),
    12: Color(0xffe7fcf7)
  },
);

const _mintDarkAlpha = ColorSwatch(
  0xde80ffe3,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x0800fbfb),
    3: Color(0x1200fded),
    4: Color(0x1b00fde0),
    5: Color(0x2500fee0),
    6: Color(0x3100fedc),
    7: Color(0x4400fed8),
    8: Color(0x5d00fed0),
    9: Color(0xde80ffe3),
    10: Color(0xf29dffe3),
    11: Color(0xcb2cffd1),
    12: Color(0xfaecfffb)
  },
);

const _olive = ColorSwatch(
  0xff8b918a,
  <int, Color>{
    1: Color(0xfffcfdfc),
    2: Color(0xfff8faf8),
    3: Color(0xfff2f4f2),
    4: Color(0xffecefec),
    5: Color(0xffe6e9e6),
    6: Color(0xffe0e4e0),
    7: Color(0xffd8dcd8),
    8: Color(0xffc3c8c2),
    9: Color(0xff8b918a),
    10: Color(0xff818780),
    11: Color(0xff6b716a),
    12: Color(0xff141e12)
  },
);

const _oliveAlpha = ColorSwatch(
  0x75020f00,
  <int, Color>{
    1: Color(0x03055805),
    2: Color(0x07054d05),
    3: Color(0x0d002700),
    4: Color(0x13022a02),
    5: Color(0x19022102),
    6: Color(0x1f012201),
    7: Color(0x27001a00),
    8: Color(0x3d051a01),
    9: Color(0x75020f00),
    10: Color(0x7f030e00),
    11: Color(0x95020c00),
    12: Color(0xed020d00)
  },
);

const _oliveDark = ColorSwatch(
  0xff687366,
  <int, Color>{
    1: Color(0xff151715),
    2: Color(0xff1a1d19),
    3: Color(0xff20241f),
    4: Color(0xff262925),
    5: Color(0xff2b2f2a),
    6: Color(0xff313530),
    7: Color(0xff3b3f3a),
    8: Color(0xff4c514b),
    9: Color(0xff687366),
    10: Color(0xff778175),
    11: Color(0xff9aa299),
    12: Color(0xffeceeec)
  },
);

const _oliveDarkAlpha = ColorSwatch(
  0x65e6ffe1,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x07d5feaf),
    3: Color(0x0fd6fbc4),
    4: Color(0x14effee2),
    5: Color(0x1be9fedf),
    6: Color(0x21ecfee5),
    7: Color(0x2cf1feeb),
    8: Color(0x40f1ffed),
    9: Color(0x65e6ffe1),
    10: Color(0x75ebffe7),
    11: Color(0x99f3fff1),
    12: Color(0xecfdfffd)
  },
);

const _orange = ColorSwatch(
  0xfff76808,
  <int, Color>{
    1: Color(0xfffefcfb),
    2: Color(0xfffef8f4),
    3: Color(0xfffff1e7),
    4: Color(0xffffe8d7),
    5: Color(0xffffdcc3),
    6: Color(0xffffcca7),
    7: Color(0xffffb381),
    8: Color(0xfffa934e),
    9: Color(0xfff76808),
    10: Color(0xffed5f00),
    11: Color(0xffbd4b00),
    12: Color(0xff451e11)
  },
);

const _orangeAlpha = ColorSwatch(
  0xf7f76300,
  <int, Color>{
    1: Color(0x04c04305),
    2: Color(0x0be86005),
    3: Color(0x18ff6c03),
    4: Color(0x28ff6e00),
    5: Color(0x3cff6b01),
    6: Color(0x58ff6b01),
    7: Color(0x7eff6601),
    8: Color(0xb1f86300),
    9: Color(0xf7f76300),
    10: Color(0xfaed5b00),
    11: Color(0xfabc4800),
    12: Color(0xee380e00)
  },
);

const _orangeDark = ColorSwatch(
  0xfff76808,
  <int, Color>{
    1: Color(0xff1f1206),
    2: Color(0xff2b1400),
    3: Color(0xff391a03),
    4: Color(0xff441f04),
    5: Color(0xff4f2305),
    6: Color(0xff5f2a06),
    7: Color(0xff763205),
    8: Color(0xff943e00),
    9: Color(0xfff76808),
    10: Color(0xffff802b),
    11: Color(0xffff8b3e),
    12: Color(0xfffeeadd)
  },
);

const _orangeDarkAlpha = ColorSwatch(
  0xf6ff6b08,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x0efd3700),
    3: Color(0x1efd5400),
    4: Color(0x2afe6100),
    5: Color(0x37fe6201),
    6: Color(0x49ff6506),
    7: Color(0x63ff6403),
    8: Color(0x85fe6600),
    9: Color(0xf6ff6b08),
    10: Color(0xfaff842c),
    11: Color(0xfaff8c3f),
    12: Color(0xfaffeee1)
  },
);

const _pink = ColorSwatch(
  0xffd6409f,
  <int, Color>{
    1: Color(0xfffffcfe),
    2: Color(0xfffff7fc),
    3: Color(0xfffeeef8),
    4: Color(0xfffce5f3),
    5: Color(0xfff9d8ec),
    6: Color(0xfff3c6e2),
    7: Color(0xffecadd4),
    8: Color(0xffe38ec3),
    9: Color(0xffd6409f),
    10: Color(0xffd23197),
    11: Color(0xffcd1d8d),
    12: Color(0xff3b0a2a)
  },
);

const _pinkAlpha = ColorSwatch(
  0xbfc8007f,
  <int, Color>{
    1: Color(0x03ff05ac),
    2: Color(0x08ff059f),
    3: Color(0x11f00194),
    4: Color(0x1ae2008b),
    5: Color(0x27d80081),
    6: Color(0x39c9017c),
    7: Color(0x52c40079),
    8: Color(0x71c00076),
    9: Color(0xbfc8007f),
    10: Color(0xcec7007e),
    11: Color(0xe2c7007e),
    12: Color(0xf5330021)
  },
);

const _pinkDark = ColorSwatch(
  0xffd6409f,
  <int, Color>{
    1: Color(0xff1f121b),
    2: Color(0xff271421),
    3: Color(0xff3a182f),
    4: Color(0xff451a37),
    5: Color(0xff501b3f),
    6: Color(0xff601d48),
    7: Color(0xff7a1d5a),
    8: Color(0xffa71873),
    9: Color(0xffd6409f),
    10: Color(0xffe34ba9),
    11: Color(0xfff65cb6),
    12: Color(0xfffeebf7)
  },
);

const _pinkDarkAlpha = ColorSwatch(
  0xd0ff4abd,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x09fd4ac1),
    3: Color(0x1ffe44c0),
    4: Color(0x2bff41bf),
    5: Color(0x38ff3bc1),
    6: Color(0x4afe38b6),
    7: Color(0x68ff2db5),
    8: Color(0x9bff1cac),
    9: Color(0xd0ff4abd),
    10: Color(0xdfff53bd),
    11: Color(0xf5ff5fbc),
    12: Color(0xfaffeffb)
  },
);

const _plum = ColorSwatch(
  0xffab4aba,
  <int, Color>{
    1: Color(0xfffefcff),
    2: Color(0xfffff8ff),
    3: Color(0xfffceffc),
    4: Color(0xfff9e5f9),
    5: Color(0xfff3d9f4),
    6: Color(0xffebc8ed),
    7: Color(0xffdfafe3),
    8: Color(0xffcf91d8),
    9: Color(0xffab4aba),
    10: Color(0xffa43cb4),
    11: Color(0xff9c2bad),
    12: Color(0xff340c3b)
  },
);

const _plumAlpha = ColorSwatch(
  0xb589009e,
  <int, Color>{
    1: Color(0x03ac05ff),
    2: Color(0x07ff05ff),
    3: Color(0x10d001d0),
    4: Color(0x1ac400c4),
    5: Color(0x26af02b5),
    6: Color(0x37a300ac),
    7: Color(0x509800a6),
    8: Color(0x6e8f00a5),
    9: Color(0xb589009e),
    10: Color(0xc388009d),
    11: Color(0xd488009c),
    12: Color(0xf32a0031)
  },
);

const _plumDark = ColorSwatch(
  0xffab4aba,
  <int, Color>{
    1: Color(0xff1d131d),
    2: Color(0xff251425),
    3: Color(0xff341a34),
    4: Color(0xff3e1d40),
    5: Color(0xff48214b),
    6: Color(0xff542658),
    7: Color(0xff692d6f),
    8: Color(0xff883894),
    9: Color(0xffab4aba),
    10: Color(0xffbd54c6),
    11: Color(0xffd864d8),
    12: Color(0xfffbecfc)
  },
);

const _plumDarkAlpha = ColorSwatch(
  0xb1ea62ff,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x09fb2ffb),
    3: Color(0x1afe58fe),
    4: Color(0x28f153ff),
    5: Color(0x34f158fe),
    6: Color(0x43ee5cfe),
    7: Color(0x5dee5aff),
    8: Color(0x86e959ff),
    9: Color(0xb1ea62ff),
    10: Color(0xbff36aff),
    11: Color(0xd3ff75ff),
    12: Color(0xfafff0ff)
  },
);

const _purple = ColorSwatch(
  0xff8e4ec6,
  <int, Color>{
    1: Color(0xfffefcfe),
    2: Color(0xfffdfaff),
    3: Color(0xfff9f1fe),
    4: Color(0xfff3e7fc),
    5: Color(0xffeddbf9),
    6: Color(0xffe3ccf4),
    7: Color(0xffd3b4ed),
    8: Color(0xffbe93e4),
    9: Color(0xff8e4ec6),
    10: Color(0xff8445bc),
    11: Color(0xff793aaf),
    12: Color(0xff2b0e44)
  },
);

const _purpleAlpha = ColorSwatch(
  0xb15c00ad,
  <int, Color>{
    1: Color(0x03ab05ab),
    2: Color(0x059b05ff),
    3: Color(0x0e9200ed),
    4: Color(0x188002e0),
    5: Color(0x248001d5),
    6: Color(0x337500c8),
    7: Color(0x4b6b01c2),
    8: Color(0x6c6600bf),
    9: Color(0xb15c00ad),
    10: Color(0xba5700a3),
    11: Color(0xc5510097),
    12: Color(0xf11f0039)
  },
);

const _purpleDark = ColorSwatch(
  0xff8e4ec6,
  <int, Color>{
    1: Color(0xff1b141d),
    2: Color(0xff221527),
    3: Color(0xff301a3a),
    4: Color(0xff3a1e48),
    5: Color(0xff432155),
    6: Color(0xff4e2667),
    7: Color(0xff5f2d84),
    8: Color(0xff7938b2),
    9: Color(0xff8e4ec6),
    10: Color(0xff9d5bd2),
    11: Color(0xffbf7af0),
    12: Color(0xfff7ecfc)
  },
);

const _purpleDarkAlpha = ColorSwatch(
  0xbfb561ff,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x0bb52afb),
    3: Color(0x21bc43fe),
    4: Color(0x31be48fe),
    5: Color(0x3fbc49ff),
    6: Color(0x54b74bff),
    7: Color(0x74b14aff),
    8: Color(0xa8ab4bff),
    9: Color(0xbfb561ff),
    10: Color(0xccbd6dff),
    11: Color(0xeecb81ff),
    12: Color(0xfafcf0ff)
  },
);

const _red = ColorSwatch(
  0xffe5484d,
  <int, Color>{
    1: Color(0xfffffcfc),
    2: Color(0xfffff8f8),
    3: Color(0xffffefef),
    4: Color(0xffffe5e5),
    5: Color(0xfffdd8d8),
    6: Color(0xfff9c6c6),
    7: Color(0xfff3aeaf),
    8: Color(0xffeb9091),
    9: Color(0xffe5484d),
    10: Color(0xffdc3d43),
    11: Color(0xffcd2b31),
    12: Color(0xff381316)
  },
);

const _redAlpha = ColorSwatch(
  0xb7db0007,
  <int, Color>{
    1: Color(0x03ff0505),
    2: Color(0x08ff0505),
    3: Color(0x10ff0101),
    4: Color(0x1aff0000),
    5: Color(0x27f20000),
    6: Color(0x39e40101),
    7: Color(0x51d90004),
    8: Color(0x6fd10004),
    9: Color(0xb7db0007),
    10: Color(0xc2d10007),
    11: Color(0xd4c30007),
    12: Color(0xec280003)
  },
);

const _redDark = ColorSwatch(
  0xffe5484d,
  <int, Color>{
    1: Color(0xff1f1315),
    2: Color(0xff291415),
    3: Color(0xff3c181a),
    4: Color(0xff481a1d),
    5: Color(0xff541b1f),
    6: Color(0xff671e22),
    7: Color(0xff822025),
    8: Color(0xffaa2429),
    9: Color(0xffe5484d),
    10: Color(0xfff2555a),
    11: Color(0xffff6369),
    12: Color(0xfffeecee)
  },
);

const _redDarkAlpha = ColorSwatch(
  0xe1ff4f55,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x0bfd2815),
    3: Color(0x21fe3a3d),
    4: Color(0x2ffe3940),
    5: Color(0x3cff353f),
    6: Color(0x52ff353c),
    7: Color(0x71ff303b),
    8: Color(0x9eff2f36),
    9: Color(0xe1ff4f55),
    10: Color(0xf0ff595f),
    11: Color(0xfaff646a),
    12: Color(0xfafff0f2)
  },
);

const _sage = ColorSwatch(
  0xff8a918e,
  <int, Color>{
    1: Color(0xfffbfdfc),
    2: Color(0xfff8faf9),
    3: Color(0xfff1f4f3),
    4: Color(0xffecefed),
    5: Color(0xffe6e9e8),
    6: Color(0xffdfe4e2),
    7: Color(0xffd7dcda),
    8: Color(0xffc2c9c6),
    9: Color(0xff8a918e),
    10: Color(0xff808784),
    11: Color(0xff6a716e),
    12: Color(0xff111c18)
  },
);

const _sageAlpha = ColorSwatch(
  0x75000f09,
  <int, Color>{
    1: Color(0x04058244),
    2: Color(0x07054d29),
    3: Color(0x0e003725),
    4: Color(0x13022a0f),
    5: Color(0x19022117),
    6: Color(0x20012919),
    7: Color(0x28002013),
    8: Color(0x3d011e11),
    9: Color(0x75000f09),
    10: Color(0x7f000e08),
    11: Color(0x95000c07),
    12: Color(0xee000c08)
  },
);

const _sageDark = ColorSwatch(
  0xff66736d,
  <int, Color>{
    1: Color(0xff141716),
    2: Color(0xff191d1b),
    3: Color(0xff1f2421),
    4: Color(0xff252a27),
    5: Color(0xff2a2f2c),
    6: Color(0xff303633),
    7: Color(0xff393f3c),
    8: Color(0xff4a524e),
    9: Color(0xff66736d),
    10: Color(0xff75817b),
    11: Color(0xff99a29e),
    12: Color(0xffeceeed)
  },
);

const _sageDarkAlpha = ColorSwatch(
  0x65e3fff1,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x07d4fed6),
    3: Color(0x0fd5fbd7),
    4: Color(0x15e3ffe5),
    5: Color(0x1be8feea),
    6: Color(0x22e5feee),
    7: Color(0x2ceafef2),
    8: Color(0x41e8fef2),
    9: Color(0x65e3fff1),
    10: Color(0x75e8fff3),
    11: Color(0x99f2fff9),
    12: Color(0xecfdfffe)
  },
);

const _sand = ColorSwatch(
  0xff90908c,
  <int, Color>{
    1: Color(0xfffdfdfc),
    2: Color(0xfff9f9f8),
    3: Color(0xfff3f3f2),
    4: Color(0xffeeeeec),
    5: Color(0xffe9e9e6),
    6: Color(0xffe3e3e0),
    7: Color(0xffdbdbd7),
    8: Color(0xffc8c7c1),
    9: Color(0xff90908c),
    10: Color(0xff868682),
    11: Color(0xff706f6c),
    12: Color(0xff1b1b18)
  },
);

const _sandAlpha = ColorSwatch(
  0x73090900,
  <int, Color>{
    1: Color(0x03585805),
    2: Color(0x07292905),
    3: Color(0x0d141400),
    4: Color(0x131c1c02),
    5: Color(0x19212102),
    6: Color(0x1f1a1a01),
    7: Color(0x281a1a00),
    8: Color(0x3e1e1901),
    9: Color(0x73090900),
    10: Color(0x7d090900),
    11: Color(0x93070600),
    12: Color(0xe7040400)
  },
);

const _sandDark = ColorSwatch(
  0xff717069,
  <int, Color>{
    1: Color(0xff161615),
    2: Color(0xff1c1c1a),
    3: Color(0xff232320),
    4: Color(0xff282826),
    5: Color(0xff2e2e2b),
    6: Color(0xff353431),
    7: Color(0xff3e3e3a),
    8: Color(0xff51504b),
    9: Color(0xff717069),
    10: Color(0xff7f7e77),
    11: Color(0xffa1a09a),
    12: Color(0xffededec)
  },
);

const _sandDarkAlpha = ColorSwatch(
  0x64fffcec,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x07fdfdd5),
    3: Color(0x0efefeda),
    4: Color(0x14fdfdef),
    5: Color(0x1bfdfde9),
    6: Color(0x22fdf6e6),
    7: Color(0x2cffffec),
    8: Color(0x41fefbea),
    9: Color(0x64fffcec),
    10: Color(0x73fffdee),
    11: Color(0x98fffdf4),
    12: Color(0xebfffffe)
  },
);

const _sky = ColorSwatch(
  0xff2ebde5,
  <int, Color>{
    1: Color(0xfff9feff),
    2: Color(0xfff1fcff),
    3: Color(0xffe4f9ff),
    4: Color(0xffd5f4fd),
    5: Color(0xffc1ecf9),
    6: Color(0xffa4dff1),
    7: Color(0xff79cfea),
    8: Color(0xff2ebde5),
    9: Color(0xff68ddfd),
    10: Color(0xff5fd4f4),
    11: Color(0xff0078a1),
    12: Color(0xff003242)
  },
);

const _skyAlpha = ColorSwatch(
  0xd100afdf,
  <int, Color>{
    1: Color(0x0605d5ff),
    2: Color(0x0e01c8ff),
    3: Color(0x1b01c8ff),
    4: Color(0x2a00baf3),
    5: Color(0x3e01b1e7),
    6: Color(0x5b00a5d8),
    7: Color(0x8600a5d7),
    8: Color(0xd100afdf),
    9: Color(0x9700c5fc),
    10: Color(0xa000baed),
    11: Color(0xfa00759f),
    12: Color(0xfa002e3e)
  },
);

const _skyDark = ColorSwatch(
  0xff68ddfd,
  <int, Color>{
    1: Color(0xff0c1820),
    2: Color(0xff071d2a),
    3: Color(0xff082636),
    4: Color(0xff082d41),
    5: Color(0xff08354c),
    6: Color(0xff083e59),
    7: Color(0xff064b6b),
    8: Color(0xff005d85),
    9: Color(0xff68ddfd),
    10: Color(0xff8ae8ff),
    11: Color(0xff2ec8ee),
    12: Color(0xffeaf8ff)
  },
);

const _skyDarkAlpha = ColorSwatch(
  0xfa6ae1ff,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x0b0087fe),
    3: Color(0x1900a5fe),
    4: Color(0x2600a6ff),
    5: Color(0x3200a9fe),
    6: Color(0x4100aefe),
    7: Color(0x5600aefe),
    8: Color(0x7400aeff),
    9: Color(0xfa6ae1ff),
    10: Color(0xfa8decff),
    11: Color(0xec31d6ff),
    12: Color(0xfaeffdff)
  },
);

const _slate = ColorSwatch(
  0xff889096,
  <int, Color>{
    1: Color(0xfffbfcfd),
    2: Color(0xfff8f9fa),
    3: Color(0xfff1f3f5),
    4: Color(0xffeceef0),
    5: Color(0xffe6e8eb),
    6: Color(0xffdfe3e6),
    7: Color(0xffd7dbdf),
    8: Color(0xffc1c8cd),
    9: Color(0xff889096),
    10: Color(0xff7e868c),
    11: Color(0xff687076),
    12: Color(0xff11181c)
  },
);

const _slateAlpha = ColorSwatch(
  0x7700111e,
  <int, Color>{
    1: Color(0x04054482),
    2: Color(0x0705294d),
    3: Color(0x0e002549),
    4: Color(0x13021c37),
    5: Color(0x19021735),
    6: Color(0x20012139),
    7: Color(0x28001a33),
    8: Color(0x3e011e32),
    9: Color(0x7700111e),
    10: Color(0x8100101b),
    11: Color(0x97000e18),
    12: Color(0xee00080c)
  },
);

const _slateDark = ColorSwatch(
  0xff697177,
  <int, Color>{
    1: Color(0xff151718),
    2: Color(0xff1a1d1e),
    3: Color(0xff202425),
    4: Color(0xff26292b),
    5: Color(0xff2b2f31),
    6: Color(0xff313538),
    7: Color(0xff3a3f42),
    8: Color(0xff4c5155),
    9: Color(0xff697177),
    10: Color(0xff787f85),
    11: Color(0xff9ba1a6),
    12: Color(0xffecedee)
  },
);

const _slateDarkAlpha = ColorSwatch(
  0x69e1f1ff,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x07d5feff),
    3: Color(0x0fd6fbfc),
    4: Color(0x15e2f0fd),
    5: Color(0x1cdff3fd),
    6: Color(0x23dfeffe),
    7: Color(0x2ee0f3ff),
    8: Color(0x44e5f2fe),
    9: Color(0x69e1f1ff),
    10: Color(0x78e7f3ff),
    11: Color(0x9deff7ff),
    12: Color(0xecfdfeff)
  },
);

const _teal = ColorSwatch(
  0xff12a594,
  <int, Color>{
    1: Color(0xfffafefd),
    2: Color(0xfff1fcfa),
    3: Color(0xffe7f9f5),
    4: Color(0xffd9f3ee),
    5: Color(0xffc7ebe5),
    6: Color(0xffafdfd7),
    7: Color(0xff8dcec3),
    8: Color(0xff53b9ab),
    9: Color(0xff12a594),
    10: Color(0xff0e9888),
    11: Color(0xff067a6f),
    12: Color(0xff10302b)
  },
);

const _tealAlpha = ColorSwatch(
  0xed009e8c,
  <int, Color>{
    1: Color(0x0505cd9b),
    2: Color(0x0e01c8a4),
    3: Color(0x1802c097),
    4: Color(0x2602af8c),
    5: Color(0x3800a489),
    6: Color(0x50009980),
    7: Color(0x7201927a),
    8: Color(0xac009783),
    9: Color(0xed009e8c),
    10: Color(0xf1009281),
    11: Color(0xf900776b),
    12: Color(0xef00221d)
  },
);

const _tealDark = ColorSwatch(
  0xff12a594,
  <int, Color>{
    1: Color(0xff091915),
    2: Color(0xff04201b),
    3: Color(0xff062923),
    4: Color(0xff07312b),
    5: Color(0xff083932),
    6: Color(0xff09443c),
    7: Color(0xff0b544a),
    8: Color(0xff0c6d62),
    9: Color(0xff12a594),
    10: Color(0xff10b3a3),
    11: Color(0xff0ac5b3),
    12: Color(0xffe1faf4)
  },
);

const _tealDarkAlpha = ColorSwatch(
  0x9b18ffe4,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x0800fbd5),
    3: Color(0x1200fddc),
    4: Color(0x1b00fde8),
    5: Color(0x2402fee4),
    6: Color(0x3009ffe6),
    7: Color(0x4211ffe3),
    8: Color(0x5d11ffe7),
    9: Color(0x9b18ffe4),
    10: Color(0xab13ffe7),
    11: Color(0xbf0affe7),
    12: Color(0xfae6fff9)
  },
);

const _tomato = ColorSwatch(
  0xffe54d2e,
  <int, Color>{
    1: Color(0xfffffcfc),
    2: Color(0xfffff8f7),
    3: Color(0xfffff0ee),
    4: Color(0xffffe6e2),
    5: Color(0xfffdd8d3),
    6: Color(0xfffac7be),
    7: Color(0xfff3b0a2),
    8: Color(0xffea9280),
    9: Color(0xffe54d2e),
    10: Color(0xffdb4324),
    11: Color(0xffca3214),
    12: Color(0xff341711)
  },
);

const _tomatoAlpha = ColorSwatch(
  0xd1df2500,
  <int, Color>{
    1: Color(0x03ff0505),
    2: Color(0x08ff2605),
    3: Color(0x11ff1f01),
    4: Color(0x1dff2201),
    5: Color(0x2cf41d01),
    6: Color(0x41ec2300),
    7: Color(0x5dde2500),
    8: Color(0x7fd52401),
    9: Color(0xd1df2500),
    10: Color(0xdbd52400),
    11: Color(0xebc62100),
    12: Color(0xee260600)
  },
);

const _tomatoDark = ColorSwatch(
  0xffe54d2e,
  <int, Color>{
    1: Color(0xff1d1412),
    2: Color(0xff2a1410),
    3: Color(0xff3b1813),
    4: Color(0xff481a14),
    5: Color(0xff541c15),
    6: Color(0xff652016),
    7: Color(0xff7f2315),
    8: Color(0xffa42a12),
    9: Color(0xffe54d2e),
    10: Color(0xffec5e41),
    11: Color(0xfff16a50),
    12: Color(0xfffeefec)
  },
);

const _tomatoDarkAlpha = ColorSwatch(
  0xe2ff5431,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x0ffd1500),
    3: Color(0x22ff3019),
    4: Color(0x31fe331c),
    5: Color(0x3efe351e),
    6: Color(0x51ff391e),
    7: Color(0x6fff3719),
    8: Color(0x98ff3a12),
    9: Color(0xe2ff5431),
    10: Color(0xeaff6445),
    11: Color(0xefff7054),
    12: Color(0xfafff3f0)
  },
);

const _violet = ColorSwatch(
  0xff6e56cf,
  <int, Color>{
    1: Color(0xfffdfcfe),
    2: Color(0xfffbfaff),
    3: Color(0xfff5f2ff),
    4: Color(0xffede9fe),
    5: Color(0xffe4defc),
    6: Color(0xffd7cff9),
    7: Color(0xffc4b8f3),
    8: Color(0xffaa99ec),
    9: Color(0xff6e56cf),
    10: Color(0xff644fc1),
    11: Color(0xff5746af),
    12: Color(0xff20134b)
  },
);

const _violetAlpha = ColorSwatch(
  0xa92500b6,
  <int, Color>{
    1: Color(0x035805ab),
    2: Color(0x053705ff),
    3: Color(0x0d3c00ff),
    4: Color(0x162e02f4),
    5: Color(0x212f01e8),
    6: Color(0x302a01df),
    7: Color(0x472b01d4),
    8: Color(0x662a00d0),
    9: Color(0xa92500b6),
    10: Color(0xb01f00a5),
    11: Color(0xb9180091),
    12: Color(0xec0e003d)
  },
);

const _violetDark = ColorSwatch(
  0xff6e56cf,
  <int, Color>{
    1: Color(0xff17151f),
    2: Color(0xff1c172b),
    3: Color(0xff251e40),
    4: Color(0xff2c2250),
    5: Color(0xff32275f),
    6: Color(0xff392c72),
    7: Color(0xff443592),
    8: Color(0xff5842c3),
    9: Color(0xff6e56cf),
    10: Color(0xff7c66dc),
    11: Color(0xff9e8cfc),
    12: Color(0xfff1eefe)
  },
);

const _violetDarkAlpha = ColorSwatch(
  0xc88668ff,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x0e743afd),
    3: Color(0x267452fe),
    4: Color(0x387650ff),
    5: Color(0x497654ff),
    6: Color(0x5f7253ff),
    7: Color(0x837053ff),
    8: Color(0xbb6f52ff),
    9: Color(0xc88668ff),
    10: Color(0xd78e75ff),
    11: Color(0xfaa18eff),
    12: Color(0xfaf5f2ff)
  },
);

const _whiteAlpha = ColorSwatch(
  0xebffffff,
  <int, Color>{
    1: Color(0x00ffffff),
    2: Color(0x03ffffff),
    3: Color(0x09ffffff),
    4: Color(0x0effffff),
    5: Color(0x16ffffff),
    6: Color(0x20ffffff),
    7: Color(0x2dffffff),
    8: Color(0x3fffffff),
    9: Color(0x62ffffff),
    10: Color(0x72ffffff),
    11: Color(0x97ffffff),
    12: Color(0xebffffff)
  },
);

const _yellow = ColorSwatch(
  0xffebbc00,
  <int, Color>{
    1: Color(0xfffdfdf9),
    2: Color(0xfffffce8),
    3: Color(0xfffffbd1),
    4: Color(0xfffff8bb),
    5: Color(0xfffef2a4),
    6: Color(0xfff9e68c),
    7: Color(0xffefd36c),
    8: Color(0xffebbc00),
    9: Color(0xfff5d90a),
    10: Color(0xfff7ce00),
    11: Color(0xff946800),
    12: Color(0xff35290f)
  },
);

const _yellowAlpha = ColorSwatch(
  0xfaebbc00,
  <int, Color>{
    1: Color(0x06abab05),
    2: Color(0x17ffdd02),
    3: Color(0x2effea01),
    4: Color(0x44ffe601),
    5: Color(0x5bfcdb00),
    6: Color(0x73f2c900),
    7: Color(0x93e3b200),
    8: Color(0xfaebbc00),
    9: Color(0xf5f5d800),
    10: Color(0xfaf7ce00),
    11: Color(0xfa926600),
    12: Color(0xf0291c00)
  },
);

const _yellowDark = ColorSwatch(
  0xfff5d90a,
  <int, Color>{
    1: Color(0xff1c1500),
    2: Color(0xff221a00),
    3: Color(0xff2c2100),
    4: Color(0xff352800),
    5: Color(0xff3e3000),
    6: Color(0xff493c00),
    7: Color(0xff594a05),
    8: Color(0xff705e00),
    9: Color(0xfff5d90a),
    10: Color(0xffffef5c),
    11: Color(0xfff0c000),
    12: Color(0xfffffad1)
  },
);

const _yellowDarkAlpha = ColorSwatch(
  0xf4ffe20a,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x07facd00),
    3: Color(0x12fdbe00),
    4: Color(0x1cfdc200),
    5: Color(0x26fec700),
    6: Color(0x33fed800),
    7: Color(0x45ffdb13),
    8: Color(0x5ffed800),
    9: Color(0xf4ffe20a),
    10: Color(0xfafff45e),
    11: Color(0xeeffcc00),
    12: Color(0xfaffffd5)
  },
);
