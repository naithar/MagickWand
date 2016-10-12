// Wand+Boolean.swift
//
// Copyright (c) 2016 Sergey Minakov
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#if os(Linux)
    import CMagickWandLinux
#else
    import CMagickWandOSX
#endif

extension MagickWand {

    /*
    snow	snow	rgb(255, 250, 250)	#FFFAFA
snow1	snow1	rgb(255, 250, 250)	#FFFAFA
snow2	snow2	rgb(238, 233, 233)	#EEE9E9
RosyBrown1	RosyBrown1	rgb(255, 193, 193)	#FFC1C1
RosyBrown2	RosyBrown2	rgb(238, 180, 180)	#EEB4B4
snow3	snow3	rgb(205, 201, 201)	#CDC9C9
LightCoral	LightCoral	rgb(240, 128, 128)	#F08080
IndianRed1	IndianRed1	rgb(255, 106, 106)	#FF6A6A
RosyBrown3	RosyBrown3	rgb(205, 155, 155)	#CD9B9B
IndianRed2	IndianRed2	rgb(238, 99, 99)	#EE6363
RosyBrown	RosyBrown	rgb(188, 143, 143)	#BC8F8F
brown1	brown1	rgb(255, 64, 64)	#FF4040
firebrick1	firebrick1	rgb(255, 48, 48)	#FF3030
brown2	brown2	rgb(238, 59, 59)	#EE3B3B
IndianRed	IndianRed	rgb(205, 92, 92)	#CD5C5C
IndianRed3	IndianRed3	rgb(205, 85, 85)	#CD5555
firebrick2	firebrick2	rgb(238, 44, 44)	#EE2C2C
snow4	snow4	rgb(139, 137, 137)	#8B8989
brown3	brown3	rgb(205, 51, 51)	#CD3333
red	red	rgb(255, 0, 0)	#FF0000
red1	red1	rgb(255, 0, 0)	#FF0000
RosyBrown4	RosyBrown4	rgb(139, 105, 105)	#8B6969
firebrick3	firebrick3	rgb(205, 38, 38)	#CD2626
red2	red2	rgb(238, 0, 0)	#EE0000
firebrick	firebrick	rgb(178, 34, 34)	#B22222
brown	brown	rgb(165, 42, 42)	#A52A2A
red3	red3	rgb(205, 0, 0)	#CD0000
IndianRed4	IndianRed4	rgb(139, 58, 58)	#8B3A3A
brown4	brown4	rgb(139, 35, 35)	#8B2323
firebrick4	firebrick4	rgb(139, 26, 26)	#8B1A1A
DarkRed	DarkRed	rgb(139, 0, 0)	#8B0000
red4	red4	rgb(139, 0, 0)	#8B0000
maroon	maroon (SVG compliance)	rgb(128, 0, 0)	#800000
LightPink1	LightPink1	rgb(255, 174, 185)	#FFAEB9
LightPink3	LightPink3	rgb(205, 140, 149)	#CD8C95
LightPink4	LightPink4	rgb(139, 95, 101)	#8B5F65
LightPink2	LightPink2	rgb(238, 162, 173)	#EEA2AD
LightPink	LightPink	rgb(255, 182, 193)	#FFB6C1
pink	pink	rgb(255, 192, 203)	#FFC0CB
crimson	crimson	rgb(220, 20, 60)	#DC143C
pink1	pink1	rgb(255, 181, 197)	#FFB5C5
pink2	pink2	rgb(238, 169, 184)	#EEA9B8
pink3	pink3	rgb(205, 145, 158)	#CD919E
pink4	pink4	rgb(139, 99, 108)	#8B636C
PaleVioletRed4	PaleVioletRed4	rgb(139, 71, 93)	#8B475D
PaleVioletRed	PaleVioletRed	rgb(219, 112, 147)	#DB7093
PaleVioletRed2	PaleVioletRed2	rgb(238, 121, 159)	#EE799F
PaleVioletRed1	PaleVioletRed1	rgb(255, 130, 171)	#FF82AB
PaleVioletRed3	PaleVioletRed3	rgb(205, 104, 137)	#CD6889
LavenderBlush	LavenderBlush	rgb(255, 240, 245)	#FFF0F5
LavenderBlush1	LavenderBlush1	rgb(255, 240, 245)	#FFF0F5
LavenderBlush3	LavenderBlush3	rgb(205, 193, 197)	#CDC1C5
LavenderBlush2	LavenderBlush2	rgb(238, 224, 229)	#EEE0E5
LavenderBlush4	LavenderBlush4	rgb(139, 131, 134)	#8B8386
maroon	maroon (X11 compliance)	rgb(176, 48, 96)	#B03060
HotPink3	HotPink3	rgb(205, 96, 144)	#CD6090
VioletRed3	VioletRed3	rgb(205, 50, 120)	#CD3278
VioletRed1	VioletRed1	rgb(255, 62, 150)	#FF3E96
VioletRed2	VioletRed2	rgb(238, 58, 140)	#EE3A8C
VioletRed4	VioletRed4	rgb(139, 34, 82)	#8B2252
HotPink2	HotPink2	rgb(238, 106, 167)	#EE6AA7
HotPink1	HotPink1	rgb(255, 110, 180)	#FF6EB4
HotPink4	HotPink4	rgb(139, 58, 98)	#8B3A62
HotPink	HotPink	rgb(255, 105, 180)	#FF69B4
DeepPink	DeepPink	rgb(255, 20, 147)	#FF1493
DeepPink1	DeepPink1	rgb(255, 20, 147)	#FF1493
DeepPink2	DeepPink2	rgb(238, 18, 137)	#EE1289
DeepPink3	DeepPink3	rgb(205, 16, 118)	#CD1076
DeepPink4	DeepPink4	rgb(139, 10, 80)	#8B0A50
maroon1	maroon1	rgb(255, 52, 179)	#FF34B3
maroon2	maroon2	rgb(238, 48, 167)	#EE30A7
maroon3	maroon3	rgb(205, 41, 144)	#CD2990
maroon4	maroon4	rgb(139, 28, 98)	#8B1C62
MediumVioletRed	MediumVioletRed	rgb(199, 21, 133)	#C71585
VioletRed	VioletRed	rgb(208, 32, 144)	#D02090
orchid2	orchid2	rgb(238, 122, 233)	#EE7AE9
orchid	orchid	rgb(218, 112, 214)	#DA70D6
orchid1	orchid1	rgb(255, 131, 250)	#FF83FA
orchid3	orchid3	rgb(205, 105, 201)	#CD69C9
orchid4	orchid4	rgb(139, 71, 137)	#8B4789
thistle1	thistle1	rgb(255, 225, 255)	#FFE1FF
thistle2	thistle2	rgb(238, 210, 238)	#EED2EE
plum1	plum1	rgb(255, 187, 255)	#FFBBFF
plum2	plum2	rgb(238, 174, 238)	#EEAEEE
thistle	thistle	rgb(216, 191, 216)	#D8BFD8
thistle3	thistle3	rgb(205, 181, 205)	#CDB5CD
plum	plum	rgb(221, 160, 221)	#DDA0DD
violet	violet	rgb(238, 130, 238)	#EE82EE
plum3	plum3	rgb(205, 150, 205)	#CD96CD
thistle4	thistle4	rgb(139, 123, 139)	#8B7B8B
fuchsia	fuchsia	rgb(255, 0, 255)	#FF00FF
magenta	magenta	rgb(255, 0, 255)	#FF00FF
magenta1	magenta1	rgb(255, 0, 255)	#FF00FF
plum4	plum4	rgb(139, 102, 139)	#8B668B
magenta2	magenta2	rgb(238, 0, 238)	#EE00EE
magenta3	magenta3	rgb(205, 0, 205)	#CD00CD
DarkMagenta	DarkMagenta	rgb(139, 0, 139)	#8B008B
magenta4	magenta4	rgb(139, 0, 139)	#8B008B
purple	purple (SVG compliance)	rgb(128, 0, 128)	#800080
MediumOrchid	MediumOrchid	rgb(186, 85, 211)	#BA55D3
MediumOrchid1	MediumOrchid1	rgb(224, 102, 255)	#E066FF
MediumOrchid2	MediumOrchid2	rgb(209, 95, 238)	#D15FEE
MediumOrchid3	MediumOrchid3	rgb(180, 82, 205)	#B452CD
MediumOrchid4	MediumOrchid4	rgb(122, 55, 139)	#7A378B
DarkViolet	DarkViolet	rgb(148, 0, 211)	#9400D3
DarkOrchid	DarkOrchid	rgb(153, 50, 204)	#9932CC
DarkOrchid1	DarkOrchid1	rgb(191, 62, 255)	#BF3EFF
DarkOrchid3	DarkOrchid3	rgb(154, 50, 205)	#9A32CD
DarkOrchid2	DarkOrchid2	rgb(178, 58, 238)	#B23AEE
DarkOrchid4	DarkOrchid4	rgb(104, 34, 139)	#68228B
purple	purple (X11 compliance)	rgb(160, 32, 240)	#A020F0
indigo	indigo	rgb( 75, 0, 130)	#4B0082
BlueViolet	BlueViolet	rgb(138, 43, 226)	#8A2BE2
purple2	purple2	rgb(145, 44, 238)	#912CEE
purple3	purple3	rgb(125, 38, 205)	#7D26CD
purple4	purple4	rgb( 85, 26, 139)	#551A8B
purple1	purple1	rgb(155, 48, 255)	#9B30FF
MediumPurple	MediumPurple	rgb(147, 112, 219)	#9370DB
MediumPurple1	MediumPurple1	rgb(171, 130, 255)	#AB82FF
MediumPurple2	MediumPurple2	rgb(159, 121, 238)	#9F79EE
MediumPurple3	MediumPurple3	rgb(137, 104, 205)	#8968CD
MediumPurple4	MediumPurple4	rgb( 93, 71, 139)	#5D478B
DarkSlateBlue	DarkSlateBlue	rgb( 72, 61, 139)	#483D8B
LightSlateBlue	LightSlateBlue	rgb(132, 112, 255)	#8470FF
MediumSlateBlue	MediumSlateBlue	rgb(123, 104, 238)	#7B68EE
SlateBlue	SlateBlue	rgb(106, 90, 205)	#6A5ACD
SlateBlue1	SlateBlue1	rgb(131, 111, 255)	#836FFF
SlateBlue2	SlateBlue2	rgb(122, 103, 238)	#7A67EE
SlateBlue3	SlateBlue3	rgb(105, 89, 205)	#6959CD
SlateBlue4	SlateBlue4	rgb( 71, 60, 139)	#473C8B
GhostWhite	GhostWhite	rgb(248, 248, 255)	#F8F8FF
lavender	lavender	rgb(230, 230, 250)	#E6E6FA
blue	blue	rgb( 0, 0, 255)	#0000FF
blue1	blue1	rgb( 0, 0, 255)	#0000FF
blue2	blue2	rgb( 0, 0, 238)	#0000EE
blue3	blue3	rgb( 0, 0, 205)	#0000CD
MediumBlue	MediumBlue	rgb( 0, 0, 205)	#0000CD
blue4	blue4	rgb( 0, 0, 139)	#00008B
DarkBlue	DarkBlue	rgb( 0, 0, 139)	#00008B
MidnightBlue	MidnightBlue	rgb( 25, 25, 112)	#191970
navy	navy	rgb( 0, 0, 128)	#000080
NavyBlue	NavyBlue	rgb( 0, 0, 128)	#000080
RoyalBlue	RoyalBlue	rgb( 65, 105, 225)	#4169E1
RoyalBlue1	RoyalBlue1	rgb( 72, 118, 255)	#4876FF
RoyalBlue2	RoyalBlue2	rgb( 67, 110, 238)	#436EEE
RoyalBlue3	RoyalBlue3	rgb( 58, 95, 205)	#3A5FCD
RoyalBlue4	RoyalBlue4	rgb( 39, 64, 139)	#27408B
CornflowerBlue	CornflowerBlue	rgb(100, 149, 237)	#6495ED
LightSteelBlue	LightSteelBlue	rgb(176, 196, 222)	#B0C4DE
LightSteelBlue1	LightSteelBlue1	rgb(202, 225, 255)	#CAE1FF
LightSteelBlue2	LightSteelBlue2	rgb(188, 210, 238)	#BCD2EE
LightSteelBlue3	LightSteelBlue3	rgb(162, 181, 205)	#A2B5CD
LightSteelBlue4	LightSteelBlue4	rgb(110, 123, 139)	#6E7B8B
SlateGray4	SlateGray4	rgb(108, 123, 139)	#6C7B8B
SlateGray1	SlateGray1	rgb(198, 226, 255)	#C6E2FF
SlateGray2	SlateGray2	rgb(185, 211, 238)	#B9D3EE
SlateGray3	SlateGray3	rgb(159, 182, 205)	#9FB6CD
LightSlateGray	LightSlateGray	rgb(119, 136, 153)	#778899
LightSlateGrey	LightSlateGrey	rgb(119, 136, 153)	#778899
SlateGray	SlateGray	rgb(112, 128, 144)	#708090
SlateGrey	SlateGrey	rgb(112, 128, 144)	#708090
DodgerBlue	DodgerBlue	rgb( 30, 144, 255)	#1E90FF
DodgerBlue1	DodgerBlue1	rgb( 30, 144, 255)	#1E90FF
DodgerBlue2	DodgerBlue2	rgb( 28, 134, 238)	#1C86EE
DodgerBlue4	DodgerBlue4	rgb( 16, 78, 139)	#104E8B
DodgerBlue3	DodgerBlue3	rgb( 24, 116, 205)	#1874CD
AliceBlue	AliceBlue	rgb(240, 248, 255)	#F0F8FF
SteelBlue4	SteelBlue4	rgb( 54, 100, 139)	#36648B
SteelBlue	SteelBlue	rgb( 70, 130, 180)	#4682B4
SteelBlue1	SteelBlue1	rgb( 99, 184, 255)	#63B8FF
SteelBlue2	SteelBlue2	rgb( 92, 172, 238)	#5CACEE
SteelBlue3	SteelBlue3	rgb( 79, 148, 205)	#4F94CD
SkyBlue4	SkyBlue4	rgb( 74, 112, 139)	#4A708B
SkyBlue1	SkyBlue1	rgb(135, 206, 255)	#87CEFF
SkyBlue2	SkyBlue2	rgb(126, 192, 238)	#7EC0EE
SkyBlue3	SkyBlue3	rgb(108, 166, 205)	#6CA6CD
LightSkyBlue	LightSkyBlue	rgb(135, 206, 250)	#87CEFA
LightSkyBlue4	LightSkyBlue4	rgb( 96, 123, 139)	#607B8B
LightSkyBlue1	LightSkyBlue1	rgb(176, 226, 255)	#B0E2FF
LightSkyBlue2	LightSkyBlue2	rgb(164, 211, 238)	#A4D3EE
LightSkyBlue3	LightSkyBlue3	rgb(141, 182, 205)	#8DB6CD
SkyBlue	SkyBlue	rgb(135, 206, 235)	#87CEEB
LightBlue3	LightBlue3	rgb(154, 192, 205)	#9AC0CD
DeepSkyBlue	DeepSkyBlue	rgb( 0, 191, 255)	#00BFFF
DeepSkyBlue1	DeepSkyBlue1	rgb( 0, 191, 255)	#00BFFF
DeepSkyBlue2	DeepSkyBlue2	rgb( 0, 178, 238)	#00B2EE
DeepSkyBlue4	DeepSkyBlue4	rgb( 0, 104, 139)	#00688B
DeepSkyBlue3	DeepSkyBlue3	rgb( 0, 154, 205)	#009ACD
LightBlue1	LightBlue1	rgb(191, 239, 255)	#BFEFFF
LightBlue2	LightBlue2	rgb(178, 223, 238)	#B2DFEE
LightBlue	LightBlue	rgb(173, 216, 230)	#ADD8E6
LightBlue4	LightBlue4	rgb(104, 131, 139)	#68838B
PowderBlue	PowderBlue	rgb(176, 224, 230)	#B0E0E6
CadetBlue1	CadetBlue1	rgb(152, 245, 255)	#98F5FF
CadetBlue2	CadetBlue2	rgb(142, 229, 238)	#8EE5EE
CadetBlue3	CadetBlue3	rgb(122, 197, 205)	#7AC5CD
CadetBlue4	CadetBlue4	rgb( 83, 134, 139)	#53868B
turquoise1	turquoise1	rgb( 0, 245, 255)	#00F5FF
turquoise2	turquoise2	rgb( 0, 229, 238)	#00E5EE
turquoise3	turquoise3	rgb( 0, 197, 205)	#00C5CD
turquoise4	turquoise4	rgb( 0, 134, 139)	#00868B
cadet blue	cadet blue	rgb( 95, 158, 160)	#5F9EA0
CadetBlue	CadetBlue	rgb( 95, 158, 160)	#5F9EA0
DarkTurquoise	DarkTurquoise	rgb( 0, 206, 209)	#00CED1
azure	azure	rgb(240, 255, 255)	#F0FFFF
azure1	azure1	rgb(240, 255, 255)	#F0FFFF
LightCyan	LightCyan	rgb(224, 255, 255)	#E0FFFF
LightCyan1	LightCyan1	rgb(224, 255, 255)	#E0FFFF
azure2	azure2	rgb(224, 238, 238)	#E0EEEE
LightCyan2	LightCyan2	rgb(209, 238, 238)	#D1EEEE
PaleTurquoise1	PaleTurquoise1	rgb(187, 255, 255)	#BBFFFF
PaleTurquoise	PaleTurquoise	rgb(175, 238, 238)	#AFEEEE
PaleTurquoise2	PaleTurquoise2	rgb(174, 238, 238)	#AEEEEE
DarkSlateGray1	DarkSlateGray1	rgb(151, 255, 255)	#97FFFF
azure3	azure3	rgb(193, 205, 205)	#C1CDCD
LightCyan3	LightCyan3	rgb(180, 205, 205)	#B4CDCD
DarkSlateGray2	DarkSlateGray2	rgb(141, 238, 238)	#8DEEEE
PaleTurquoise3	PaleTurquoise3	rgb(150, 205, 205)	#96CDCD
DarkSlateGray3	DarkSlateGray3	rgb(121, 205, 205)	#79CDCD
azure4	azure4	rgb(131, 139, 139)	#838B8B
LightCyan4	LightCyan4	rgb(122, 139, 139)	#7A8B8B
aqua	aqua	rgb( 0, 255, 255)	#00FFFF
cyan	cyan	rgb( 0, 255, 255)	#00FFFF
cyan1	cyan1	rgb( 0, 255, 255)	#00FFFF
PaleTurquoise4	PaleTurquoise4	rgb(102, 139, 139)	#668B8B
cyan2	cyan2	rgb( 0, 238, 238)	#00EEEE
DarkSlateGray4	DarkSlateGray4	rgb( 82, 139, 139)	#528B8B
cyan3	cyan3	rgb( 0, 205, 205)	#00CDCD
cyan4	cyan4	rgb( 0, 139, 139)	#008B8B
DarkCyan	DarkCyan	rgb( 0, 139, 139)	#008B8B
teal	teal	rgb( 0, 128, 128)	#008080
DarkSlateGray	DarkSlateGray	rgb( 47, 79, 79)	#2F4F4F
DarkSlateGrey	DarkSlateGrey	rgb( 47, 79, 79)	#2F4F4F
MediumTurquoise	MediumTurquoise	rgb( 72, 209, 204)	#48D1CC
LightSeaGreen	LightSeaGreen	rgb( 32, 178, 170)	#20B2AA
turquoise	turquoise	rgb( 64, 224, 208)	#40E0D0
aquamarine4	aquamarine4	rgb( 69, 139, 116)	#458B74
aquamarine	aquamarine	rgb(127, 255, 212)	#7FFFD4
aquamarine1	aquamarine1	rgb(127, 255, 212)	#7FFFD4
aquamarine2	aquamarine2	rgb(118, 238, 198)	#76EEC6
aquamarine3	aquamarine3	rgb(102, 205, 170)	#66CDAA
MediumAquamarine	MediumAquamarine	rgb(102, 205, 170)	#66CDAA
MediumSpringGreen	MediumSpringGreen	rgb( 0, 250, 154)	#00FA9A
MintCream	MintCream	rgb(245, 255, 250)	#F5FFFA
SpringGreen	SpringGreen	rgb( 0, 255, 127)	#00FF7F
SpringGreen1	SpringGreen1	rgb( 0, 255, 127)	#00FF7F
SpringGreen2	SpringGreen2	rgb( 0, 238, 118)	#00EE76
SpringGreen3	SpringGreen3	rgb( 0, 205, 102)	#00CD66
SpringGreen4	SpringGreen4	rgb( 0, 139, 69)	#008B45
MediumSeaGreen	MediumSeaGreen	rgb( 60, 179, 113)	#3CB371
SeaGreen	SeaGreen	rgb( 46, 139, 87)	#2E8B57
SeaGreen3	SeaGreen3	rgb( 67, 205, 128)	#43CD80
SeaGreen1	SeaGreen1	rgb( 84, 255, 159)	#54FF9F
SeaGreen4	SeaGreen4	rgb( 46, 139, 87)	#2E8B57
SeaGreen2	SeaGreen2	rgb( 78, 238, 148)	#4EEE94
MediumForestGreen	MediumForestGreen	rgb( 50, 129, 75)	#32814B
honeydew	honeydew	rgb(240, 255, 240)	#F0FFF0
honeydew1	honeydew1	rgb(240, 255, 240)	#F0FFF0
honeydew2	honeydew2	rgb(224, 238, 224)	#E0EEE0
DarkSeaGreen1	DarkSeaGreen1	rgb(193, 255, 193)	#C1FFC1
DarkSeaGreen2	DarkSeaGreen2	rgb(180, 238, 180)	#B4EEB4
PaleGreen1	PaleGreen1	rgb(154, 255, 154)	#9AFF9A
PaleGreen	PaleGreen	rgb(152, 251, 152)	#98FB98
honeydew3	honeydew3	rgb(193, 205, 193)	#C1CDC1
LightGreen	LightGreen	rgb(144, 238, 144)	#90EE90
PaleGreen2	PaleGreen2	rgb(144, 238, 144)	#90EE90
DarkSeaGreen3	DarkSeaGreen3	rgb(155, 205, 155)	#9BCD9B
DarkSeaGreen	DarkSeaGreen	rgb(143, 188, 143)	#8FBC8F
PaleGreen3	PaleGreen3	rgb(124, 205, 124)	#7CCD7C
honeydew4	honeydew4	rgb(131, 139, 131)	#838B83
green1	green1	rgb( 0, 255, 0)	#00FF00
lime	lime	rgb( 0, 255, 0)	#00FF00
LimeGreen	LimeGreen	rgb( 50, 205, 50)	#32CD32
DarkSeaGreen4	DarkSeaGreen4	rgb(105, 139, 105)	#698B69
green2	green2	rgb( 0, 238, 0)	#00EE00
PaleGreen4	PaleGreen4	rgb( 84, 139, 84)	#548B54
green3	green3	rgb( 0, 205, 0)	#00CD00
ForestGreen	ForestGreen	rgb( 34, 139, 34)	#228B22
green4	green4	rgb( 0, 139, 0)	#008B00
green	green	rgb( 0, 128, 0)	#008000
DarkGreen	DarkGreen	rgb( 0, 100, 0)	#006400
LawnGreen	LawnGreen	rgb(124, 252, 0)	#7CFC00
chartreuse	chartreuse	rgb(127, 255, 0)	#7FFF00
chartreuse1	chartreuse1	rgb(127, 255, 0)	#7FFF00
chartreuse2	chartreuse2	rgb(118, 238, 0)	#76EE00
chartreuse3	chartreuse3	rgb(102, 205, 0)	#66CD00
chartreuse4	chartreuse4	rgb( 69, 139, 0)	#458B00
GreenYellow	GreenYellow	rgb(173, 255, 47)	#ADFF2F
DarkOliveGreen3	DarkOliveGreen3	rgb(162, 205, 90)	#A2CD5A
DarkOliveGreen1	DarkOliveGreen1	rgb(202, 255, 112)	#CAFF70
DarkOliveGreen2	DarkOliveGreen2	rgb(188, 238, 104)	#BCEE68
DarkOliveGreen4	DarkOliveGreen4	rgb(110, 139, 61)	#6E8B3D
DarkOliveGreen	DarkOliveGreen	rgb( 85, 107, 47)	#556B2F
OliveDrab	OliveDrab	rgb(107, 142, 35)	#6B8E23
OliveDrab1	OliveDrab1	rgb(192, 255, 62)	#C0FF3E
OliveDrab2	OliveDrab2	rgb(179, 238, 58)	#B3EE3A
OliveDrab3	OliveDrab3	rgb(154, 205, 50)	#9ACD32
YellowGreen	YellowGreen	rgb(154, 205, 50)	#9ACD32
OliveDrab4	OliveDrab4	rgb(105, 139, 34)	#698B22
ivory	ivory	rgb(255, 255, 240)	#FFFFF0
ivory1	ivory1	rgb(255, 255, 240)	#FFFFF0
LightYellow	LightYellow	rgb(255, 255, 224)	#FFFFE0
LightYellow1	LightYellow1	rgb(255, 255, 224)	#FFFFE0
beige	beige	rgb(245, 245, 220)	#F5F5DC
ivory2	ivory2	rgb(238, 238, 224)	#EEEEE0
LightGoldenrodYellow	LightGoldenrodYellow	rgb(250, 250, 210)	#FAFAD2
LightYellow2	LightYellow2	rgb(238, 238, 209)	#EEEED1
ivory3	ivory3	rgb(205, 205, 193)	#CDCDC1
LightYellow3	LightYellow3	rgb(205, 205, 180)	#CDCDB4
ivory4	ivory4	rgb(139, 139, 131)	#8B8B83
LightYellow4	LightYellow4	rgb(139, 139, 122)	#8B8B7A
yellow	yellow	rgb(255, 255, 0)	#FFFF00
yellow1	yellow1	rgb(255, 255, 0)	#FFFF00
yellow2	yellow2	rgb(238, 238, 0)	#EEEE00
yellow3	yellow3	rgb(205, 205, 0)	#CDCD00
yellow4	yellow4	rgb(139, 139, 0)	#8B8B00
olive	olive	rgb(128, 128, 0)	#808000
DarkKhaki	DarkKhaki	rgb(189, 183, 107)	#BDB76B
khaki2	khaki2	rgb(238, 230, 133)	#EEE685
LemonChiffon4	LemonChiffon4	rgb(139, 137, 112)	#8B8970
khaki1	khaki1	rgb(255, 246, 143)	#FFF68F
khaki3	khaki3	rgb(205, 198, 115)	#CDC673
khaki4	khaki4	rgb(139, 134, 78)	#8B864E
PaleGoldenrod	PaleGoldenrod	rgb(238, 232, 170)	#EEE8AA
LemonChiffon	LemonChiffon	rgb(255, 250, 205)	#FFFACD
LemonChiffon1	LemonChiffon1	rgb(255, 250, 205)	#FFFACD
khaki	khaki	rgb(240, 230, 140)	#F0E68C
LemonChiffon3	LemonChiffon3	rgb(205, 201, 165)	#CDC9A5
LemonChiffon2	LemonChiffon2	rgb(238, 233, 191)	#EEE9BF
MediumGoldenRod	MediumGoldenRod	rgb(209, 193, 102)	#D1C166
cornsilk4	cornsilk4	rgb(139, 136, 120)	#8B8878
gold	gold	rgb(255, 215, 0)	#FFD700
gold1	gold1	rgb(255, 215, 0)	#FFD700
gold2	gold2	rgb(238, 201, 0)	#EEC900
gold3	gold3	rgb(205, 173, 0)	#CDAD00
gold4	gold4	rgb(139, 117, 0)	#8B7500
LightGoldenrod	LightGoldenrod	rgb(238, 221, 130)	#EEDD82
LightGoldenrod4	LightGoldenrod4	rgb(139, 129, 76)	#8B814C
LightGoldenrod1	LightGoldenrod1	rgb(255, 236, 139)	#FFEC8B
LightGoldenrod3	LightGoldenrod3	rgb(205, 190, 112)	#CDBE70
LightGoldenrod2	LightGoldenrod2	rgb(238, 220, 130)	#EEDC82
cornsilk3	cornsilk3	rgb(205, 200, 177)	#CDC8B1
cornsilk2	cornsilk2	rgb(238, 232, 205)	#EEE8CD
cornsilk	cornsilk	rgb(255, 248, 220)	#FFF8DC
cornsilk1	cornsilk1	rgb(255, 248, 220)	#FFF8DC
goldenrod	goldenrod	rgb(218, 165, 32)	#DAA520
goldenrod1	goldenrod1	rgb(255, 193, 37)	#FFC125
goldenrod2	goldenrod2	rgb(238, 180, 34)	#EEB422
goldenrod3	goldenrod3	rgb(205, 155, 29)	#CD9B1D
goldenrod4	goldenrod4	rgb(139, 105, 20)	#8B6914
DarkGoldenrod	DarkGoldenrod	rgb(184, 134, 11)	#B8860B
DarkGoldenrod1	DarkGoldenrod1	rgb(255, 185, 15)	#FFB90F
DarkGoldenrod2	DarkGoldenrod2	rgb(238, 173, 14)	#EEAD0E
DarkGoldenrod3	DarkGoldenrod3	rgb(205, 149, 12)	#CD950C
DarkGoldenrod4	DarkGoldenrod4	rgb(139, 101, 8)	#8B6508
FloralWhite	FloralWhite	rgb(255, 250, 240)	#FFFAF0
wheat2	wheat2	rgb(238, 216, 174)	#EED8AE
OldLace	OldLace	rgb(253, 245, 230)	#FDF5E6
wheat	wheat	rgb(245, 222, 179)	#F5DEB3
wheat1	wheat1	rgb(255, 231, 186)	#FFE7BA
wheat3	wheat3	rgb(205, 186, 150)	#CDBA96
orange	orange	rgb(255, 165, 0)	#FFA500
orange1	orange1	rgb(255, 165, 0)	#FFA500
orange2	orange2	rgb(238, 154, 0)	#EE9A00
orange3	orange3	rgb(205, 133, 0)	#CD8500
orange4	orange4	rgb(139, 90, 0)	#8B5A00
wheat4	wheat4	rgb(139, 126, 102)	#8B7E66
moccasin	moccasin	rgb(255, 228, 181)	#FFE4B5
PapayaWhip	PapayaWhip	rgb(255, 239, 213)	#FFEFD5
NavajoWhite3	NavajoWhite3	rgb(205, 179, 139)	#CDB38B
BlanchedAlmond	BlanchedAlmond	rgb(255, 235, 205)	#FFEBCD
NavajoWhite	NavajoWhite	rgb(255, 222, 173)	#FFDEAD
NavajoWhite1	NavajoWhite1	rgb(255, 222, 173)	#FFDEAD
NavajoWhite2	NavajoWhite2	rgb(238, 207, 161)	#EECFA1
NavajoWhite4	NavajoWhite4	rgb(139, 121, 94)	#8B795E
AntiqueWhite4	AntiqueWhite4	rgb(139, 131, 120)	#8B8378
AntiqueWhite	AntiqueWhite	rgb(250, 235, 215)	#FAEBD7
tan	tan	rgb(210, 180, 140)	#D2B48C
bisque4	bisque4	rgb(139, 125, 107)	#8B7D6B
burlywood	burlywood	rgb(222, 184, 135)	#DEB887
AntiqueWhite2	AntiqueWhite2	rgb(238, 223, 204)	#EEDFCC
burlywood1	burlywood1	rgb(255, 211, 155)	#FFD39B
burlywood3	burlywood3	rgb(205, 170, 125)	#CDAA7D
burlywood2	burlywood2	rgb(238, 197, 145)	#EEC591
AntiqueWhite1	AntiqueWhite1	rgb(255, 239, 219)	#FFEFDB
burlywood4	burlywood4	rgb(139, 115, 85)	#8B7355
AntiqueWhite3	AntiqueWhite3	rgb(205, 192, 176)	#CDC0B0
DarkOrange	DarkOrange	rgb(255, 140, 0)	#FF8C00
bisque2	bisque2	rgb(238, 213, 183)	#EED5B7
bisque	bisque	rgb(255, 228, 196)	#FFE4C4
bisque1	bisque1	rgb(255, 228, 196)	#FFE4C4
bisque3	bisque3	rgb(205, 183, 158)	#CDB79E
DarkOrange1	DarkOrange1	rgb(255, 127, 0)	#FF7F00
linen	linen	rgb(250, 240, 230)	#FAF0E6
DarkOrange2	DarkOrange2	rgb(238, 118, 0)	#EE7600
DarkOrange3	DarkOrange3	rgb(205, 102, 0)	#CD6600
DarkOrange4	DarkOrange4	rgb(139, 69, 0)	#8B4500
peru	peru	rgb(205, 133, 63)	#CD853F
tan1	tan1	rgb(255, 165, 79)	#FFA54F
tan2	tan2	rgb(238, 154, 73)	#EE9A49
tan3	tan3	rgb(205, 133, 63)	#CD853F
tan4	tan4	rgb(139, 90, 43)	#8B5A2B
PeachPuff	PeachPuff	rgb(255, 218, 185)	#FFDAB9
PeachPuff1	PeachPuff1	rgb(255, 218, 185)	#FFDAB9
PeachPuff4	PeachPuff4	rgb(139, 119, 101)	#8B7765
PeachPuff2	PeachPuff2	rgb(238, 203, 173)	#EECBAD
PeachPuff3	PeachPuff3	rgb(205, 175, 149)	#CDAF95
SandyBrown	SandyBrown	rgb(244, 164, 96)	#F4A460
seashell4	seashell4	rgb(139, 134, 130)	#8B8682
seashell2	seashell2	rgb(238, 229, 222)	#EEE5DE
seashell3	seashell3	rgb(205, 197, 191)	#CDC5BF
chocolate	chocolate	rgb(210, 105, 30)	#D2691E
chocolate1	chocolate1	rgb(255, 127, 36)	#FF7F24
chocolate2	chocolate2	rgb(238, 118, 33)	#EE7621
chocolate3	chocolate3	rgb(205, 102, 29)	#CD661D
chocolate4	chocolate4	rgb(139, 69, 19)	#8B4513
SaddleBrown	SaddleBrown	rgb(139, 69, 19)	#8B4513
seashell	seashell	rgb(255, 245, 238)	#FFF5EE
seashell1	seashell1	rgb(255, 245, 238)	#FFF5EE
sienna4	sienna4	rgb(139, 71, 38)	#8B4726
sienna	sienna	rgb(160, 82, 45)	#A0522D
sienna1	sienna1	rgb(255, 130, 71)	#FF8247
sienna2	sienna2	rgb(238, 121, 66)	#EE7942
sienna3	sienna3	rgb(205, 104, 57)	#CD6839
LightSalmon3	LightSalmon3	rgb(205, 129, 98)	#CD8162
LightSalmon	LightSalmon	rgb(255, 160, 122)	#FFA07A
LightSalmon1	LightSalmon1	rgb(255, 160, 122)	#FFA07A
LightSalmon4	LightSalmon4	rgb(139, 87, 66)	#8B5742
LightSalmon2	LightSalmon2	rgb(238, 149, 114)	#EE9572
coral	coral	rgb(255, 127, 80)	#FF7F50
OrangeRed	OrangeRed	rgb(255, 69, 0)	#FF4500
OrangeRed1	OrangeRed1	rgb(255, 69, 0)	#FF4500
OrangeRed2	OrangeRed2	rgb(238, 64, 0)	#EE4000
OrangeRed3	OrangeRed3	rgb(205, 55, 0)	#CD3700
OrangeRed4	OrangeRed4	rgb(139, 37, 0)	#8B2500
DarkSalmon	DarkSalmon	rgb(233, 150, 122)	#E9967A
salmon1	salmon1	rgb(255, 140, 105)	#FF8C69
salmon2	salmon2	rgb(238, 130, 98)	#EE8262
salmon3	salmon3	rgb(205, 112, 84)	#CD7054
salmon4	salmon4	rgb(139, 76, 57)	#8B4C39
coral1	coral1	rgb(255, 114, 86)	#FF7256
coral2	coral2	rgb(238, 106, 80)	#EE6A50
coral3	coral3	rgb(205, 91, 69)	#CD5B45
coral4	coral4	rgb(139, 62, 47)	#8B3E2F
tomato4	tomato4	rgb(139, 54, 38)	#8B3626
tomato	tomato	rgb(255, 99, 71)	#FF6347
tomato1	tomato1	rgb(255, 99, 71)	#FF6347
tomato2	tomato2	rgb(238, 92, 66)	#EE5C42
tomato3	tomato3	rgb(205, 79, 57)	#CD4F39
MistyRose4	MistyRose4	rgb(139, 125, 123)	#8B7D7B
MistyRose2	MistyRose2	rgb(238, 213, 210)	#EED5D2
MistyRose	MistyRose	rgb(255, 228, 225)	#FFE4E1
MistyRose1	MistyRose1	rgb(255, 228, 225)	#FFE4E1
salmon	salmon	rgb(250, 128, 114)	#FA8072
MistyRose3	MistyRose3	rgb(205, 183, 181)	#CDB7B5
white	white	rgb(255, 255, 255)	#FFFFFF
gray100	gray100	rgb(255, 255, 255)	#FFFFFF
grey100	grey100	rgb(255, 255, 255)	#FFFFFF
grey100	grey100	rgb(255, 255, 255)	#FFFFFF
gray99	gray99	rgb(252, 252, 252)	#FCFCFC
grey99	grey99	rgb(252, 252, 252)	#FCFCFC
gray98	gray98	rgb(250, 250, 250)	#FAFAFA
grey98	grey98	rgb(250, 250, 250)	#FAFAFA
gray97	gray97	rgb(247, 247, 247)	#F7F7F7
grey97	grey97	rgb(247, 247, 247)	#F7F7F7
gray96	gray96	rgb(245, 245, 245)	#F5F5F5
grey96	grey96	rgb(245, 245, 245)	#F5F5F5
WhiteSmoke	WhiteSmoke	rgb(245, 245, 245)	#F5F5F5
gray95	gray95	rgb(242, 242, 242)	#F2F2F2
grey95	grey95	rgb(242, 242, 242)	#F2F2F2
gray94	gray94	rgb(240, 240, 240)	#F0F0F0
grey94	grey94	rgb(240, 240, 240)	#F0F0F0
gray93	gray93	rgb(237, 237, 237)	#EDEDED
grey93	grey93	rgb(237, 237, 237)	#EDEDED
gray92	gray92	rgb(235, 235, 235)	#EBEBEB
grey92	grey92	rgb(235, 235, 235)	#EBEBEB
gray91	gray91	rgb(232, 232, 232)	#E8E8E8
grey91	grey91	rgb(232, 232, 232)	#E8E8E8
gray90	gray90	rgb(229, 229, 229)	#E5E5E5
grey90	grey90	rgb(229, 229, 229)	#E5E5E5
gray89	gray89	rgb(227, 227, 227)	#E3E3E3
grey89	grey89	rgb(227, 227, 227)	#E3E3E3
gray88	gray88	rgb(224, 224, 224)	#E0E0E0
grey88	grey88	rgb(224, 224, 224)	#E0E0E0
gray87	gray87	rgb(222, 222, 222)	#DEDEDE
grey87	grey87	rgb(222, 222, 222)	#DEDEDE
gainsboro	gainsboro	rgb(220, 220, 220)	#DCDCDC
gray86	gray86	rgb(219, 219, 219)	#DBDBDB
grey86	grey86	rgb(219, 219, 219)	#DBDBDB
gray85	gray85	rgb(217, 217, 217)	#D9D9D9
grey85	grey85	rgb(217, 217, 217)	#D9D9D9
gray84	gray84	rgb(214, 214, 214)	#D6D6D6
grey84	grey84	rgb(214, 214, 214)	#D6D6D6
gray83	gray83	rgb(212, 212, 212)	#D4D4D4
grey83	grey83	rgb(212, 212, 212)	#D4D4D4
LightGray	LightGray	rgb(211, 211, 211)	#D3D3D3
LightGrey	LightGrey	rgb(211, 211, 211)	#D3D3D3
gray82	gray82	rgb(209, 209, 209)	#D1D1D1
grey82	grey82	rgb(209, 209, 209)	#D1D1D1
gray81	gray81	rgb(207, 207, 207)	#CFCFCF
grey81	grey81	rgb(207, 207, 207)	#CFCFCF
gray80	gray80	rgb(204, 204, 204)	#CCCCCC
grey80	grey80	rgb(204, 204, 204)	#CCCCCC
gray79	gray79	rgb(201, 201, 201)	#C9C9C9
grey79	grey79	rgb(201, 201, 201)	#C9C9C9
gray78	gray78	rgb(199, 199, 199)	#C7C7C7
grey78	grey78	rgb(199, 199, 199)	#C7C7C7
gray77	gray77	rgb(196, 196, 196)	#C4C4C4
grey77	grey77	rgb(196, 196, 196)	#C4C4C4
gray76	gray76	rgb(194, 194, 194)	#C2C2C2
grey76	grey76	rgb(194, 194, 194)	#C2C2C2
silver	silver	rgb(192, 192, 192)	#C0C0C0
gray75	gray75	rgb(191, 191, 191)	#BFBFBF
grey75	grey75	rgb(191, 191, 191)	#BFBFBF
gray74	gray74	rgb(189, 189, 189)	#BDBDBD
grey74	grey74	rgb(189, 189, 189)	#BDBDBD
gray73	gray73	rgb(186, 186, 186)	#BABABA
grey73	grey73	rgb(186, 186, 186)	#BABABA
gray72	gray72	rgb(184, 184, 184)	#B8B8B8
grey72	grey72	rgb(184, 184, 184)	#B8B8B8
gray71	gray71	rgb(181, 181, 181)	#B5B5B5
grey71	grey71	rgb(181, 181, 181)	#B5B5B5
gray70	gray70	rgb(179, 179, 179)	#B3B3B3
grey70	grey70	rgb(179, 179, 179)	#B3B3B3
gray69	gray69	rgb(176, 176, 176)	#B0B0B0
grey69	grey69	rgb(176, 176, 176)	#B0B0B0
gray68	gray68	rgb(173, 173, 173)	#ADADAD
grey68	grey68	rgb(173, 173, 173)	#ADADAD
gray67	gray67	rgb(171, 171, 171)	#ABABAB
grey67	grey67	rgb(171, 171, 171)	#ABABAB
DarkGray	DarkGray	rgb(169, 169, 169)	#A9A9A9
DarkGrey	DarkGrey	rgb(169, 169, 169)	#A9A9A9
gray66	gray66	rgb(168, 168, 168)	#A8A8A8
grey66	grey66	rgb(168, 168, 168)	#A8A8A8
gray65	gray65	rgb(166, 166, 166)	#A6A6A6
grey65	grey65	rgb(166, 166, 166)	#A6A6A6
gray64	gray64	rgb(163, 163, 163)	#A3A3A3
grey64	grey64	rgb(163, 163, 163)	#A3A3A3
gray63	gray63	rgb(161, 161, 161)	#A1A1A1
grey63	grey63	rgb(161, 161, 161)	#A1A1A1
gray62	gray62	rgb(158, 158, 158)	#9E9E9E
grey62	grey62	rgb(158, 158, 158)	#9E9E9E
gray61	gray61	rgb(156, 156, 156)	#9C9C9C
grey61	grey61	rgb(156, 156, 156)	#9C9C9C
gray60	gray60	rgb(153, 153, 153)	#999999
grey60	grey60	rgb(153, 153, 153)	#999999
gray59	gray59	rgb(150, 150, 150)	#969696
grey59	grey59	rgb(150, 150, 150)	#969696
gray58	gray58	rgb(148, 148, 148)	#949494
grey58	grey58	rgb(148, 148, 148)	#949494
gray57	gray57	rgb(145, 145, 145)	#919191
grey57	grey57	rgb(145, 145, 145)	#919191
gray56	gray56	rgb(143, 143, 143)	#8F8F8F
grey56	grey56	rgb(143, 143, 143)	#8F8F8F
gray55	gray55	rgb(140, 140, 140)	#8C8C8C
grey55	grey55	rgb(140, 140, 140)	#8C8C8C
gray54	gray54	rgb(138, 138, 138)	#8A8A8A
grey54	grey54	rgb(138, 138, 138)	#8A8A8A
gray53	gray53	rgb(135, 135, 135)	#878787
grey53	grey53	rgb(135, 135, 135)	#878787
gray52	gray52	rgb(133, 133, 133)	#858585
grey52	grey52	rgb(133, 133, 133)	#858585
gray51	gray51	rgb(130, 130, 130)	#828282
grey51	grey51	rgb(130, 130, 130)	#828282
fractal	fractal	rgb(128, 128, 128)	#808080
gray50	gray50	rgb(127, 127, 127)	#7F7F7F
grey50	grey50	rgb(127, 127, 127)	#7F7F7F
gray	gray	rgb(126, 126, 126)	#7E7E7E
gray49	gray49	rgb(125, 125, 125)	#7D7D7D
grey49	grey49	rgb(125, 125, 125)	#7D7D7D
gray48	gray48	rgb(122, 122, 122)	#7A7A7A
grey48	grey48	rgb(122, 122, 122)	#7A7A7A
gray47	gray47	rgb(120, 120, 120)	#787878
grey47	grey47	rgb(120, 120, 120)	#787878
gray46	gray46	rgb(117, 117, 117)	#757575
grey46	grey46	rgb(117, 117, 117)	#757575
gray45	gray45	rgb(115, 115, 115)	#737373
grey45	grey45	rgb(115, 115, 115)	#737373
gray44	gray44	rgb(112, 112, 112)	#707070
grey44	grey44	rgb(112, 112, 112)	#707070
gray43	gray43	rgb(110, 110, 110)	#6E6E6E
grey43	grey43	rgb(110, 110, 110)	#6E6E6E
gray42	gray42	rgb(107, 107, 107)	#6B6B6B
grey42	grey42	rgb(107, 107, 107)	#6B6B6B
DimGray	DimGray	rgb(105, 105, 105)	#696969
DimGrey	DimGrey	rgb(105, 105, 105)	#696969
gray41	gray41	rgb(105, 105, 105)	#696969
grey41	grey41	rgb(105, 105, 105)	#696969
gray40	gray40	rgb(102, 102, 102)	#666666
grey40	grey40	rgb(102, 102, 102)	#666666
gray39	gray39	rgb( 99, 99, 99)	#636363
grey39	grey39	rgb( 99, 99, 99)	#636363
gray38	gray38	rgb( 97, 97, 97)	#616161
grey38	grey38	rgb( 97, 97, 97)	#616161
gray37	gray37	rgb( 94, 94, 94)	#5E5E5E
grey37	grey37	rgb( 94, 94, 94)	#5E5E5E
gray36	gray36	rgb( 92, 92, 92)	#5C5C5C
grey36	grey36	rgb( 92, 92, 92)	#5C5C5C
gray35	gray35	rgb( 89, 89, 89)	#595959
grey35	grey35	rgb( 89, 89, 89)	#595959
gray34	gray34	rgb( 87, 87, 87)	#575757
grey34	grey34	rgb( 87, 87, 87)	#575757
gray33	gray33	rgb( 84, 84, 84)	#545454
grey33	grey33	rgb( 84, 84, 84)	#545454
gray32	gray32	rgb( 82, 82, 82)	#525252
grey32	grey32	rgb( 82, 82, 82)	#525252
gray31	gray31	rgb( 79, 79, 79)	#4F4F4F
grey31	grey31	rgb( 79, 79, 79)	#4F4F4F
gray30	gray30	rgb( 77, 77, 77)	#4D4D4D
grey30	grey30	rgb( 77, 77, 77)	#4D4D4D
gray29	gray29	rgb( 74, 74, 74)	#4A4A4A
grey29	grey29	rgb( 74, 74, 74)	#4A4A4A
gray28	gray28	rgb( 71, 71, 71)	#474747
grey28	grey28	rgb( 71, 71, 71)	#474747
gray27	gray27	rgb( 69, 69, 69)	#454545
grey27	grey27	rgb( 69, 69, 69)	#454545
gray26	gray26	rgb( 66, 66, 66)	#424242
grey26	grey26	rgb( 66, 66, 66)	#424242
gray25	gray25	rgb( 64, 64, 64)	#404040
grey25	grey25	rgb( 64, 64, 64)	#404040
gray24	gray24	rgb( 61, 61, 61)	#3D3D3D
grey24	grey24	rgb( 61, 61, 61)	#3D3D3D
gray23	gray23	rgb( 59, 59, 59)	#3B3B3B
grey23	grey23	rgb( 59, 59, 59)	#3B3B3B
gray22	gray22	rgb( 56, 56, 56)	#383838
grey22	grey22	rgb( 56, 56, 56)	#383838
gray21	gray21	rgb( 54, 54, 54)	#363636
grey21	grey21	rgb( 54, 54, 54)	#363636
gray20	gray20	rgb( 51, 51, 51)	#333333
grey20	grey20	rgb( 51, 51, 51)	#333333
gray19	gray19	rgb( 48, 48, 48)	#303030
grey19	grey19	rgb( 48, 48, 48)	#303030
gray18	gray18	rgb( 46, 46, 46)	#2E2E2E
grey18	grey18	rgb( 46, 46, 46)	#2E2E2E
gray17	gray17	rgb( 43, 43, 43)	#2B2B2B
grey17	grey17	rgb( 43, 43, 43)	#2B2B2B
gray16	gray16	rgb( 41, 41, 41)	#292929
grey16	grey16	rgb( 41, 41, 41)	#292929
gray15	gray15	rgb( 38, 38, 38)	#262626
grey15	grey15	rgb( 38, 38, 38)	#262626
gray14	gray14	rgb( 36, 36, 36)	#242424
grey14	grey14	rgb( 36, 36, 36)	#242424
gray13	gray13	rgb( 33, 33, 33)	#212121
grey13	grey13	rgb( 33, 33, 33)	#212121
gray12	gray12	rgb( 31, 31, 31)	#1F1F1F
grey12	grey12	rgb( 31, 31, 31)	#1F1F1F
gray11	gray11	rgb( 28, 28, 28)	#1C1C1C
grey11	grey11	rgb( 28, 28, 28)	#1C1C1C
gray10	gray10	rgb( 26, 26, 26)	#1A1A1A
grey10	grey10	rgb( 26, 26, 26)	#1A1A1A
gray9	gray9	rgb( 23, 23, 23)	#171717
grey9	grey9	rgb( 23, 23, 23)	#171717
gray8	gray8	rgb( 20, 20, 20)	#141414
grey8	grey8	rgb( 20, 20, 20)	#141414
gray7	gray7	rgb( 18, 18, 18)	#121212
grey7	grey7	rgb( 18, 18, 18)	#121212
gray6	gray6	rgb( 15, 15, 15)	#0F0F0F
grey6	grey6	rgb( 15, 15, 15)	#0F0F0F
gray5	gray5	rgb( 13, 13, 13)	#0D0D0D
grey5	grey5	rgb( 13, 13, 13)	#0D0D0D
gray4	gray4	rgb( 10, 10, 10)	#0A0A0A
grey4	grey4	rgb( 10, 10, 10)	#0A0A0A
gray3	gray3	rgb( 8, 8, 8)	#080808
grey3	grey3	rgb( 8, 8, 8)	#080808
gray2	gray2	rgb( 5, 5, 5)	#050505
grey2	grey2	rgb( 5, 5, 5)	#050505
gray1	gray1	rgb( 3, 3, 3)	#030303
grey1	grey1	rgb( 3, 3, 3)	#030303
black	black	rgb( 0, 0, 0)	#000000
gray0	gray0	rgb( 0, 0, 0)	#000000
grey0	grey0	rgb( 0, 0, 0)	#000000
opaque	opaque	rgb( 0, 0, 0)	#000000
none	none	rgba( 0, 0, 0, 0.0)	#00000000
transparent	transparent	rgba( 0, 0, 0, 0.0)	#00000000
    */
    enum Color {

        var name: String {
            return ""
        }

        var rgb: MagickWand.RGB {
            return MagickWand.RGB(0, 0, 0)
        }

        var hex: String {
            return ""
        }
    }
}
