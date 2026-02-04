■◆■触手宮(Ver1.12.0)用敵追加+バグ修正パッチ■◆■
Author : よば　2020/5/4
Contact: 触手宮スレに書き込んでくれたら反応します
-------------------------------------------------------------

□動作確認対象
東方触手宮Ver1.12.0

□導入方法
ERBフォルダを触手宮Ver1.12.0のERBフォルダに追加してください。

□らいせんす
もとの東方触手宮と同様です。つまりは修正・二次配布ok

□どんなパッチ？
・触手の種類の上限を100から1000にした。
・りばーすから8体触手をコピペした。
・バグをいろいろ修正した（内容は→□ERB差分）。
オリジナルのシチュがあったりとかはしない、地味～なパッチです...

□システム上の変更点
FLAG:701~850とGLOBAL:100~250をユーザー変数（アイテム画面\図鑑\WIKI.ERHのENEMY_WIKI_REGISTERED、ENEMY_WIKI_REGISTERED_GLOBAL）に移設したので、基本的にはこれらを使わなくなってます。
ただし、これらについては、MIGRATE_ENEMY_WIKI_DATA関数とMIGRATE_ENEMY_WIKI_DATA_FROMFLAG（ERB\アイテム画面\図鑑\SHOW_ENEMY_WIKI.ERB）にてデータの互換をするのにだけ使用しています。
新規変数はアイテム画面\図鑑\WIKI.ERHのENEMY_WIKI_REGISTERED、ENEMY_WIKI_REGISTERED_GLOBALです。

□ERB差分
●各種バグ対策
・ターン終了時の敵スポーンがランクに関係なく行われてた（例えば、ランク1の出現条件を満たしたときにランク6でも出現可能になっていた）のを修正
M ENDPHASE/REPOP.ERB
→REPOP_SELECT関数にてわきフラグによる条件を追加

・気配察知Lv2以上でも敵がいる隣接部屋の文字色が赤くならない場合があるのを修正
M メインメニュー（SHOP）/PRINT_MAP_INFO.ERB
→罠系触手が出たら「敵存在判定打ち切り」から「無視」に変更

・キャラIDが100以上の少女がペットに下剋上する、または回復してもらうと落ちるのを修正
M メインメニュー（SHOP）/メインメニューコマンド/ペットパッチ/CONTRACT_PET.ERB
→101行目のDAデータ番号を少女から0（ペット）へ
M メインメニュー（SHOP）/メインメニューコマンド/ペットパッチ/PET_BATTLE.ERB
→&&の向きを変更。「対象が敵かつ死亡時」の順に

・「ペットの栄養を使って回復」にて主人公以外を選択できないのを修正、および一部関数化
M メインメニュー（SHOP）/メインメニューコマンド/ペットパッチ/PET_EXP_SHOP.ERB
M メインメニュー（SHOP）/メインメニューコマンド/ペットパッチ/PET_RAPE.ERB
M アイテム画面/SHOW_HEAL_ITEM_LIST.ERB
M 関数フォルダ/COMMON.ERB
→対象の少女を選択する処理を作り直し、関数フォルダ\COMMON.ERBのSELECT_PT_TARGET2関数に移設・統一
　ついでにアイテム画面/SHOW_HEAL_ITEM_LIST.ERB内の同一処理もこれを呼び出すようにした

・初期設定のふたなり設定の表示が崩れるのを修正
M 初期設定/SET_CONFIGURE_FIRST.ERB
→PRINTFORMからPRINTFORMLへ

・DELETE_ENEMYで削除する敵のIDがおかしいのを修正（そうそう問題は起きないけど）
M ENEMY/DELETE_ENEMY.ERB
→55行目、(FLAG:1)-1が末尾になる。まあCRATE_ENEMYでリセットするからどうでもいいけど

・アクティニアがスライムに進化したりしなかったりするので、「進化しない」に統一（元のが仕様通りだったらごめんなさい）
M ENEMY/敵詳細データ/ENEMY_12_アクティニア.ERB


●敵の種類100オーバーに対応
・101番以上の敵も出るように
M ENDPHASE/REPOP.ERB
M 関数フォルダ/COMMON.ERB　UNIQUE_RANDOM関数

・エネミー図鑑やフィルタの1000種類対応
+ アイテム画面/図鑑/WIKI.ERH
M アイテム画面/図鑑/SHOW_ENEMY_WIKI.ERB
M EVENTLOAD.ERB
M 初期設定/EVENTFIRST.ERB
M BATTLE/PRE_BATTLE.ERB
M ENDPHASE/PREDATION.ERB
M ENDPHASE/REPOP.ERB
M ENEMY/ENEMY_COMMON.ERB
M ENEMY/敵詳細データ/ENEMY_17_シェイプシフター.ERB
M メインメニュー（SHOP）/メインメニューコマンド/DEBUG_COMMAND.ERB
M メインメニュー（SHOP）/メインメニューコマンド/ENEMY_FILTER.ERB
M メインメニュー（SHOP）/メインメニューコマンド/SET_CONFIGURE.ERB
→敵の遭遇済み＋フィルタフラグをFLAG、GLOBALからユーザー（#DIM）変数ENEMY_WIKI_REGISTERED、ENEMY_WIKI_REGISTERED_GLOBALへ変更。処理の関数化。
　敵のリスト表示をDEBUG_OUTPUT_ENEMY_LIST関数（メインメニュー（SHOP）\メインメニューコマンド\DEBUG_COMMAND.ERB）へ統一、敵の最大値を関数化。


