let to_lower k =
 match k with
   | 65
   | 66
   | 67
   | 68
   | 69
   | 70
   | 71
   | 72
   | 73
   | 74
   | 75
   | 76
   | 77
   | 78
   | 79
   | 80
   | 81
   | 82
   | 83
   | 84
   | 85
   | 86
   | 87
   | 88
   | 89
   | 90
       -> k + (32)
   | 192
   | 193
   | 194
   | 195
   | 196
   | 197
   | 198
   | 199
   | 200
   | 201
   | 202
   | 203
   | 204
   | 205
   | 206
   | 207
   | 208
   | 209
   | 210
   | 211
   | 212
   | 213
   | 214
       -> k + (32)
   | 216
   | 217
   | 218
   | 219
   | 220
   | 221
   | 222
       -> k + (32)
   | 256 -> 257
   | 258 -> 259
   | 260 -> 261
   | 262 -> 263
   | 264 -> 265
   | 266 -> 267
   | 268 -> 269
   | 270 -> 271
   | 272 -> 273
   | 274 -> 275
   | 276 -> 277
   | 278 -> 279
   | 280 -> 281
   | 282 -> 283
   | 284 -> 285
   | 286 -> 287
   | 288 -> 289
   | 290 -> 291
   | 292 -> 293
   | 294 -> 295
   | 296 -> 297
   | 298 -> 299
   | 300 -> 301
   | 302 -> 303
   | 304 -> 105
   | 306 -> 307
   | 308 -> 309
   | 310 -> 311
   | 313 -> 314
   | 315 -> 316
   | 317 -> 318
   | 319 -> 320
   | 321 -> 322
   | 323 -> 324
   | 325 -> 326
   | 327 -> 328
   | 330 -> 331
   | 332 -> 333
   | 334 -> 335
   | 336 -> 337
   | 338 -> 339
   | 340 -> 341
   | 342 -> 343
   | 344 -> 345
   | 346 -> 347
   | 348 -> 349
   | 350 -> 351
   | 352 -> 353
   | 354 -> 355
   | 356 -> 357
   | 358 -> 359
   | 360 -> 361
   | 362 -> 363
   | 364 -> 365
   | 366 -> 367
   | 368 -> 369
   | 370 -> 371
   | 372 -> 373
   | 374 -> 375
   | 376 -> 255
   | 377 -> 378
   | 379 -> 380
   | 381 -> 382
   | 385 -> 595
   | 386 -> 387
   | 388 -> 389
   | 390 -> 596
   | 391 -> 392
   | 393
   | 394
       -> k + (205)
   | 395 -> 396
   | 398 -> 477
   | 399 -> 601
   | 400 -> 603
   | 401 -> 402
   | 403 -> 608
   | 404 -> 611
   | 406 -> 617
   | 407 -> 616
   | 408 -> 409
   | 412 -> 623
   | 413 -> 626
   | 415 -> 629
   | 416 -> 417
   | 418 -> 419
   | 420 -> 421
   | 422 -> 640
   | 423 -> 424
   | 425 -> 643
   | 428 -> 429
   | 430 -> 648
   | 431 -> 432
   | 433
   | 434
       -> k + (217)
   | 435 -> 436
   | 437 -> 438
   | 439 -> 658
   | 440 -> 441
   | 444 -> 445
   | 452 -> 454
   | 453 -> 454
   | 455 -> 457
   | 456 -> 457
   | 458 -> 460
   | 459 -> 460
   | 461 -> 462
   | 463 -> 464
   | 465 -> 466
   | 467 -> 468
   | 469 -> 470
   | 471 -> 472
   | 473 -> 474
   | 475 -> 476
   | 478 -> 479
   | 480 -> 481
   | 482 -> 483
   | 484 -> 485
   | 486 -> 487
   | 488 -> 489
   | 490 -> 491
   | 492 -> 493
   | 494 -> 495
   | 497 -> 499
   | 498 -> 499
   | 500 -> 501
   | 502 -> 405
   | 503 -> 447
   | 504 -> 505
   | 506 -> 507
   | 508 -> 509
   | 510 -> 511
   | 512 -> 513
   | 514 -> 515
   | 516 -> 517
   | 518 -> 519
   | 520 -> 521
   | 522 -> 523
   | 524 -> 525
   | 526 -> 527
   | 528 -> 529
   | 530 -> 531
   | 532 -> 533
   | 534 -> 535
   | 536 -> 537
   | 538 -> 539
   | 540 -> 541
   | 542 -> 543
   | 544 -> 414
   | 546 -> 547
   | 548 -> 549
   | 550 -> 551
   | 552 -> 553
   | 554 -> 555
   | 556 -> 557
   | 558 -> 559
   | 560 -> 561
   | 562 -> 563
   | 902 -> 940
   | 904
   | 905
   | 906
       -> k + (37)
   | 908 -> 972
   | 910
   | 911
       -> k + (63)
   | 913
   | 914
   | 915
   | 916
   | 917
   | 918
   | 919
   | 920
   | 921
   | 922
   | 923
   | 924
   | 925
   | 926
   | 927
   | 928
   | 929
       -> k + (32)
   | 931
   | 932
   | 933
   | 934
   | 935
   | 936
   | 937
   | 938
   | 939
       -> k + (32)
   | 984 -> 985
   | 986 -> 987
   | 988 -> 989
   | 990 -> 991
   | 992 -> 993
   | 994 -> 995
   | 996 -> 997
   | 998 -> 999
   | 1000 -> 1001
   | 1002 -> 1003
   | 1004 -> 1005
   | 1006 -> 1007
   | 1012 -> 952
   | 1024
   | 1025
   | 1026
   | 1027
   | 1028
   | 1029
   | 1030
   | 1031
   | 1032
   | 1033
   | 1034
   | 1035
   | 1036
   | 1037
   | 1038
   | 1039
       -> k + (80)
   | 1040
   | 1041
   | 1042
   | 1043
   | 1044
   | 1045
   | 1046
   | 1047
   | 1048
   | 1049
   | 1050
   | 1051
   | 1052
   | 1053
   | 1054
   | 1055
   | 1056
   | 1057
   | 1058
   | 1059
   | 1060
   | 1061
   | 1062
   | 1063
   | 1064
   | 1065
   | 1066
   | 1067
   | 1068
   | 1069
   | 1070
   | 1071
       -> k + (32)
   | 1120 -> 1121
   | 1122 -> 1123
   | 1124 -> 1125
   | 1126 -> 1127
   | 1128 -> 1129
   | 1130 -> 1131
   | 1132 -> 1133
   | 1134 -> 1135
   | 1136 -> 1137
   | 1138 -> 1139
   | 1140 -> 1141
   | 1142 -> 1143
   | 1144 -> 1145
   | 1146 -> 1147
   | 1148 -> 1149
   | 1150 -> 1151
   | 1152 -> 1153
   | 1162 -> 1163
   | 1164 -> 1165
   | 1166 -> 1167
   | 1168 -> 1169
   | 1170 -> 1171
   | 1172 -> 1173
   | 1174 -> 1175
   | 1176 -> 1177
   | 1178 -> 1179
   | 1180 -> 1181
   | 1182 -> 1183
   | 1184 -> 1185
   | 1186 -> 1187
   | 1188 -> 1189
   | 1190 -> 1191
   | 1192 -> 1193
   | 1194 -> 1195
   | 1196 -> 1197
   | 1198 -> 1199
   | 1200 -> 1201
   | 1202 -> 1203
   | 1204 -> 1205
   | 1206 -> 1207
   | 1208 -> 1209
   | 1210 -> 1211
   | 1212 -> 1213
   | 1214 -> 1215
   | 1217 -> 1218
   | 1219 -> 1220
   | 1221 -> 1222
   | 1223 -> 1224
   | 1225 -> 1226
   | 1227 -> 1228
   | 1229 -> 1230
   | 1232 -> 1233
   | 1234 -> 1235
   | 1236 -> 1237
   | 1238 -> 1239
   | 1240 -> 1241
   | 1242 -> 1243
   | 1244 -> 1245
   | 1246 -> 1247
   | 1248 -> 1249
   | 1250 -> 1251
   | 1252 -> 1253
   | 1254 -> 1255
   | 1256 -> 1257
   | 1258 -> 1259
   | 1260 -> 1261
   | 1262 -> 1263
   | 1264 -> 1265
   | 1266 -> 1267
   | 1268 -> 1269
   | 1272 -> 1273
   | 1280 -> 1281
   | 1282 -> 1283
   | 1284 -> 1285
   | 1286 -> 1287
   | 1288 -> 1289
   | 1290 -> 1291
   | 1292 -> 1293
   | 1294 -> 1295
   | 1329
   | 1330
   | 1331
   | 1332
   | 1333
   | 1334
   | 1335
   | 1336
   | 1337
   | 1338
   | 1339
   | 1340
   | 1341
   | 1342
   | 1343
   | 1344
   | 1345
   | 1346
   | 1347
   | 1348
   | 1349
   | 1350
   | 1351
   | 1352
   | 1353
   | 1354
   | 1355
   | 1356
   | 1357
   | 1358
   | 1359
   | 1360
   | 1361
   | 1362
   | 1363
   | 1364
   | 1365
   | 1366
       -> k + (48)
   | 7680 -> 7681
   | 7682 -> 7683
   | 7684 -> 7685
   | 7686 -> 7687
   | 7688 -> 7689
   | 7690 -> 7691
   | 7692 -> 7693
   | 7694 -> 7695
   | 7696 -> 7697
   | 7698 -> 7699
   | 7700 -> 7701
   | 7702 -> 7703
   | 7704 -> 7705
   | 7706 -> 7707
   | 7708 -> 7709
   | 7710 -> 7711
   | 7712 -> 7713
   | 7714 -> 7715
   | 7716 -> 7717
   | 7718 -> 7719
   | 7720 -> 7721
   | 7722 -> 7723
   | 7724 -> 7725
   | 7726 -> 7727
   | 7728 -> 7729
   | 7730 -> 7731
   | 7732 -> 7733
   | 7734 -> 7735
   | 7736 -> 7737
   | 7738 -> 7739
   | 7740 -> 7741
   | 7742 -> 7743
   | 7744 -> 7745
   | 7746 -> 7747
   | 7748 -> 7749
   | 7750 -> 7751
   | 7752 -> 7753
   | 7754 -> 7755
   | 7756 -> 7757
   | 7758 -> 7759
   | 7760 -> 7761
   | 7762 -> 7763
   | 7764 -> 7765
   | 7766 -> 7767
   | 7768 -> 7769
   | 7770 -> 7771
   | 7772 -> 7773
   | 7774 -> 7775
   | 7776 -> 7777
   | 7778 -> 7779
   | 7780 -> 7781
   | 7782 -> 7783
   | 7784 -> 7785
   | 7786 -> 7787
   | 7788 -> 7789
   | 7790 -> 7791
   | 7792 -> 7793
   | 7794 -> 7795
   | 7796 -> 7797
   | 7798 -> 7799
   | 7800 -> 7801
   | 7802 -> 7803
   | 7804 -> 7805
   | 7806 -> 7807
   | 7808 -> 7809
   | 7810 -> 7811
   | 7812 -> 7813
   | 7814 -> 7815
   | 7816 -> 7817
   | 7818 -> 7819
   | 7820 -> 7821
   | 7822 -> 7823
   | 7824 -> 7825
   | 7826 -> 7827
   | 7828 -> 7829
   | 7840 -> 7841
   | 7842 -> 7843
   | 7844 -> 7845
   | 7846 -> 7847
   | 7848 -> 7849
   | 7850 -> 7851
   | 7852 -> 7853
   | 7854 -> 7855
   | 7856 -> 7857
   | 7858 -> 7859
   | 7860 -> 7861
   | 7862 -> 7863
   | 7864 -> 7865
   | 7866 -> 7867
   | 7868 -> 7869
   | 7870 -> 7871
   | 7872 -> 7873
   | 7874 -> 7875
   | 7876 -> 7877
   | 7878 -> 7879
   | 7880 -> 7881
   | 7882 -> 7883
   | 7884 -> 7885
   | 7886 -> 7887
   | 7888 -> 7889
   | 7890 -> 7891
   | 7892 -> 7893
   | 7894 -> 7895
   | 7896 -> 7897
   | 7898 -> 7899
   | 7900 -> 7901
   | 7902 -> 7903
   | 7904 -> 7905
   | 7906 -> 7907
   | 7908 -> 7909
   | 7910 -> 7911
   | 7912 -> 7913
   | 7914 -> 7915
   | 7916 -> 7917
   | 7918 -> 7919
   | 7920 -> 7921
   | 7922 -> 7923
   | 7924 -> 7925
   | 7926 -> 7927
   | 7928 -> 7929
   | 7944
   | 7945
   | 7946
   | 7947
   | 7948
   | 7949
   | 7950
   | 7951
       -> k + (-8)
   | 7960
   | 7961
   | 7962
   | 7963
   | 7964
   | 7965
       -> k + (-8)
   | 7976
   | 7977
   | 7978
   | 7979
   | 7980
   | 7981
   | 7982
   | 7983
       -> k + (-8)
   | 7992
   | 7993
   | 7994
   | 7995
   | 7996
   | 7997
   | 7998
   | 7999
       -> k + (-8)
   | 8008
   | 8009
   | 8010
   | 8011
   | 8012
   | 8013
       -> k + (-8)
   | 8025 -> 8017
   | 8027 -> 8019
   | 8029 -> 8021
   | 8031 -> 8023
   | 8040
   | 8041
   | 8042
   | 8043
   | 8044
   | 8045
   | 8046
   | 8047
       -> k + (-8)
   | 8072
   | 8073
   | 8074
   | 8075
   | 8076
   | 8077
   | 8078
   | 8079
       -> k + (-8)
   | 8088
   | 8089
   | 8090
   | 8091
   | 8092
   | 8093
   | 8094
   | 8095
       -> k + (-8)
   | 8104
   | 8105
   | 8106
   | 8107
   | 8108
   | 8109
   | 8110
   | 8111
       -> k + (-8)
   | 8120
   | 8121
       -> k + (-8)
   | 8122
   | 8123
       -> k + (-74)
   | 8124 -> 8115
   | 8136
   | 8137
   | 8138
   | 8139
       -> k + (-86)
   | 8140 -> 8131
   | 8152
   | 8153
       -> k + (-8)
   | 8154
   | 8155
       -> k + (-100)
   | 8168
   | 8169
       -> k + (-8)
   | 8170
   | 8171
       -> k + (-112)
   | 8172 -> 8165
   | 8184
   | 8185
       -> k + (-128)
   | 8186
   | 8187
       -> k + (-126)
   | 8188 -> 8179
   | 8486 -> 969
   | 8490 -> 107
   | 8491 -> 229
   | 8544
   | 8545
   | 8546
   | 8547
   | 8548
   | 8549
   | 8550
   | 8551
   | 8552
   | 8553
   | 8554
   | 8555
   | 8556
   | 8557
   | 8558
   | 8559
       -> k + (16)
   | 9398
   | 9399
   | 9400
   | 9401
   | 9402
   | 9403
   | 9404
   | 9405
   | 9406
   | 9407
   | 9408
   | 9409
   | 9410
   | 9411
   | 9412
   | 9413
   | 9414
   | 9415
   | 9416
   | 9417
   | 9418
   | 9419
   | 9420
   | 9421
   | 9422
   | 9423
       -> k + (26)
   | 65313
   | 65314
   | 65315
   | 65316
   | 65317
   | 65318
   | 65319
   | 65320
   | 65321
   | 65322
   | 65323
   | 65324
   | 65325
   | 65326
   | 65327
   | 65328
   | 65329
   | 65330
   | 65331
   | 65332
   | 65333
   | 65334
   | 65335
   | 65336
   | 65337
   | 65338
       -> k + (32)
   | 66560
   | 66561
   | 66562
   | 66563
   | 66564
   | 66565
   | 66566
   | 66567
   | 66568
   | 66569
   | 66570
   | 66571
   | 66572
   | 66573
   | 66574
   | 66575
   | 66576
   | 66577
   | 66578
   | 66579
   | 66580
   | 66581
   | 66582
   | 66583
   | 66584
   | 66585
   | 66586
   | 66587
   | 66588
   | 66589
   | 66590
   | 66591
   | 66592
   | 66593
   | 66594
   | 66595
   | 66596
   | 66597
       -> k + (40)
   | _ -> k;;
