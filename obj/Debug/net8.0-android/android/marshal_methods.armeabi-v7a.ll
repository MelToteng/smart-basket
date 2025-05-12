; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [356 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [712 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 20206211, ; 3: Xamarin.Google.MLKit.Vision.Interfaces.dll => 0x1345283 => 301
	i32 30793855, ; 4: Xamarin.Google.Android.ODML.Image.dll => 0x1d5e07f => 289
	i32 32687329, ; 5: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 247
	i32 34715100, ; 6: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 294
	i32 34839235, ; 7: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39109920, ; 8: Newtonsoft.Json.dll => 0x254c520 => 192
	i32 39485524, ; 9: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 40744412, ; 10: Xamarin.AndroidX.Camera.Lifecycle.dll => 0x26db5dc => 215
	i32 42639949, ; 11: System.Threading.Thread => 0x28aa24d => 145
	i32 45981941, ; 12: Xamarin.KotlinX.AtomicFU.Jvm => 0x2bda0f5 => 314
	i32 66541672, ; 13: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 14: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 351
	i32 68219467, ; 15: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 16: Microsoft.Maui.Graphics.dll => 0x44bb714 => 190
	i32 82292897, ; 17: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 18: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 268
	i32 103834273, ; 19: Xamarin.Firebase.Annotations.dll => 0x63062a1 => 280
	i32 117431740, ; 20: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 21: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 268
	i32 122350210, ; 22: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 23: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 311
	i32 142721839, ; 24: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 25: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 26: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 27: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 219
	i32 166070894, ; 28: Xamarin.KotlinX.AtomicFU.dll => 0x9e60a6e => 313
	i32 176265551, ; 29: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 30: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 270
	i32 184328833, ; 31: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 32: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 348
	i32 199333315, ; 33: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 349
	i32 205061960, ; 34: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 35: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 212
	i32 220171995, ; 36: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 37: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 240
	i32 230752869, ; 38: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 39: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 40: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 41: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 42: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 223
	i32 276479776, ; 43: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 44: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 243
	i32 280482487, ; 45: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 239
	i32 280992041, ; 46: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 320
	i32 291076382, ; 47: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 48: System.Net.Ping.dll => 0x11d123fd => 69
	i32 303981731, ; 49: Plugin.Maui.OCR.dll => 0x121e64a3 => 193
	i32 317674968, ; 50: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 348
	i32 318968648, ; 51: Xamarin.AndroidX.Activity.dll => 0x13031348 => 203
	i32 321597661, ; 52: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 53: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 333
	i32 342366114, ; 54: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 241
	i32 347068432, ; 55: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 197
	i32 356389973, ; 56: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 332
	i32 360082299, ; 57: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 58: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 59: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 60: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 61: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 62: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 63: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 64: _Microsoft.Android.Resource.Designer => 0x17969339 => 355
	i32 403441872, ; 65: WindowsBase => 0x180c08d0 => 165
	i32 425531652, ; 66: Xamarin.AndroidX.Lifecycle.Runtime.Android => 0x195d1904 => 248
	i32 435591531, ; 67: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 344
	i32 441335492, ; 68: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 224
	i32 442565967, ; 69: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 70: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 237
	i32 451504562, ; 71: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 72: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 73: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 74: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 75: System.dll => 0x1bff388e => 164
	i32 476646585, ; 76: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 239
	i32 485140951, ; 77: Xamarin.Google.Android.DataTransport.TransportRuntime => 0x1ceaa9d7 => 287
	i32 486930444, ; 78: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 256
	i32 495452658, ; 79: Xamarin.Google.Android.DataTransport.TransportRuntime.dll => 0x1d8801f2 => 287
	i32 498788369, ; 80: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 81: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 331
	i32 503918385, ; 82: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 325
	i32 507148113, ; 83: Xamarin.Google.Android.DataTransport.TransportApi.dll => 0x1e3a7751 => 285
	i32 507636436, ; 84: Xamarin.Google.MLKit.TextRecognition.Bundled.Common.dll => 0x1e41ead4 => 299
	i32 513247710, ; 85: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 184
	i32 513617146, ; 86: Xamarin.Google.MLKit.Vision.Common => 0x1e9d2cfa => 300
	i32 526420162, ; 87: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 88: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 311
	i32 530272170, ; 89: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 90: Microsoft.Extensions.Logging => 0x20216150 => 180
	i32 540030774, ; 91: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 92: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 93: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 94: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 95: Jsr305Binding => 0x213954e7 => 291
	i32 569601784, ; 96: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 279
	i32 577335427, ; 97: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 98: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 339
	i32 601371474, ; 99: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 100: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 101: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 621990341, ; 102: Xamarin.AndroidX.Lifecycle.Runtime.Android.dll => 0x2512d1c5 => 248
	i32 627609679, ; 103: Xamarin.AndroidX.CustomView => 0x2568904f => 229
	i32 627931235, ; 104: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 337
	i32 639843206, ; 105: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 235
	i32 643868501, ; 106: System.Net => 0x2660a755 => 81
	i32 662205335, ; 107: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 108: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 275
	i32 666292255, ; 109: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 210
	i32 672442732, ; 110: System.Collections.Concurrent => 0x2814a96c => 8
	i32 679221896, ; 111: Xamarin.KotlinX.AtomicFU => 0x287c1a88 => 313
	i32 683518922, ; 112: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 113: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 319
	i32 690569205, ; 114: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 115: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 315
	i32 693804605, ; 116: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 117: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 118: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 309
	i32 700358131, ; 119: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 120: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 334
	i32 709557578, ; 121: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 322
	i32 720511267, ; 122: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 312
	i32 722857257, ; 123: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 124: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 748832960, ; 125: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 195
	i32 752232764, ; 126: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 127: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 200
	i32 759454413, ; 128: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 129: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 130: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 131: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 343
	i32 782533833, ; 132: Xamarin.Google.AutoValue.Annotations.dll => 0x2ea484c9 => 290
	i32 789151979, ; 133: Microsoft.Extensions.Options => 0x2f0980eb => 183
	i32 790371945, ; 134: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 230
	i32 804715423, ; 135: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 136: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 245
	i32 823281589, ; 137: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 138: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 139: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 140: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 141: Xamarin.AndroidX.Print => 0x3246f6cd => 261
	i32 873119928, ; 142: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 143: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 144: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 145: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 146: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 147: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 346
	i32 928116545, ; 148: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 294
	i32 952186615, ; 149: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 150: Newtonsoft.Json => 0x38f24a24 => 192
	i32 956575887, ; 151: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 312
	i32 966729478, ; 152: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 292
	i32 967690846, ; 153: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 241
	i32 975236339, ; 154: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 155: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 156: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 157: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 158: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 159: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 996733531, ; 160: Xamarin.Google.Android.DataTransport.TransportBackendCct => 0x3b68f25b => 286
	i32 1001831731, ; 161: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 162: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 265
	i32 1019214401, ; 163: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 164: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 179
	i32 1029334545, ; 165: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 321
	i32 1031528504, ; 166: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 293
	i32 1035644815, ; 167: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 208
	i32 1036536393, ; 168: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 169: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 170: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 251
	i32 1061503568, ; 171: Xamarin.Google.AutoValue.Annotations => 0x3f454250 => 290
	i32 1067306892, ; 172: GoogleGson => 0x3f9dcf8c => 175
	i32 1082857460, ; 173: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 174: Xamarin.Kotlin.StdLib => 0x409e66d8 => 310
	i32 1098259244, ; 175: System => 0x41761b2c => 164
	i32 1118262833, ; 176: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 334
	i32 1121599056, ; 177: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 249
	i32 1122050967, ; 178: Xamarin.Google.Android.ODML.Image => 0x42e12397 => 289
	i32 1127624469, ; 179: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 182
	i32 1149092582, ; 180: Xamarin.AndroidX.Window => 0x447dc2e6 => 278
	i32 1168523401, ; 181: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 340
	i32 1170634674, ; 182: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 183: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 274
	i32 1178241025, ; 184: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 259
	i32 1203215381, ; 185: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 338
	i32 1203469131, ; 186: Xamarin.Google.MLKit.Common.dll => 0x47bb7b4b => 297
	i32 1204270330, ; 187: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 210
	i32 1208641965, ; 188: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1217708260, ; 189: Plugin.Maui.OCR => 0x4894c0e4 => 193
	i32 1219128291, ; 190: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 191: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 336
	i32 1243150071, ; 192: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 279
	i32 1246548578, ; 193: Xamarin.AndroidX.Collection.Jvm.dll => 0x4a4cd262 => 220
	i32 1253011324, ; 194: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 195: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 320
	i32 1264511973, ; 196: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 269
	i32 1264890200, ; 197: Xamarin.KotlinX.Coroutines.Core.dll => 0x4b64b158 => 316
	i32 1267360935, ; 198: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 273
	i32 1273260888, ; 199: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 221
	i32 1275534314, ; 200: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 315
	i32 1278448581, ; 201: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 207
	i32 1292207520, ; 202: SQLitePCLRaw.core.dll => 0x4d0585a0 => 196
	i32 1293217323, ; 203: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 232
	i32 1309188875, ; 204: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 205: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 278
	i32 1324164729, ; 206: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 207: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1351347447, ; 208: Xamarin.GooglePlayServices.MLKit.BarcodeScanning => 0x508becf7 => 304
	i32 1355368438, ; 209: Xamarin.Google.MLKit.BarcodeScanning.Common.dll => 0x50c947f6 => 296
	i32 1358509622, ; 210: Xamarin.Google.MLKit.BarcodeScanning => 0x50f93636 => 295
	i32 1364015309, ; 211: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 212: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 350
	i32 1376866003, ; 213: Xamarin.AndroidX.SavedState => 0x52114ed3 => 265
	i32 1379779777, ; 214: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1379897097, ; 215: Xamarin.JavaX.Inject => 0x523f8f09 => 308
	i32 1391575254, ; 216: scanner.dll => 0x52f1c0d6 => 0
	i32 1402170036, ; 217: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 218: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 225
	i32 1408764838, ; 219: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 220: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 221: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 222: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 318
	i32 1434145427, ; 223: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 224: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 292
	i32 1437299793, ; 225: Xamarin.AndroidX.Lifecycle.Common.Jvm => 0x55ab7451 => 242
	i32 1439761251, ; 226: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1441095154, ; 227: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 0x55e55df2 => 252
	i32 1452070440, ; 228: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 229: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 230: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 231: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 232: es\Microsoft.Maui.Controls.resources => 0x57152abe => 324
	i32 1461234159, ; 233: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 234: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462063465, ; 235: Xamarin.GooglePlayServices.MLKit.Text.Recognition.Common.dll => 0x57255169 => 306
	i32 1462112819, ; 236: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 237: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 209
	i32 1470490898, ; 238: Microsoft.Extensions.Primitives => 0x57a5e912 => 184
	i32 1479771757, ; 239: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 240: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 241: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 242: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 266
	i32 1493001747, ; 243: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 328
	i32 1514721132, ; 244: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 323
	i32 1536373174, ; 245: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 246: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 247: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 248: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 249: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 343
	i32 1565862583, ; 250: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 251: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 252: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 253: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 254: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 231
	i32 1592978981, ; 255: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 256: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 293
	i32 1601112923, ; 257: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1603525486, ; 258: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x5f93db6e => 352
	i32 1604827217, ; 259: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 260: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 261: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 255
	i32 1622358360, ; 262: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 263: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 277
	i32 1635184631, ; 264: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 235
	i32 1636350590, ; 265: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 228
	i32 1639515021, ; 266: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 267: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 268: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 269: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 270: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 271
	i32 1658251792, ; 271: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 288
	i32 1667453763, ; 272: Mopups.dll => 0x63635343 => 191
	i32 1670060433, ; 273: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 223
	i32 1675553242, ; 274: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 275: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 276: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 277: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 278: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 279: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1701541528, ; 280: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1711441057, ; 281: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 197
	i32 1718006957, ; 282: Xamarin.GooglePlayServices.MLKit.BarcodeScanning.dll => 0x6666b4ad => 304
	i32 1720223769, ; 283: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 245
	i32 1726116996, ; 284: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 285: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 286: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 218
	i32 1736233607, ; 287: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 341
	i32 1743415430, ; 288: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 319
	i32 1744735666, ; 289: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 290: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 291: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 292: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 293: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 294: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 295: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 270
	i32 1770582343, ; 296: Microsoft.Extensions.Logging.dll => 0x6988f147 => 180
	i32 1776026572, ; 297: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 298: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 299: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 300: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 335
	i32 1788241197, ; 301: Xamarin.AndroidX.Fragment => 0x6a96652d => 237
	i32 1793755602, ; 302: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 327
	i32 1808609942, ; 303: Xamarin.AndroidX.Loader => 0x6bcd3296 => 255
	i32 1813058853, ; 304: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 310
	i32 1813201214, ; 305: Xamarin.Google.Android.Material => 0x6c13413e => 288
	i32 1818569960, ; 306: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 260
	i32 1818787751, ; 307: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 308: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 309: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1827303595, ; 310: Microsoft.VisualStudio.DesignTools.TapContract => 0x6cea70ab => 354
	i32 1828688058, ; 311: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 181
	i32 1842015223, ; 312: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 347
	i32 1847515442, ; 313: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 200
	i32 1853025655, ; 314: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 344
	i32 1858542181, ; 315: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1866818530, ; 316: Xamarin.AndroidX.Camera.Video => 0x6f4563e2 => 216
	i32 1870277092, ; 317: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 318: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 326
	i32 1876173635, ; 319: Xamarin.Firebase.Encoders.Proto => 0x6fd42343 => 284
	i32 1879696579, ; 320: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 321: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 211
	i32 1885918049, ; 322: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0x7068d361 => 354
	i32 1888955245, ; 323: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 324: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 325: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 326: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1908813208, ; 327: Xamarin.GooglePlayServices.Basement => 0x71c62d98 => 303
	i32 1910275211, ; 328: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 329: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 330: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 331: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 267
	i32 1968388702, ; 332: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 176
	i32 1968499395, ; 333: AsyncAwaitBestPractices => 0x7554eac3 => 173
	i32 1985761444, ; 334: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 202
	i32 2003115576, ; 335: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 323
	i32 2011961780, ; 336: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 337: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 251
	i32 2025202353, ; 338: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 318
	i32 2031763787, ; 339: Xamarin.Android.Glide => 0x791a414b => 199
	i32 2045470958, ; 340: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 341: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 244
	i32 2060060697, ; 342: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 343: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 322
	i32 2070888862, ; 344: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 345: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 346: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2100944304, ; 347: BarcodeScanning.Native.Maui.dll => 0x7d39ddb0 => 174
	i32 2103459038, ; 348: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 198
	i32 2124230737, ; 349: Xamarin.Google.Android.DataTransport.TransportBackendCct.dll => 0x7e9d3051 => 286
	i32 2127167465, ; 350: System.Console => 0x7ec9ffe9 => 20
	i32 2129483829, ; 351: Xamarin.GooglePlayServices.Base.dll => 0x7eed5835 => 302
	i32 2142473426, ; 352: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 353: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 354: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 355: Microsoft.Maui => 0x80bd55ad => 188
	i32 2169148018, ; 356: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 330
	i32 2174878672, ; 357: Xamarin.Firebase.Annotations => 0x81a203d0 => 280
	i32 2181898931, ; 358: Microsoft.Extensions.Options.dll => 0x820d22b3 => 183
	i32 2188559649, ; 359: Xamarin.Google.MLKit.BarcodeScanning.dll => 0x8272c521 => 295
	i32 2192057212, ; 360: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 181
	i32 2193016926, ; 361: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 362: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 317
	i32 2201231467, ; 363: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 364: it\Microsoft.Maui.Controls.resources => 0x839595db => 332
	i32 2217644978, ; 365: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 274
	i32 2222056684, ; 366: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 367: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 256
	i32 2252106437, ; 368: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 369: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 370: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 371: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 177
	i32 2267999099, ; 372: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 201
	i32 2270573516, ; 373: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 326
	i32 2272732261, ; 374: scanner => 0x87772465 => 0
	i32 2279755925, ; 375: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 263
	i32 2293034957, ; 376: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 377: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 378: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 379: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 336
	i32 2305521784, ; 380: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 381: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 205
	i32 2320631194, ; 382: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 383: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 384: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 385: System.Net.Primitives => 0x8c40e0db => 70
	i32 2365655487, ; 386: Xamarin.GooglePlayServices.MLKit.Text.Recognition.Common => 0x8d0109bf => 306
	i32 2368005991, ; 387: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 388: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 176
	i32 2378619854, ; 389: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 390: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 391: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 331
	i32 2401565422, ; 392: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 393: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 234
	i32 2409983638, ; 394: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x8fa56e96 => 353
	i32 2418341376, ; 395: Xamarin.AndroidX.Camera.Video.dll => 0x9024f600 => 216
	i32 2421380589, ; 396: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 397: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 221
	i32 2425270691, ; 398: Xamarin.Google.MLKit.BarcodeScanning.Common => 0x908eb1a3 => 296
	i32 2427813419, ; 399: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 328
	i32 2435356389, ; 400: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 401: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 402: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2457221118, ; 403: Xamarin.GooglePlayServices.MLKit.Text.Recognition.dll => 0x927637fe => 305
	i32 2458678730, ; 404: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 405: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465273461, ; 406: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 195
	i32 2465532216, ; 407: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 224
	i32 2471841756, ; 408: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 409: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 410: Microsoft.Maui.Controls => 0x93dba8a1 => 186
	i32 2483903535, ; 411: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 412: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 413: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 414: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 415: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 247
	i32 2522472828, ; 416: Xamarin.Android.Glide.dll => 0x9659e17c => 199
	i32 2538310050, ; 417: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 418: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 329
	i32 2562349572, ; 419: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2565628955, ; 420: Xamarin.GooglePlayServices.MLKit.Text.Recognition => 0x98ec641b => 305
	i32 2570120770, ; 421: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2577256205, ; 422: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android => 0x999dcf0d => 250
	i32 2581783588, ; 423: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 249
	i32 2581819634, ; 424: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 273
	i32 2585220780, ; 425: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 426: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 427: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 428: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 338
	i32 2605712449, ; 429: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 317
	i32 2615233544, ; 430: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 238
	i32 2616218305, ; 431: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 182
	i32 2617129537, ; 432: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 433: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620111890, ; 434: Xamarin.Firebase.Encoders.dll => 0x9c2bbc12 => 282
	i32 2620871830, ; 435: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 228
	i32 2624644809, ; 436: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 233
	i32 2626831493, ; 437: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 333
	i32 2627185994, ; 438: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 439: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 440: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 243
	i32 2639764100, ; 441: Xamarin.Firebase.Encoders => 0x9d579a84 => 282
	i32 2663391936, ; 442: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 201
	i32 2663698177, ; 443: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 444: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 445: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2671474046, ; 446: Xamarin.KotlinX.Coroutines.Core => 0x9f3b757e => 316
	i32 2676780864, ; 447: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 448: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 449: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 450: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 271
	i32 2715334215, ; 451: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 452: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 453: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 454: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 455: Xamarin.AndroidX.Activity => 0xa2e0939b => 203
	i32 2735172069, ; 456: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 457: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 209
	i32 2740948882, ; 458: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 459: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 460: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 339
	i32 2758225723, ; 461: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 187
	i32 2764765095, ; 462: Microsoft.Maui.dll => 0xa4caf7a7 => 188
	i32 2765824710, ; 463: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2766642685, ; 464: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 0xa4e79dfd => 252
	i32 2770495804, ; 465: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 309
	i32 2778768386, ; 466: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 276
	i32 2779977773, ; 467: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 264
	i32 2780199943, ; 468: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 0xa5b67c07 => 242
	i32 2785988530, ; 469: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 345
	i32 2788224221, ; 470: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 238
	i32 2801831435, ; 471: Microsoft.Maui.Graphics => 0xa7008e0b => 190
	i32 2803228030, ; 472: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2804607052, ; 473: Xamarin.Firebase.Components.dll => 0xa72ae84c => 281
	i32 2806116107, ; 474: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 324
	i32 2810250172, ; 475: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 225
	i32 2819470561, ; 476: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 477: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 478: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 264
	i32 2824502124, ; 479: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 480: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 337
	i32 2838993487, ; 481: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 253
	i32 2847418871, ; 482: Xamarin.GooglePlayServices.Base => 0xa9b829f7 => 302
	i32 2849599387, ; 483: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 484: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 276
	i32 2855708567, ; 485: Xamarin.AndroidX.Transition => 0xaa36a797 => 272
	i32 2861098320, ; 486: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 487: Microsoft.Maui.Essentials => 0xaa8a4878 => 189
	i32 2868099152, ; 488: Xamarin.Google.MLKit.Vision.Common.dll => 0xaaf3b850 => 300
	i32 2870099610, ; 489: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 204
	i32 2875164099, ; 490: Jsr305Binding.dll => 0xab5f85c3 => 291
	i32 2875220617, ; 491: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 492: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 236
	i32 2887636118, ; 493: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 494: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 495: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 496: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 497: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 498: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 499: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 277
	i32 2919462931, ; 500: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 501: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 206
	i32 2936416060, ; 502: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 503: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 504: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 505: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2965157864, ; 506: Xamarin.AndroidX.Camera.View => 0xb0bcb7e8 => 217
	i32 2968338931, ; 507: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 508: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 509: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 232
	i32 2987532451, ; 510: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 267
	i32 2991449226, ; 511: Xamarin.AndroidX.Camera.Core => 0xb24de48a => 214
	i32 2996846495, ; 512: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 246
	i32 3000842441, ; 513: Xamarin.AndroidX.Camera.View.dll => 0xb2dd38c9 => 217
	i32 3016983068, ; 514: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 269
	i32 3023353419, ; 515: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 516: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 240
	i32 3038032645, ; 517: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 355
	i32 3047751430, ; 518: Xamarin.AndroidX.Camera.Core.dll => 0xb5a8ff06 => 214
	i32 3056245963, ; 519: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 266
	i32 3057625584, ; 520: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 257
	i32 3058099980, ; 521: Xamarin.GooglePlayServices.Tasks => 0xb646e70c => 307
	i32 3059408633, ; 522: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 523: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 524: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 525: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 330
	i32 3090735792, ; 526: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 527: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 528: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 529: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 530: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 531: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 532: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 533: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 534: GoogleGson.dll => 0xbba64c02 => 175
	i32 3155362983, ; 535: Xamarin.Google.Android.DataTransport.TransportApi => 0xbc1304a7 => 285
	i32 3159123045, ; 536: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 537: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 538: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 258
	i32 3192346100, ; 539: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 540: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 541: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 542: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 543: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 231
	i32 3220365878, ; 544: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 545: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3230466174, ; 546: Xamarin.GooglePlayServices.Basement.dll => 0xc08d007e => 303
	i32 3251039220, ; 547: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 548: Xamarin.AndroidX.CardView => 0xc235e84d => 218
	i32 3265493905, ; 549: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 550: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 551: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 552: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 553: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3286872994, ; 554: SQLite-net.dll => 0xc3e9b3a2 => 194
	i32 3290767353, ; 555: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 556: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 557: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 558: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 325
	i32 3316684772, ; 559: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 560: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 229
	i32 3317144872, ; 561: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 562: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 211
	i32 3345895724, ; 563: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 262
	i32 3346324047, ; 564: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 259
	i32 3357674450, ; 565: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 342
	i32 3358260929, ; 566: System.Text.Json => 0xc82afec1 => 137
	i32 3360279109, ; 567: SQLitePCLRaw.core => 0xc849ca45 => 196
	i32 3362336904, ; 568: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 204
	i32 3362522851, ; 569: Xamarin.AndroidX.Core => 0xc86c06e3 => 226
	i32 3366347497, ; 570: Java.Interop => 0xc8a662e9 => 168
	i32 3371992681, ; 571: Xamarin.Firebase.Encoders.Proto.dll => 0xc8fc8669 => 284
	i32 3374999561, ; 572: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 263
	i32 3381016424, ; 573: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 321
	i32 3383578424, ; 574: Xamarin.Firebase.Encoders.JSON => 0xc9ad4f38 => 283
	i32 3395150330, ; 575: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 576: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 577: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 230
	i32 3411362516, ; 578: Xamarin.Google.MLKit.Vision.Interfaces => 0xcb5542d4 => 301
	i32 3413944578, ; 579: Xamarin.AndroidX.Camera.Camera2.dll => 0xcb7ca902 => 213
	i32 3421910702, ; 580: Xamarin.AndroidX.Camera.Camera2 => 0xcbf636ae => 213
	i32 3428513518, ; 581: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 178
	i32 3429136800, ; 582: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 583: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 584: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 233
	i32 3445260447, ; 585: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 586: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 185
	i32 3463511458, ; 587: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 329
	i32 3471940407, ; 588: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 589: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 590: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 342
	i32 3484440000, ; 591: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 341
	i32 3485117614, ; 592: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 593: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 594: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 222
	i32 3509114376, ; 595: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 596: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 597: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 598: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 599: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 600: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 601: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 349
	i32 3597029428, ; 602: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 202
	i32 3598340787, ; 603: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 604: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 605: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3626429363, ; 606: Xamarin.Google.MLKit.Common => 0xd826ebb3 => 297
	i32 3627220390, ; 607: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 261
	i32 3633644679, ; 608: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 206
	i32 3638274909, ; 609: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 610: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 244
	i32 3643446276, ; 611: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 346
	i32 3643854240, ; 612: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 258
	i32 3645089577, ; 613: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 614: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 177
	i32 3660523487, ; 615: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 616: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3676461095, ; 617: Xamarin.AndroidX.Camera.Lifecycle => 0xdb225827 => 215
	i32 3676670898, ; 618: Microsoft.Maui.Controls.HotReload.Forms => 0xdb258bb2 => 352
	i32 3682565725, ; 619: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 212
	i32 3684561358, ; 620: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 222
	i32 3697841164, ; 621: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 351
	i32 3700866549, ; 622: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 623: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 227
	i32 3716563718, ; 624: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 625: Xamarin.AndroidX.Annotation => 0xdda814c6 => 205
	i32 3724971120, ; 626: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 257
	i32 3732100267, ; 627: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 628: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 629: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 630: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3754567612, ; 631: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 198
	i32 3758390674, ; 632: Xamarin.Google.MLKit.TextRecognition => 0xe0047d92 => 298
	i32 3764085317, ; 633: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll => 0xe05b6245 => 250
	i32 3786282454, ; 634: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 219
	i32 3792276235, ; 635: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3793321889, ; 636: AsyncAwaitBestPractices.dll => 0xe2197fa1 => 173
	i32 3800979733, ; 637: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 185
	i32 3802395368, ; 638: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 639: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 640: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 641: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 642: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 179
	i32 3843715963, ; 643: Xamarin.Google.MLKit.TextRecognition.dll => 0xe51a737b => 298
	i32 3844307129, ; 644: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 645: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 646: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 647: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 648: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3876362041, ; 649: SQLite-net => 0xe70c9739 => 194
	i32 3885497537, ; 650: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 651: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 272
	i32 3888767677, ; 652: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 262
	i32 3889960447, ; 653: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 350
	i32 3896106733, ; 654: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 655: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 226
	i32 3901907137, ; 656: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3910130544, ; 657: Xamarin.AndroidX.Collection.Jvm => 0xe90fdb70 => 220
	i32 3920810846, ; 658: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 659: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 275
	i32 3928044579, ; 660: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 661: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 662: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 260
	i32 3934056515, ; 663: Xamarin.JavaX.Inject.dll => 0xea7cf043 => 308
	i32 3945713374, ; 664: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 665: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 666: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 208
	i32 3956287295, ; 667: BarcodeScanning.Native.Maui => 0xebd0273f => 174
	i32 3959773229, ; 668: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 246
	i32 3970018735, ; 669: Xamarin.GooglePlayServices.Tasks.dll => 0xeca1adaf => 307
	i32 3980434154, ; 670: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 345
	i32 3987592930, ; 671: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 327
	i32 4003436829, ; 672: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 673: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 207
	i32 4025784931, ; 674: System.Memory => 0xeff49a63 => 62
	i32 4030748638, ; 675: Mopups => 0xf04057de => 191
	i32 4046471985, ; 676: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 187
	i32 4052947547, ; 677: Xamarin.Google.MLKit.TextRecognition.Bundled.Common => 0xf193125b => 299
	i32 4054681211, ; 678: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 679: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 680: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 681: Microsoft.Maui.Essentials.dll => 0xf40add04 => 189
	i32 4099507663, ; 682: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 683: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 684: Xamarin.AndroidX.Emoji2 => 0xf479582c => 234
	i32 4102112229, ; 685: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 340
	i32 4125707920, ; 686: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 335
	i32 4126470640, ; 687: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 178
	i32 4127667938, ; 688: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 689: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 690: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 691: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 347
	i32 4151237749, ; 692: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 693: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 694: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 695: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 696: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 697: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 254
	i32 4182880526, ; 698: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0xf951b10e => 353
	i32 4185676441, ; 699: System.Security => 0xf97c5a99 => 130
	i32 4192648326, ; 700: Xamarin.Firebase.Encoders.JSON.dll => 0xf9e6bc86 => 283
	i32 4196529839, ; 701: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 702: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4228543782, ; 703: Xamarin.KotlinX.AtomicFU.Jvm.dll => 0xfc0a7526 => 314
	i32 4256097574, ; 704: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 227
	i32 4258378803, ; 705: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 253
	i32 4260525087, ; 706: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 707: Microsoft.Maui.Controls.dll => 0xfea12dee => 186
	i32 4274976490, ; 708: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4284549794, ; 709: Xamarin.Firebase.Components => 0xff610aa2 => 281
	i32 4292120959, ; 710: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 254
	i32 4294763496 ; 711: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 236
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [712 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 301, ; 3
	i32 289, ; 4
	i32 247, ; 5
	i32 294, ; 6
	i32 48, ; 7
	i32 192, ; 8
	i32 80, ; 9
	i32 215, ; 10
	i32 145, ; 11
	i32 314, ; 12
	i32 30, ; 13
	i32 351, ; 14
	i32 124, ; 15
	i32 190, ; 16
	i32 102, ; 17
	i32 268, ; 18
	i32 280, ; 19
	i32 107, ; 20
	i32 268, ; 21
	i32 139, ; 22
	i32 311, ; 23
	i32 77, ; 24
	i32 124, ; 25
	i32 13, ; 26
	i32 219, ; 27
	i32 313, ; 28
	i32 132, ; 29
	i32 270, ; 30
	i32 151, ; 31
	i32 348, ; 32
	i32 349, ; 33
	i32 18, ; 34
	i32 212, ; 35
	i32 26, ; 36
	i32 240, ; 37
	i32 1, ; 38
	i32 59, ; 39
	i32 42, ; 40
	i32 91, ; 41
	i32 223, ; 42
	i32 147, ; 43
	i32 243, ; 44
	i32 239, ; 45
	i32 320, ; 46
	i32 54, ; 47
	i32 69, ; 48
	i32 193, ; 49
	i32 348, ; 50
	i32 203, ; 51
	i32 83, ; 52
	i32 333, ; 53
	i32 241, ; 54
	i32 197, ; 55
	i32 332, ; 56
	i32 131, ; 57
	i32 55, ; 58
	i32 149, ; 59
	i32 74, ; 60
	i32 145, ; 61
	i32 62, ; 62
	i32 146, ; 63
	i32 355, ; 64
	i32 165, ; 65
	i32 248, ; 66
	i32 344, ; 67
	i32 224, ; 68
	i32 12, ; 69
	i32 237, ; 70
	i32 125, ; 71
	i32 152, ; 72
	i32 113, ; 73
	i32 166, ; 74
	i32 164, ; 75
	i32 239, ; 76
	i32 287, ; 77
	i32 256, ; 78
	i32 287, ; 79
	i32 84, ; 80
	i32 331, ; 81
	i32 325, ; 82
	i32 285, ; 83
	i32 299, ; 84
	i32 184, ; 85
	i32 300, ; 86
	i32 150, ; 87
	i32 311, ; 88
	i32 60, ; 89
	i32 180, ; 90
	i32 51, ; 91
	i32 103, ; 92
	i32 114, ; 93
	i32 40, ; 94
	i32 291, ; 95
	i32 279, ; 96
	i32 120, ; 97
	i32 339, ; 98
	i32 52, ; 99
	i32 44, ; 100
	i32 119, ; 101
	i32 248, ; 102
	i32 229, ; 103
	i32 337, ; 104
	i32 235, ; 105
	i32 81, ; 106
	i32 136, ; 107
	i32 275, ; 108
	i32 210, ; 109
	i32 8, ; 110
	i32 313, ; 111
	i32 73, ; 112
	i32 319, ; 113
	i32 155, ; 114
	i32 315, ; 115
	i32 154, ; 116
	i32 92, ; 117
	i32 309, ; 118
	i32 45, ; 119
	i32 334, ; 120
	i32 322, ; 121
	i32 312, ; 122
	i32 109, ; 123
	i32 129, ; 124
	i32 195, ; 125
	i32 25, ; 126
	i32 200, ; 127
	i32 72, ; 128
	i32 55, ; 129
	i32 46, ; 130
	i32 343, ; 131
	i32 290, ; 132
	i32 183, ; 133
	i32 230, ; 134
	i32 22, ; 135
	i32 245, ; 136
	i32 86, ; 137
	i32 43, ; 138
	i32 160, ; 139
	i32 71, ; 140
	i32 261, ; 141
	i32 3, ; 142
	i32 42, ; 143
	i32 63, ; 144
	i32 16, ; 145
	i32 53, ; 146
	i32 346, ; 147
	i32 294, ; 148
	i32 105, ; 149
	i32 192, ; 150
	i32 312, ; 151
	i32 292, ; 152
	i32 241, ; 153
	i32 34, ; 154
	i32 158, ; 155
	i32 85, ; 156
	i32 32, ; 157
	i32 12, ; 158
	i32 51, ; 159
	i32 286, ; 160
	i32 56, ; 161
	i32 265, ; 162
	i32 36, ; 163
	i32 179, ; 164
	i32 321, ; 165
	i32 293, ; 166
	i32 208, ; 167
	i32 35, ; 168
	i32 58, ; 169
	i32 251, ; 170
	i32 290, ; 171
	i32 175, ; 172
	i32 17, ; 173
	i32 310, ; 174
	i32 164, ; 175
	i32 334, ; 176
	i32 249, ; 177
	i32 289, ; 178
	i32 182, ; 179
	i32 278, ; 180
	i32 340, ; 181
	i32 153, ; 182
	i32 274, ; 183
	i32 259, ; 184
	i32 338, ; 185
	i32 297, ; 186
	i32 210, ; 187
	i32 29, ; 188
	i32 193, ; 189
	i32 52, ; 190
	i32 336, ; 191
	i32 279, ; 192
	i32 220, ; 193
	i32 5, ; 194
	i32 320, ; 195
	i32 269, ; 196
	i32 316, ; 197
	i32 273, ; 198
	i32 221, ; 199
	i32 315, ; 200
	i32 207, ; 201
	i32 196, ; 202
	i32 232, ; 203
	i32 85, ; 204
	i32 278, ; 205
	i32 61, ; 206
	i32 112, ; 207
	i32 304, ; 208
	i32 296, ; 209
	i32 295, ; 210
	i32 57, ; 211
	i32 350, ; 212
	i32 265, ; 213
	i32 99, ; 214
	i32 308, ; 215
	i32 0, ; 216
	i32 19, ; 217
	i32 225, ; 218
	i32 111, ; 219
	i32 101, ; 220
	i32 102, ; 221
	i32 318, ; 222
	i32 104, ; 223
	i32 292, ; 224
	i32 242, ; 225
	i32 71, ; 226
	i32 252, ; 227
	i32 38, ; 228
	i32 32, ; 229
	i32 103, ; 230
	i32 73, ; 231
	i32 324, ; 232
	i32 9, ; 233
	i32 123, ; 234
	i32 306, ; 235
	i32 46, ; 236
	i32 209, ; 237
	i32 184, ; 238
	i32 9, ; 239
	i32 43, ; 240
	i32 4, ; 241
	i32 266, ; 242
	i32 328, ; 243
	i32 323, ; 244
	i32 31, ; 245
	i32 138, ; 246
	i32 92, ; 247
	i32 93, ; 248
	i32 343, ; 249
	i32 49, ; 250
	i32 141, ; 251
	i32 112, ; 252
	i32 140, ; 253
	i32 231, ; 254
	i32 115, ; 255
	i32 293, ; 256
	i32 157, ; 257
	i32 352, ; 258
	i32 76, ; 259
	i32 79, ; 260
	i32 255, ; 261
	i32 37, ; 262
	i32 277, ; 263
	i32 235, ; 264
	i32 228, ; 265
	i32 64, ; 266
	i32 138, ; 267
	i32 15, ; 268
	i32 116, ; 269
	i32 271, ; 270
	i32 288, ; 271
	i32 191, ; 272
	i32 223, ; 273
	i32 48, ; 274
	i32 70, ; 275
	i32 80, ; 276
	i32 126, ; 277
	i32 94, ; 278
	i32 121, ; 279
	i32 26, ; 280
	i32 197, ; 281
	i32 304, ; 282
	i32 245, ; 283
	i32 97, ; 284
	i32 28, ; 285
	i32 218, ; 286
	i32 341, ; 287
	i32 319, ; 288
	i32 149, ; 289
	i32 169, ; 290
	i32 4, ; 291
	i32 98, ; 292
	i32 33, ; 293
	i32 93, ; 294
	i32 270, ; 295
	i32 180, ; 296
	i32 21, ; 297
	i32 41, ; 298
	i32 170, ; 299
	i32 335, ; 300
	i32 237, ; 301
	i32 327, ; 302
	i32 255, ; 303
	i32 310, ; 304
	i32 288, ; 305
	i32 260, ; 306
	i32 2, ; 307
	i32 134, ; 308
	i32 111, ; 309
	i32 354, ; 310
	i32 181, ; 311
	i32 347, ; 312
	i32 200, ; 313
	i32 344, ; 314
	i32 58, ; 315
	i32 216, ; 316
	i32 95, ; 317
	i32 326, ; 318
	i32 284, ; 319
	i32 39, ; 320
	i32 211, ; 321
	i32 354, ; 322
	i32 25, ; 323
	i32 94, ; 324
	i32 89, ; 325
	i32 99, ; 326
	i32 303, ; 327
	i32 10, ; 328
	i32 87, ; 329
	i32 100, ; 330
	i32 267, ; 331
	i32 176, ; 332
	i32 173, ; 333
	i32 202, ; 334
	i32 323, ; 335
	i32 7, ; 336
	i32 251, ; 337
	i32 318, ; 338
	i32 199, ; 339
	i32 88, ; 340
	i32 244, ; 341
	i32 154, ; 342
	i32 322, ; 343
	i32 33, ; 344
	i32 116, ; 345
	i32 82, ; 346
	i32 174, ; 347
	i32 198, ; 348
	i32 286, ; 349
	i32 20, ; 350
	i32 302, ; 351
	i32 11, ; 352
	i32 162, ; 353
	i32 3, ; 354
	i32 188, ; 355
	i32 330, ; 356
	i32 280, ; 357
	i32 183, ; 358
	i32 295, ; 359
	i32 181, ; 360
	i32 84, ; 361
	i32 317, ; 362
	i32 64, ; 363
	i32 332, ; 364
	i32 274, ; 365
	i32 143, ; 366
	i32 256, ; 367
	i32 157, ; 368
	i32 41, ; 369
	i32 117, ; 370
	i32 177, ; 371
	i32 201, ; 372
	i32 326, ; 373
	i32 0, ; 374
	i32 263, ; 375
	i32 131, ; 376
	i32 75, ; 377
	i32 66, ; 378
	i32 336, ; 379
	i32 172, ; 380
	i32 205, ; 381
	i32 143, ; 382
	i32 106, ; 383
	i32 151, ; 384
	i32 70, ; 385
	i32 306, ; 386
	i32 156, ; 387
	i32 176, ; 388
	i32 121, ; 389
	i32 127, ; 390
	i32 331, ; 391
	i32 152, ; 392
	i32 234, ; 393
	i32 353, ; 394
	i32 216, ; 395
	i32 141, ; 396
	i32 221, ; 397
	i32 296, ; 398
	i32 328, ; 399
	i32 20, ; 400
	i32 14, ; 401
	i32 135, ; 402
	i32 305, ; 403
	i32 75, ; 404
	i32 59, ; 405
	i32 195, ; 406
	i32 224, ; 407
	i32 167, ; 408
	i32 168, ; 409
	i32 186, ; 410
	i32 15, ; 411
	i32 74, ; 412
	i32 6, ; 413
	i32 23, ; 414
	i32 247, ; 415
	i32 199, ; 416
	i32 91, ; 417
	i32 329, ; 418
	i32 1, ; 419
	i32 305, ; 420
	i32 136, ; 421
	i32 250, ; 422
	i32 249, ; 423
	i32 273, ; 424
	i32 134, ; 425
	i32 69, ; 426
	i32 146, ; 427
	i32 338, ; 428
	i32 317, ; 429
	i32 238, ; 430
	i32 182, ; 431
	i32 88, ; 432
	i32 96, ; 433
	i32 282, ; 434
	i32 228, ; 435
	i32 233, ; 436
	i32 333, ; 437
	i32 31, ; 438
	i32 45, ; 439
	i32 243, ; 440
	i32 282, ; 441
	i32 201, ; 442
	i32 109, ; 443
	i32 158, ; 444
	i32 35, ; 445
	i32 316, ; 446
	i32 22, ; 447
	i32 114, ; 448
	i32 57, ; 449
	i32 271, ; 450
	i32 144, ; 451
	i32 118, ; 452
	i32 120, ; 453
	i32 110, ; 454
	i32 203, ; 455
	i32 139, ; 456
	i32 209, ; 457
	i32 54, ; 458
	i32 105, ; 459
	i32 339, ; 460
	i32 187, ; 461
	i32 188, ; 462
	i32 133, ; 463
	i32 252, ; 464
	i32 309, ; 465
	i32 276, ; 466
	i32 264, ; 467
	i32 242, ; 468
	i32 345, ; 469
	i32 238, ; 470
	i32 190, ; 471
	i32 159, ; 472
	i32 281, ; 473
	i32 324, ; 474
	i32 225, ; 475
	i32 163, ; 476
	i32 132, ; 477
	i32 264, ; 478
	i32 161, ; 479
	i32 337, ; 480
	i32 253, ; 481
	i32 302, ; 482
	i32 140, ; 483
	i32 276, ; 484
	i32 272, ; 485
	i32 169, ; 486
	i32 189, ; 487
	i32 300, ; 488
	i32 204, ; 489
	i32 291, ; 490
	i32 40, ; 491
	i32 236, ; 492
	i32 81, ; 493
	i32 56, ; 494
	i32 37, ; 495
	i32 97, ; 496
	i32 166, ; 497
	i32 172, ; 498
	i32 277, ; 499
	i32 82, ; 500
	i32 206, ; 501
	i32 98, ; 502
	i32 30, ; 503
	i32 159, ; 504
	i32 18, ; 505
	i32 217, ; 506
	i32 127, ; 507
	i32 119, ; 508
	i32 232, ; 509
	i32 267, ; 510
	i32 214, ; 511
	i32 246, ; 512
	i32 217, ; 513
	i32 269, ; 514
	i32 165, ; 515
	i32 240, ; 516
	i32 355, ; 517
	i32 214, ; 518
	i32 266, ; 519
	i32 257, ; 520
	i32 307, ; 521
	i32 170, ; 522
	i32 16, ; 523
	i32 144, ; 524
	i32 330, ; 525
	i32 125, ; 526
	i32 118, ; 527
	i32 38, ; 528
	i32 115, ; 529
	i32 47, ; 530
	i32 142, ; 531
	i32 117, ; 532
	i32 34, ; 533
	i32 175, ; 534
	i32 285, ; 535
	i32 95, ; 536
	i32 53, ; 537
	i32 258, ; 538
	i32 129, ; 539
	i32 153, ; 540
	i32 24, ; 541
	i32 161, ; 542
	i32 231, ; 543
	i32 148, ; 544
	i32 104, ; 545
	i32 303, ; 546
	i32 89, ; 547
	i32 218, ; 548
	i32 60, ; 549
	i32 142, ; 550
	i32 100, ; 551
	i32 5, ; 552
	i32 13, ; 553
	i32 194, ; 554
	i32 122, ; 555
	i32 135, ; 556
	i32 28, ; 557
	i32 325, ; 558
	i32 72, ; 559
	i32 229, ; 560
	i32 24, ; 561
	i32 211, ; 562
	i32 262, ; 563
	i32 259, ; 564
	i32 342, ; 565
	i32 137, ; 566
	i32 196, ; 567
	i32 204, ; 568
	i32 226, ; 569
	i32 168, ; 570
	i32 284, ; 571
	i32 263, ; 572
	i32 321, ; 573
	i32 283, ; 574
	i32 101, ; 575
	i32 123, ; 576
	i32 230, ; 577
	i32 301, ; 578
	i32 213, ; 579
	i32 213, ; 580
	i32 178, ; 581
	i32 163, ; 582
	i32 167, ; 583
	i32 233, ; 584
	i32 39, ; 585
	i32 185, ; 586
	i32 329, ; 587
	i32 17, ; 588
	i32 171, ; 589
	i32 342, ; 590
	i32 341, ; 591
	i32 137, ; 592
	i32 150, ; 593
	i32 222, ; 594
	i32 155, ; 595
	i32 130, ; 596
	i32 19, ; 597
	i32 65, ; 598
	i32 147, ; 599
	i32 47, ; 600
	i32 349, ; 601
	i32 202, ; 602
	i32 79, ; 603
	i32 61, ; 604
	i32 106, ; 605
	i32 297, ; 606
	i32 261, ; 607
	i32 206, ; 608
	i32 49, ; 609
	i32 244, ; 610
	i32 346, ; 611
	i32 258, ; 612
	i32 14, ; 613
	i32 177, ; 614
	i32 68, ; 615
	i32 171, ; 616
	i32 215, ; 617
	i32 352, ; 618
	i32 212, ; 619
	i32 222, ; 620
	i32 351, ; 621
	i32 78, ; 622
	i32 227, ; 623
	i32 108, ; 624
	i32 205, ; 625
	i32 257, ; 626
	i32 67, ; 627
	i32 63, ; 628
	i32 27, ; 629
	i32 160, ; 630
	i32 198, ; 631
	i32 298, ; 632
	i32 250, ; 633
	i32 219, ; 634
	i32 10, ; 635
	i32 173, ; 636
	i32 185, ; 637
	i32 11, ; 638
	i32 78, ; 639
	i32 126, ; 640
	i32 83, ; 641
	i32 179, ; 642
	i32 298, ; 643
	i32 66, ; 644
	i32 107, ; 645
	i32 65, ; 646
	i32 128, ; 647
	i32 122, ; 648
	i32 194, ; 649
	i32 77, ; 650
	i32 272, ; 651
	i32 262, ; 652
	i32 350, ; 653
	i32 8, ; 654
	i32 226, ; 655
	i32 2, ; 656
	i32 220, ; 657
	i32 44, ; 658
	i32 275, ; 659
	i32 156, ; 660
	i32 128, ; 661
	i32 260, ; 662
	i32 308, ; 663
	i32 23, ; 664
	i32 133, ; 665
	i32 208, ; 666
	i32 174, ; 667
	i32 246, ; 668
	i32 307, ; 669
	i32 345, ; 670
	i32 327, ; 671
	i32 29, ; 672
	i32 207, ; 673
	i32 62, ; 674
	i32 191, ; 675
	i32 187, ; 676
	i32 299, ; 677
	i32 90, ; 678
	i32 87, ; 679
	i32 148, ; 680
	i32 189, ; 681
	i32 36, ; 682
	i32 86, ; 683
	i32 234, ; 684
	i32 340, ; 685
	i32 335, ; 686
	i32 178, ; 687
	i32 50, ; 688
	i32 6, ; 689
	i32 90, ; 690
	i32 347, ; 691
	i32 21, ; 692
	i32 162, ; 693
	i32 96, ; 694
	i32 50, ; 695
	i32 113, ; 696
	i32 254, ; 697
	i32 353, ; 698
	i32 130, ; 699
	i32 283, ; 700
	i32 76, ; 701
	i32 27, ; 702
	i32 314, ; 703
	i32 227, ; 704
	i32 253, ; 705
	i32 7, ; 706
	i32 186, ; 707
	i32 110, ; 708
	i32 281, ; 709
	i32 254, ; 710
	i32 236 ; 711
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