●りばーすからの敵移植
・敵の追加
+ ENEMY/敵詳細データ/ENEMY_96_スターカラーズ.ERB
+ ENEMY/敵詳細データ/ENEMY_151_ドリームルージュ.ERB
+ ENEMY/敵詳細データ/ENEMY_152_アメフラシ.ERB
+ ENEMY/敵詳細データ/ENEMY_153_ハニービー.ERB
+ ENEMY/敵詳細データ/ENEMY_154_ラーヴァバグズ.ERB
+ ENEMY/敵詳細データ/ENEMY_155_スカルサーペント.ERB
+ ENEMY/敵詳細データ/ENEMY_156_デルタスラッグ.ERB
+ ENEMY/敵詳細データ/ENEMY_157_ミルキーシェルター.ERB
+ メインメニュー（SHOP）/メインメニューコマンド/ペットパッチ/ペットのデータ定義/PET_96_スターカラーズ.ERB
+ メインメニュー（SHOP）/メインメニューコマンド/ペットパッチ/ペットのデータ定義/PET_151_ドリームルージュ.ERB
+ メインメニュー（SHOP）/メインメニューコマンド/ペットパッチ/ペットのデータ定義/PET_152_アメフラシ.ERB
+ メインメニュー（SHOP）/メインメニューコマンド/ペットパッチ/ペットのデータ定義/PET_153_ハニービー.ERB
+ メインメニュー（SHOP）/メインメニューコマンド/ペットパッチ/ペットのデータ定義/PET_154_ラーヴァバグズ.ERB
+ メインメニュー（SHOP）/メインメニューコマンド/ペットパッチ/ペットのデータ定義/PET_155_スカルサーペント.ERB
+ メインメニュー（SHOP）/メインメニューコマンド/ペットパッチ/ペットのデータ定義/PET_156_デルタスラッグ.ERB
+ メインメニュー（SHOP）/メインメニューコマンド/ペットパッチ/ペットのデータ定義/PET_157_ミルキーシェルター.ERB
M ENEMY/ENEMY_NAME.ERB
M メッセージ・口上関連/各種地の文章/SYSTEM_MESSAGE_511_エネミー図鑑.ERB

・移植敵分の技追加
+ BATTLE/敵側行動定義/EXTRA_ACTION_1319.ERB
+ BATTLE/敵側行動定義/EXTRA_ACTION_1323.ERB
+ BATTLE/敵側行動定義/EXTRA_ACTION_1324.ERB
+ BATTLE/敵側行動定義/EXTRA_ACTION_1325.ERB
+ BATTLE/敵側行動定義/EXTRA_ACTION_1326.ERB
+ BATTLE/敵側行動定義/EXTRA_ACTION_1327.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2104.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2105.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2120.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2121.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2206.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2207.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2218.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2219.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2220.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2221.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2318.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2503.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2504.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2506.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2512.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2513.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2602.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2603.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2604.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2605.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2606.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2623.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2626.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2628.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2629.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2802.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2803.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2951.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2952.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2953.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2954.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2955.ERB
+ BATTLE/敵側行動定義/FIX_ENEMY_ACTION_2956.ERB
M メッセージ・口上関連/各種地の文章/SYSTEM_MESSAGE_2_敵通常攻撃発動時.ERB
M メッセージ・口上関連/各種地の文章/SYSTEM_MESSAGE_3_敵衣服攻撃発動時.ERB
M メッセージ・口上関連/各種地の文章/SYSTEM_MESSAGE_4_敵性攻撃発動時.ERB
M メッセージ・口上関連/各種地の文章/SYSTEM_MESSAGE_5_敵拘束攻撃発動時.ERB
M メッセージ・口上関連/各種地の文章/SYSTEM_MESSAGE_6_敵寄生攻撃発動時.ERB
M メッセージ・口上関連/各種地の文章/SYSTEM_MESSAGE_7_敵特殊攻撃発動時.ERB
M メッセージ・口上関連/各種地の文章/SYSTEM_MESSAGE_12_敵通常攻撃命中時.ERB
M メッセージ・口上関連/各種地の文章/SYSTEM_MESSAGE_13_敵衣服攻撃命中時.ERB
M メッセージ・口上関連/各種地の文章/SYSTEM_MESSAGE_14_敵性攻撃命中時.ERB
M メッセージ・口上関連/各種地の文章/SYSTEM_MESSAGE_15_敵拘束攻撃命中時.ERB
M メッセージ・口上関連/各種地の文章/SYSTEM_MESSAGE_16_敵寄生攻撃命中時.ERB
M メッセージ・口上関連/各種地の文章/SYSTEM_MESSAGE_17_敵特殊攻撃命中時.ERB
M メッセージ・口上関連/各種地の文章/SYSTEM_MESSAGE_27_敵特殊攻撃回避時.ERB

・ミルキーシェルターの特殊攻撃2951による催眠行動処理
+ BATTLE/味方側行動定義/FIX_PT_ACTION_79_空腹奉仕.ERB
M BATTLE/戦闘関数/SKILLNAME.ERB
M ステータス画面/SHOW_STATUS.ERB
M メッセージ・口上関連/各種地の文章/PRINT_MESSAGE_HEADLINE.ERB
M メッセージ・口上関連/各種地の文章/SYSTEM_MESSAGE_1_味方攻撃発動時.ERB