let to_upper k =
 match k with
   | 97
   | 98
   | 99
   | 100
   | 101
   | 102
   | 103
   | 104
   | 105
   | 106
   | 107
   | 108
   | 109
   | 110
   | 111
   | 112
   | 113
   | 114
   | 115
   | 116
   | 117
   | 118
   | 119
   | 120
   | 121
   | 122
       -> k + (-32)
   | 181 -> 924
   | 224
   | 225
   | 226
   | 227
   | 228
   | 229
   | 230
   | 231
   | 232
   | 233
   | 234
   | 235
   | 236
   | 237
   | 238
   | 239
   | 240
   | 241
   | 242
   | 243
   | 244
   | 245
   | 246
       -> k + (-32)
   | 248
   | 249
   | 250
   | 251
   | 252
   | 253
   | 254
       -> k + (-32)
   | 255 -> 376
   | 257 -> 256
   | 259 -> 258
   | 261 -> 260
   | 263 -> 262
   | 265 -> 264
   | 267 -> 266
   | 269 -> 268
   | 271 -> 270
   | 273 -> 272
   | 275 -> 274
   | 277 -> 276
   | 279 -> 278
   | 281 -> 280
   | 283 -> 282
   | 285 -> 284
   | 287 -> 286
   | 289 -> 288
   | 291 -> 290
   | 293 -> 292
   | 295 -> 294
   | 297 -> 296
   | 299 -> 298
   | 301 -> 300
   | 303 -> 302
   | 305 -> 73
   | 307 -> 306
   | 309 -> 308
   | 311 -> 310
   | 314 -> 313
   | 316 -> 315
   | 318 -> 317
   | 320 -> 319
   | 322 -> 321
   | 324 -> 323
   | 326 -> 325
   | 328 -> 327
   | 331 -> 330
   | 333 -> 332
   | 335 -> 334
   | 337 -> 336
   | 339 -> 338
   | 341 -> 340
   | 343 -> 342
   | 345 -> 344
   | 347 -> 346
   | 349 -> 348
   | 351 -> 350
   | 353 -> 352
   | 355 -> 354
   | 357 -> 356
   | 359 -> 358
   | 361 -> 360
   | 363 -> 362
   | 365 -> 364
   | 367 -> 366
   | 369 -> 368
   | 371 -> 370
   | 373 -> 372
   | 375 -> 374
   | 378 -> 377
   | 380 -> 379
   | 382 -> 381
   | 383 -> 83
   | 387 -> 386
   | 389 -> 388
   | 392 -> 391
   | 396 -> 395
   | 402 -> 401
   | 405 -> 502
   | 409 -> 408
   | 414 -> 544
   | 417 -> 416
   | 419 -> 418
   | 421 -> 420
   | 424 -> 423
   | 429 -> 428
   | 432 -> 431
   | 436 -> 435
   | 438 -> 437
   | 441 -> 440
   | 445 -> 444
   | 447 -> 503
   | 453 -> 452
   | 454 -> 452
   | 456 -> 455
   | 457 -> 455
   | 459 -> 458
   | 460 -> 458
   | 462 -> 461
   | 464 -> 463
   | 466 -> 465
   | 468 -> 467
   | 470 -> 469
   | 472 -> 471
   | 474 -> 473
   | 476 -> 475
   | 477 -> 398
   | 479 -> 478
   | 481 -> 480
   | 483 -> 482
   | 485 -> 484
   | 487 -> 486
   | 489 -> 488
   | 491 -> 490
   | 493 -> 492
   | 495 -> 494
   | 498 -> 497
   | 499 -> 497
   | 501 -> 500
   | 505 -> 504
   | 507 -> 506
   | 509 -> 508
   | 511 -> 510
   | 513 -> 512
   | 515 -> 514
   | 517 -> 516
   | 519 -> 518
   | 521 -> 520
   | 523 -> 522
   | 525 -> 524
   | 527 -> 526
   | 529 -> 528
   | 531 -> 530
   | 533 -> 532
   | 535 -> 534
   | 537 -> 536
   | 539 -> 538
   | 541 -> 540
   | 543 -> 542
   | 547 -> 546
   | 549 -> 548
   | 551 -> 550
   | 553 -> 552
   | 555 -> 554
   | 557 -> 556
   | 559 -> 558
   | 561 -> 560
   | 563 -> 562
   | 595 -> 385
   | 596 -> 390
   | 598
   | 599
       -> k + (-205)
   | 601 -> 399
   | 603 -> 400
   | 608 -> 403
   | 611 -> 404
   | 616 -> 407
   | 617 -> 406
   | 623 -> 412
   | 626 -> 413
   | 629 -> 415
   | 640 -> 422
   | 643 -> 425
   | 648 -> 430
   | 650
   | 651
       -> k + (-217)
   | 658 -> 439
   | 837 -> 921
   | 940 -> 902
   | 941
   | 942
   | 943
       -> k + (-37)
   | 945
   | 946
   | 947
   | 948
   | 949
   | 950
   | 951
   | 952
   | 953
   | 954
   | 955
   | 956
   | 957
   | 958
   | 959
   | 960
   | 961
       -> k + (-32)
   | 962 -> 931
   | 963
   | 964
   | 965
   | 966
   | 967
   | 968
   | 969
   | 970
   | 971
       -> k + (-32)
   | 972 -> 908
   | 973
   | 974
       -> k + (-63)
   | 976 -> 914
   | 977 -> 920
   | 981 -> 934
   | 982 -> 928
   | 985 -> 984
   | 987 -> 986
   | 989 -> 988
   | 991 -> 990
   | 993 -> 992
   | 995 -> 994
   | 997 -> 996
   | 999 -> 998
   | 1001 -> 1000
   | 1003 -> 1002
   | 1005 -> 1004
   | 1007 -> 1006
   | 1008 -> 922
   | 1009 -> 929
   | 1010 -> 931
   | 1013 -> 917
   | 1072
   | 1073
   | 1074
   | 1075
   | 1076
   | 1077
   | 1078
   | 1079
   | 1080
   | 1081
   | 1082
   | 1083
   | 1084
   | 1085
   | 1086
   | 1087
   | 1088
   | 1089
   | 1090
   | 1091
   | 1092
   | 1093
   | 1094
   | 1095
   | 1096
   | 1097
   | 1098
   | 1099
   | 1100
   | 1101
   | 1102
   | 1103
       -> k + (-32)
   | 1104
   | 1105
   | 1106
   | 1107
   | 1108
   | 1109
   | 1110
   | 1111
   | 1112
   | 1113
   | 1114
   | 1115
   | 1116
   | 1117
   | 1118
   | 1119
       -> k + (-80)
   | 1121 -> 1120
   | 1123 -> 1122
   | 1125 -> 1124
   | 1127 -> 1126
   | 1129 -> 1128
   | 1131 -> 1130
   | 1133 -> 1132
   | 1135 -> 1134
   | 1137 -> 1136
   | 1139 -> 1138
   | 1141 -> 1140
   | 1143 -> 1142
   | 1145 -> 1144
   | 1147 -> 1146
   | 1149 -> 1148
   | 1151 -> 1150
   | 1153 -> 1152
   | 1163 -> 1162
   | 1165 -> 1164
   | 1167 -> 1166
   | 1169 -> 1168
   | 1171 -> 1170
   | 1173 -> 1172
   | 1175 -> 1174
   | 1177 -> 1176
   | 1179 -> 1178
   | 1181 -> 1180
   | 1183 -> 1182
   | 1185 -> 1184
   | 1187 -> 1186
   | 1189 -> 1188
   | 1191 -> 1190
   | 1193 -> 1192
   | 1195 -> 1194
   | 1197 -> 1196
   | 1199 -> 1198
   | 1201 -> 1200
   | 1203 -> 1202
   | 1205 -> 1204
   | 1207 -> 1206
   | 1209 -> 1208
   | 1211 -> 1210
   | 1213 -> 1212
   | 1215 -> 1214
   | 1218 -> 1217
   | 1220 -> 1219
   | 1222 -> 1221
   | 1224 -> 1223
   | 1226 -> 1225
   | 1228 -> 1227
   | 1230 -> 1229
   | 1233 -> 1232
   | 1235 -> 1234
   | 1237 -> 1236
   | 1239 -> 1238
   | 1241 -> 1240
   | 1243 -> 1242
   | 1245 -> 1244
   | 1247 -> 1246
   | 1249 -> 1248
   | 1251 -> 1250
   | 1253 -> 1252
   | 1255 -> 1254
   | 1257 -> 1256
   | 1259 -> 1258
   | 1261 -> 1260
   | 1263 -> 1262
   | 1265 -> 1264
   | 1267 -> 1266
   | 1269 -> 1268
   | 1273 -> 1272
   | 1281 -> 1280
   | 1283 -> 1282
   | 1285 -> 1284
   | 1287 -> 1286
   | 1289 -> 1288
   | 1291 -> 1290
   | 1293 -> 1292
   | 1295 -> 1294
   | 1377
   | 1378
   | 1379
   | 1380
   | 1381
   | 1382
   | 1383
   | 1384
   | 1385
   | 1386
   | 1387
   | 1388
   | 1389
   | 1390
   | 1391
   | 1392
   | 1393
   | 1394
   | 1395
   | 1396
   | 1397
   | 1398
   | 1399
   | 1400
   | 1401
   | 1402
   | 1403
   | 1404
   | 1405
   | 1406
   | 1407
   | 1408
   | 1409
   | 1410
   | 1411
   | 1412
   | 1413
   | 1414
       -> k + (-48)
   | 7681 -> 7680
   | 7683 -> 7682
   | 7685 -> 7684
   | 7687 -> 7686
   | 7689 -> 7688
   | 7691 -> 7690
   | 7693 -> 7692
   | 7695 -> 7694
   | 7697 -> 7696
   | 7699 -> 7698
   | 7701 -> 7700
   | 7703 -> 7702
   | 7705 -> 7704
   | 7707 -> 7706
   | 7709 -> 7708
   | 7711 -> 7710
   | 7713 -> 7712
   | 7715 -> 7714
   | 7717 -> 7716
   | 7719 -> 7718
   | 7721 -> 7720
   | 7723 -> 7722
   | 7725 -> 7724
   | 7727 -> 7726
   | 7729 -> 7728
   | 7731 -> 7730
   | 7733 -> 7732
   | 7735 -> 7734
   | 7737 -> 7736
   | 7739 -> 7738
   | 7741 -> 7740
   | 7743 -> 7742
   | 7745 -> 7744
   | 7747 -> 7746
   | 7749 -> 7748
   | 7751 -> 7750
   | 7753 -> 7752
   | 7755 -> 7754
   | 7757 -> 7756
   | 7759 -> 7758
   | 7761 -> 7760
   | 7763 -> 7762
   | 7765 -> 7764
   | 7767 -> 7766
   | 7769 -> 7768
   | 7771 -> 7770
   | 7773 -> 7772
   | 7775 -> 7774
   | 7777 -> 7776
   | 7779 -> 7778
   | 7781 -> 7780
   | 7783 -> 7782
   | 7785 -> 7784
   | 7787 -> 7786
   | 7789 -> 7788
   | 7791 -> 7790
   | 7793 -> 7792
   | 7795 -> 7794
   | 7797 -> 7796
   | 7799 -> 7798
   | 7801 -> 7800
   | 7803 -> 7802
   | 7805 -> 7804
   | 7807 -> 7806
   | 7809 -> 7808
   | 7811 -> 7810
   | 7813 -> 7812
   | 7815 -> 7814
   | 7817 -> 7816
   | 7819 -> 7818
   | 7821 -> 7820
   | 7823 -> 7822
   | 7825 -> 7824
   | 7827 -> 7826
   | 7829 -> 7828
   | 7835 -> 7776
   | 7841 -> 7840
   | 7843 -> 7842
   | 7845 -> 7844
   | 7847 -> 7846
   | 7849 -> 7848
   | 7851 -> 7850
   | 7853 -> 7852
   | 7855 -> 7854
   | 7857 -> 7856
   | 7859 -> 7858
   | 7861 -> 7860
   | 7863 -> 7862
   | 7865 -> 7864
   | 7867 -> 7866
   | 7869 -> 7868
   | 7871 -> 7870
   | 7873 -> 7872
   | 7875 -> 7874
   | 7877 -> 7876
   | 7879 -> 7878
   | 7881 -> 7880
   | 7883 -> 7882
   | 7885 -> 7884
   | 7887 -> 7886
   | 7889 -> 7888
   | 7891 -> 7890
   | 7893 -> 7892
   | 7895 -> 7894
   | 7897 -> 7896
   | 7899 -> 7898
   | 7901 -> 7900
   | 7903 -> 7902
   | 7905 -> 7904
   | 7907 -> 7906
   | 7909 -> 7908
   | 7911 -> 7910
   | 7913 -> 7912
   | 7915 -> 7914
   | 7917 -> 7916
   | 7919 -> 7918
   | 7921 -> 7920
   | 7923 -> 7922
   | 7925 -> 7924
   | 7927 -> 7926
   | 7929 -> 7928
   | 7936
   | 7937
   | 7938
   | 7939
   | 7940
   | 7941
   | 7942
   | 7943
       -> k + (8)
   | 7952
   | 7953
   | 7954
   | 7955
   | 7956
   | 7957
       -> k + (8)
   | 7968
   | 7969
   | 7970
   | 7971
   | 7972
   | 7973
   | 7974
   | 7975
       -> k + (8)
   | 7984
   | 7985
   | 7986
   | 7987
   | 7988
   | 7989
   | 7990
   | 7991
       -> k + (8)
   | 8000
   | 8001
   | 8002
   | 8003
   | 8004
   | 8005
       -> k + (8)
   | 8017 -> 8025
   | 8019 -> 8027
   | 8021 -> 8029
   | 8023 -> 8031
   | 8032
   | 8033
   | 8034
   | 8035
   | 8036
   | 8037
   | 8038
   | 8039
       -> k + (8)
   | 8048
   | 8049
       -> k + (74)
   | 8050
   | 8051
   | 8052
   | 8053
       -> k + (86)
   | 8054
   | 8055
       -> k + (100)
   | 8056
   | 8057
       -> k + (128)
   | 8058
   | 8059
       -> k + (112)
   | 8060
   | 8061
       -> k + (126)
   | 8064
   | 8065
   | 8066
   | 8067
   | 8068
   | 8069
   | 8070
   | 8071
       -> k + (8)
   | 8080
   | 8081
   | 8082
   | 8083
   | 8084
   | 8085
   | 8086
   | 8087
       -> k + (8)
   | 8096
   | 8097
   | 8098
   | 8099
   | 8100
   | 8101
   | 8102
   | 8103
       -> k + (8)
   | 8112
   | 8113
       -> k + (8)
   | 8115 -> 8124
   | 8126 -> 921
   | 8131 -> 8140
   | 8144
   | 8145
       -> k + (8)
   | 8160
   | 8161
       -> k + (8)
   | 8165 -> 8172
   | 8179 -> 8188
   | 8560
   | 8561
   | 8562
   | 8563
   | 8564
   | 8565
   | 8566
   | 8567
   | 8568
   | 8569
   | 8570
   | 8571
   | 8572
   | 8573
   | 8574
   | 8575
       -> k + (-16)
   | 9424
   | 9425
   | 9426
   | 9427
   | 9428
   | 9429
   | 9430
   | 9431
   | 9432
   | 9433
   | 9434
   | 9435
   | 9436
   | 9437
   | 9438
   | 9439
   | 9440
   | 9441
   | 9442
   | 9443
   | 9444
   | 9445
   | 9446
   | 9447
   | 9448
   | 9449
       -> k + (-26)
   | 65345
   | 65346
   | 65347
   | 65348
   | 65349
   | 65350
   | 65351
   | 65352
   | 65353
   | 65354
   | 65355
   | 65356
   | 65357
   | 65358
   | 65359
   | 65360
   | 65361
   | 65362
   | 65363
   | 65364
   | 65365
   | 65366
   | 65367
   | 65368
   | 65369
   | 65370
       -> k + (-32)
   | 66600
   | 66601
   | 66602
   | 66603
   | 66604
   | 66605
   | 66606
   | 66607
   | 66608
   | 66609
   | 66610
   | 66611
   | 66612
   | 66613
   | 66614
   | 66615
   | 66616
   | 66617
   | 66618
   | 66619
   | 66620
   | 66621
   | 66622
   | 66623
   | 66624
   | 66625
   | 66626
   | 66627
   | 66628
   | 66629
   | 66630
   | 66631
   | 66632
   | 66633
   | 66634
   | 66635
   | 66636
   | 66637
       -> k + (-40)
   | _ -> k;;
let to_title k =
 match k with
   | 97
   | 98
   | 99
   | 100
   | 101
   | 102
   | 103
   | 104
   | 105
   | 106
   | 107
   | 108
   | 109
   | 110
   | 111
   | 112
   | 113
   | 114
   | 115
   | 116
   | 117
   | 118
   | 119
   | 120
   | 121
   | 122
       -> k + (-32)
   | 181 -> 924
   | 224
   | 225
   | 226
   | 227
   | 228
   | 229
   | 230
   | 231
   | 232
   | 233
   | 234
   | 235
   | 236
   | 237
   | 238
   | 239
   | 240
   | 241
   | 242
   | 243
   | 244
   | 245
   | 246
       -> k + (-32)
   | 248
   | 249
   | 250
   | 251
   | 252
   | 253
   | 254
       -> k + (-32)
   | 255 -> 376
   | 257 -> 256
   | 259 -> 258
   | 261 -> 260
   | 263 -> 262
   | 265 -> 264
   | 267 -> 266
   | 269 -> 268
   | 271 -> 270
   | 273 -> 272
   | 275 -> 274
   | 277 -> 276
   | 279 -> 278
   | 281 -> 280
   | 283 -> 282
   | 285 -> 284
   | 287 -> 286
   | 289 -> 288
   | 291 -> 290
   | 293 -> 292
   | 295 -> 294
   | 297 -> 296
   | 299 -> 298
   | 301 -> 300
   | 303 -> 302
   | 305 -> 73
   | 307 -> 306
   | 309 -> 308
   | 311 -> 310
   | 314 -> 313
   | 316 -> 315
   | 318 -> 317
   | 320 -> 319
   | 322 -> 321
   | 324 -> 323
   | 326 -> 325
   | 328 -> 327
   | 331 -> 330
   | 333 -> 332
   | 335 -> 334
   | 337 -> 336
   | 339 -> 338
   | 341 -> 340
   | 343 -> 342
   | 345 -> 344
   | 347 -> 346
   | 349 -> 348
   | 351 -> 350
   | 353 -> 352
   | 355 -> 354
   | 357 -> 356
   | 359 -> 358
   | 361 -> 360
   | 363 -> 362
   | 365 -> 364
   | 367 -> 366
   | 369 -> 368
   | 371 -> 370
   | 373 -> 372
   | 375 -> 374
   | 378 -> 377
   | 380 -> 379
   | 382 -> 381
   | 383 -> 83
   | 387 -> 386
   | 389 -> 388
   | 392 -> 391
   | 396 -> 395
   | 402 -> 401
   | 405 -> 502
   | 409 -> 408
   | 414 -> 544
   | 417 -> 416
   | 419 -> 418
   | 421 -> 420
   | 424 -> 423
   | 429 -> 428
   | 432 -> 431
   | 436 -> 435
   | 438 -> 437
   | 441 -> 440
   | 445 -> 444
   | 447 -> 503
   | 452 -> 453
   | 454 -> 453
   | 455 -> 456
   | 457 -> 456
   | 458 -> 459
   | 460 -> 459
   | 462 -> 461
   | 464 -> 463
   | 466 -> 465
   | 468 -> 467
   | 470 -> 469
   | 472 -> 471
   | 474 -> 473
   | 476 -> 475
   | 477 -> 398
   | 479 -> 478
   | 481 -> 480
   | 483 -> 482
   | 485 -> 484
   | 487 -> 486
   | 489 -> 488
   | 491 -> 490
   | 493 -> 492
   | 495 -> 494
   | 497 -> 498
   | 499 -> 498
   | 501 -> 500
   | 505 -> 504
   | 507 -> 506
   | 509 -> 508
   | 511 -> 510
   | 513 -> 512
   | 515 -> 514
   | 517 -> 516
   | 519 -> 518
   | 521 -> 520
   | 523 -> 522
   | 525 -> 524
   | 527 -> 526
   | 529 -> 528
   | 531 -> 530
   | 533 -> 532
   | 535 -> 534
   | 537 -> 536
   | 539 -> 538
   | 541 -> 540
   | 543 -> 542
   | 547 -> 546
   | 549 -> 548
   | 551 -> 550
   | 553 -> 552
   | 555 -> 554
   | 557 -> 556
   | 559 -> 558
   | 561 -> 560
   | 563 -> 562
   | 595 -> 385
   | 596 -> 390
   | 598
   | 599
       -> k + (-205)
   | 601 -> 399
   | 603 -> 400
   | 608 -> 403
   | 611 -> 404
   | 616 -> 407
   | 617 -> 406
   | 623 -> 412
   | 626 -> 413
   | 629 -> 415
   | 640 -> 422
   | 643 -> 425
   | 648 -> 430
   | 650
   | 651
       -> k + (-217)
   | 658 -> 439
   | 837 -> 921
   | 940 -> 902
   | 941
   | 942
   | 943
       -> k + (-37)
   | 945
   | 946
   | 947
   | 948
   | 949
   | 950
   | 951
   | 952
   | 953
   | 954
   | 955
   | 956
   | 957
   | 958
   | 959
   | 960
   | 961
       -> k + (-32)
   | 962 -> 931
   | 963
   | 964
   | 965
   | 966
   | 967
   | 968
   | 969
   | 970
   | 971
       -> k + (-32)
   | 972 -> 908
   | 973
   | 974
       -> k + (-63)
   | 976 -> 914
   | 977 -> 920
   | 981 -> 934
   | 982 -> 928
   | 985 -> 984
   | 987 -> 986
   | 989 -> 988
   | 991 -> 990
   | 993 -> 992
   | 995 -> 994
   | 997 -> 996
   | 999 -> 998
   | 1001 -> 1000
   | 1003 -> 1002
   | 1005 -> 1004
   | 1007 -> 1006
   | 1008 -> 922
   | 1009 -> 929
   | 1010 -> 931
   | 1013 -> 917
   | 1072
   | 1073
   | 1074
   | 1075
   | 1076
   | 1077
   | 1078
   | 1079
   | 1080
   | 1081
   | 1082
   | 1083
   | 1084
   | 1085
   | 1086
   | 1087
   | 1088
   | 1089
   | 1090
   | 1091
   | 1092
   | 1093
   | 1094
   | 1095
   | 1096
   | 1097
   | 1098
   | 1099
   | 1100
   | 1101
   | 1102
   | 1103
       -> k + (-32)
   | 1104
   | 1105
   | 1106
   | 1107
   | 1108
   | 1109
   | 1110
   | 1111
   | 1112
   | 1113
   | 1114
   | 1115
   | 1116
   | 1117
   | 1118
   | 1119
       -> k + (-80)
   | 1121 -> 1120
   | 1123 -> 1122
   | 1125 -> 1124
   | 1127 -> 1126
   | 1129 -> 1128
   | 1131 -> 1130
   | 1133 -> 1132
   | 1135 -> 1134
   | 1137 -> 1136
   | 1139 -> 1138
   | 1141 -> 1140
   | 1143 -> 1142
   | 1145 -> 1144
   | 1147 -> 1146
   | 1149 -> 1148
   | 1151 -> 1150
   | 1153 -> 1152
   | 1163 -> 1162
   | 1165 -> 1164
   | 1167 -> 1166
   | 1169 -> 1168
   | 1171 -> 1170
   | 1173 -> 1172
   | 1175 -> 1174
   | 1177 -> 1176
   | 1179 -> 1178
   | 1181 -> 1180
   | 1183 -> 1182
   | 1185 -> 1184
   | 1187 -> 1186
   | 1189 -> 1188
   | 1191 -> 1190
   | 1193 -> 1192
   | 1195 -> 1194
   | 1197 -> 1196
   | 1199 -> 1198
   | 1201 -> 1200
   | 1203 -> 1202
   | 1205 -> 1204
   | 1207 -> 1206
   | 1209 -> 1208
   | 1211 -> 1210
   | 1213 -> 1212
   | 1215 -> 1214
   | 1218 -> 1217
   | 1220 -> 1219
   | 1222 -> 1221
   | 1224 -> 1223
   | 1226 -> 1225
   | 1228 -> 1227
   | 1230 -> 1229
   | 1233 -> 1232
   | 1235 -> 1234
   | 1237 -> 1236
   | 1239 -> 1238
   | 1241 -> 1240
   | 1243 -> 1242
   | 1245 -> 1244
   | 1247 -> 1246
   | 1249 -> 1248
   | 1251 -> 1250
   | 1253 -> 1252
   | 1255 -> 1254
   | 1257 -> 1256
   | 1259 -> 1258
   | 1261 -> 1260
   | 1263 -> 1262
   | 1265 -> 1264
   | 1267 -> 1266
   | 1269 -> 1268
   | 1273 -> 1272
   | 1281 -> 1280
   | 1283 -> 1282
   | 1285 -> 1284
   | 1287 -> 1286
   | 1289 -> 1288
   | 1291 -> 1290
   | 1293 -> 1292
   | 1295 -> 1294
   | 1377
   | 1378
   | 1379
   | 1380
   | 1381
   | 1382
   | 1383
   | 1384
   | 1385
   | 1386
   | 1387
   | 1388
   | 1389
   | 1390
   | 1391
   | 1392
   | 1393
   | 1394
   | 1395
   | 1396
   | 1397
   | 1398
   | 1399
   | 1400
   | 1401
   | 1402
   | 1403
   | 1404
   | 1405
   | 1406
   | 1407
   | 1408
   | 1409
   | 1410
   | 1411
   | 1412
   | 1413
   | 1414
       -> k + (-48)
   | 7681 -> 7680
   | 7683 -> 7682
   | 7685 -> 7684
   | 7687 -> 7686
   | 7689 -> 7688
   | 7691 -> 7690
   | 7693 -> 7692
   | 7695 -> 7694
   | 7697 -> 7696
   | 7699 -> 7698
   | 7701 -> 7700
   | 7703 -> 7702
   | 7705 -> 7704
   | 7707 -> 7706
   | 7709 -> 7708
   | 7711 -> 7710
   | 7713 -> 7712
   | 7715 -> 7714
   | 7717 -> 7716
   | 7719 -> 7718
   | 7721 -> 7720
   | 7723 -> 7722
   | 7725 -> 7724
   | 7727 -> 7726
   | 7729 -> 7728
   | 7731 -> 7730
   | 7733 -> 7732
   | 7735 -> 7734
   | 7737 -> 7736
   | 7739 -> 7738
   | 7741 -> 7740
   | 7743 -> 7742
   | 7745 -> 7744
   | 7747 -> 7746
   | 7749 -> 7748
   | 7751 -> 7750
   | 7753 -> 7752
   | 7755 -> 7754
   | 7757 -> 7756
   | 7759 -> 7758
   | 7761 -> 7760
   | 7763 -> 7762
   | 7765 -> 7764
   | 7767 -> 7766
   | 7769 -> 7768
   | 7771 -> 7770
   | 7773 -> 7772
   | 7775 -> 7774
   | 7777 -> 7776
   | 7779 -> 7778
   | 7781 -> 7780
   | 7783 -> 7782
   | 7785 -> 7784
   | 7787 -> 7786
   | 7789 -> 7788
   | 7791 -> 7790
   | 7793 -> 7792
   | 7795 -> 7794
   | 7797 -> 7796
   | 7799 -> 7798
   | 7801 -> 7800
   | 7803 -> 7802
   | 7805 -> 7804
   | 7807 -> 7806
   | 7809 -> 7808
   | 7811 -> 7810
   | 7813 -> 7812
   | 7815 -> 7814
   | 7817 -> 7816
   | 7819 -> 7818
   | 7821 -> 7820
   | 7823 -> 7822
   | 7825 -> 7824
   | 7827 -> 7826
   | 7829 -> 7828
   | 7835 -> 7776
   | 7841 -> 7840
   | 7843 -> 7842
   | 7845 -> 7844
   | 7847 -> 7846
   | 7849 -> 7848
   | 7851 -> 7850
   | 7853 -> 7852
   | 7855 -> 7854
   | 7857 -> 7856
   | 7859 -> 7858
   | 7861 -> 7860
   | 7863 -> 7862
   | 7865 -> 7864
   | 7867 -> 7866
   | 7869 -> 7868
   | 7871 -> 7870
   | 7873 -> 7872
   | 7875 -> 7874
   | 7877 -> 7876
   | 7879 -> 7878
   | 7881 -> 7880
   | 7883 -> 7882
   | 7885 -> 7884
   | 7887 -> 7886
   | 7889 -> 7888
   | 7891 -> 7890
   | 7893 -> 7892
   | 7895 -> 7894
   | 7897 -> 7896
   | 7899 -> 7898
   | 7901 -> 7900
   | 7903 -> 7902
   | 7905 -> 7904
   | 7907 -> 7906
   | 7909 -> 7908
   | 7911 -> 7910
   | 7913 -> 7912
   | 7915 -> 7914
   | 7917 -> 7916
   | 7919 -> 7918
   | 7921 -> 7920
   | 7923 -> 7922
   | 7925 -> 7924
   | 7927 -> 7926
   | 7929 -> 7928
   | 7936
   | 7937
   | 7938
   | 7939
   | 7940
   | 7941
   | 7942
   | 7943
       -> k + (8)
   | 7952
   | 7953
   | 7954
   | 7955
   | 7956
   | 7957
       -> k + (8)
   | 7968
   | 7969
   | 7970
   | 7971
   | 7972
   | 7973
   | 7974
   | 7975
       -> k + (8)
   | 7984
   | 7985
   | 7986
   | 7987
   | 7988
   | 7989
   | 7990
   | 7991
       -> k + (8)
   | 8000
   | 8001
   | 8002
   | 8003
   | 8004
   | 8005
       -> k + (8)
   | 8017 -> 8025
   | 8019 -> 8027
   | 8021 -> 8029
   | 8023 -> 8031
   | 8032
   | 8033
   | 8034
   | 8035
   | 8036
   | 8037
   | 8038
   | 8039
       -> k + (8)
   | 8048
   | 8049
       -> k + (74)
   | 8050
   | 8051
   | 8052
   | 8053
       -> k + (86)
   | 8054
   | 8055
       -> k + (100)
   | 8056
   | 8057
       -> k + (128)
   | 8058
   | 8059
       -> k + (112)
   | 8060
   | 8061
       -> k + (126)
   | 8064
   | 8065
   | 8066
   | 8067
   | 8068
   | 8069
   | 8070
   | 8071
       -> k + (8)
   | 8080
   | 8081
   | 8082
   | 8083
   | 8084
   | 8085
   | 8086
   | 8087
       -> k + (8)
   | 8096
   | 8097
   | 8098
   | 8099
   | 8100
   | 8101
   | 8102
   | 8103
       -> k + (8)
   | 8112
   | 8113
       -> k + (8)
   | 8115 -> 8124
   | 8126 -> 921
   | 8131 -> 8140
   | 8144
   | 8145
       -> k + (8)
   | 8160
   | 8161
       -> k + (8)
   | 8165 -> 8172
   | 8179 -> 8188
   | 8560
   | 8561
   | 8562
   | 8563
   | 8564
   | 8565
   | 8566
   | 8567
   | 8568
   | 8569
   | 8570
   | 8571
   | 8572
   | 8573
   | 8574
   | 8575
       -> k + (-16)
   | 9424
   | 9425
   | 9426
   | 9427
   | 9428
   | 9429
   | 9430
   | 9431
   | 9432
   | 9433
   | 9434
   | 9435
   | 9436
   | 9437
   | 9438
   | 9439
   | 9440
   | 9441
   | 9442
   | 9443
   | 9444
   | 9445
   | 9446
   | 9447
   | 9448
   | 9449
       -> k + (-26)
   | 65345
   | 65346
   | 65347
   | 65348
   | 65349
   | 65350
   | 65351
   | 65352
   | 65353
   | 65354
   | 65355
   | 65356
   | 65357
   | 65358
   | 65359
   | 65360
   | 65361
   | 65362
   | 65363
   | 65364
   | 65365
   | 65366
   | 65367
   | 65368
   | 65369
   | 65370
       -> k + (-32)
   | 66600
   | 66601
   | 66602
   | 66603
   | 66604
   | 66605
   | 66606
   | 66607
   | 66608
   | 66609
   | 66610
   | 66611
   | 66612
   | 66613
   | 66614
   | 66615
   | 66616
   | 66617
   | 66618
   | 66619
   | 66620
   | 66621
   | 66622
   | 66623
   | 66624
   | 66625
   | 66626
   | 66627
   | 66628
   | 66629
   | 66630
   | 66631
   | 66632
   | 66633
   | 66634
   | 66635
   | 66636
   | 66637
       -> k + (-40)
   | _ -> k;;
