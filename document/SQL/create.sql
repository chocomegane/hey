--drop table admin_users;
--drop table cinemas;
--drop table order_items cascade;
--drop table orders cascade;
--drop table users;

--管理者のテーブル
create table admin_users (
  id bigserial not null
  , name text not null
  , email text not null
  , password text not null
  , constraint admin_users_PKC primary key (id)
) ;

-- 管理者の登録
-- password: admin
insert into admin_users (name,email,password) values (
  'admin',
  'admin@rakus.co.jp',
  '$2a$10$55NBCcBIG7iB6R1Xo/uLBexr2ht1.LM9nIkiQ2wPY8LbORkoPooA6'
);

create table cinemas (
	id bigserial not null,
	title text not null,
	price integer not null,
	genre text not null,
	time integer not null,
	release_date timestamp not null,
	media_type text not null,
	company text not null,
	directed_by text not null,
	rating text not null,
	description text not null,
	image_path text not null,
	deleted boolean default false not null,
	constraint cinemas_PKC primary key (id)
);

--cinemasテーブルに追加する素材
INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES( 'CHAPPIE/チャッピー', 1600, 'SF', 120, '2015-09-18 00:00:00', 'DVD', 'ソニー・ピクチャーズエンタテインメント', ' ニール・ブロムカンプ', '12歳以上対象','『第９地区』監督の原点回帰的最新作！圧倒的リアリティと衝撃の結末を体感せよ！
２０１６年―犯罪多発地区、南アフリカ　ヨハネスブルグに世界で唯一の“感じ、考え、成長する”AI（人工知能）を搭載したロボットが誕生。
彼の名はチャッピー。
起動したばかりのチャッピーは真っ新でまるで子供のようだが、彼の余命はたった5日間しかない。ギャングにさらわれたチャッピーは、ギャング式の生きる術を覚え加速度的に成長する。
ただ「生きたい」と願うチャッピーの人知を超えた行動に、我々は衝撃の結末を目撃する。', 'chappie.jpg', false);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES( 'スター・ウォーズ/フォースの覚醒 ', 3100, 'SF', 136, '2016-05-04 00:00:00', 'DVD', 'ウォルト・ディズニー・ジャパン株式会社', 'J.J.エイブラムス', '全年齢対象','砂漠の惑星で家族を待ち続けている孤独な女性レイは、謎のドロイドBB-8とストームトルーパーの脱走兵フィンと出会い運命が一変する。
一方、十字型のライトセーバーを操るカイロ・レンに率いられた帝国軍の残党であるファースト・オーダーは、消えたとされる最後のジェダイ、ルーク・スカイウォーカーの行方を追っていた。銀河に新たな脅威が迫る中、レイたちはハン・ソロとチューバッカに出会う。', 'starwars.jpg', false);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES( 'ジュラシック・ワールド ', 2000, 'SF', 124, '2016-02-24 00:00:00', 'DVD', 'NBCユニバーサル・エンターテイメントジャパン', 'コリン・トレボロウ', '全年齢対象','人気SFアクション「ジュラシック・パーク」シリーズ第4弾。恐竜と触れ合える高級リゾート、ジュラシック・ワールドで働くクレアを訪ねて来た甥っ子・ザックとグレイ。だが、凶暴な恐竜が施設から逃亡し…。', 'jurassicworld.jpg', false);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES( 'オデッセイ', 3100, 'SF', 142, '2016-06-03 00:00:00', 'DVD', '20世紀フォックス・ホーム・エンターテイメント・ジャパン', 'リドリー・スコット', '全年齢対象','『プロメテウス』のリドリー・スコット監督が描く奇跡のSFサバイバル超大作! 

70億人が、彼の還りを待っている。', 'odessei.jpg', false);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('呪怨2', 2000, 'ホラー', 76, '2014-10-10 00:00:00', 'DVD', '東映株式会社', '清水崇', '15歳以上対象', 'かつて夫に妻・伽椰子が惨殺されたり、そこに住んだ人々に次々と不幸が起きた家。その噂をききつけたテレビクルーが、この“幽霊屋敷”にホラーの女王と呼ばれる女優・京子を連れて取材へ。そんなクルーたちにさまざまな呪いがふりかかっていく……。', 'juon2.jpg', false);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('呪怨', 2000, 'ホラー', 70, '2014-10-10 00:00:00', 'DVD', '東映株式会社', '清水崇', '15歳以上対象', 'かつてない角度から生み落とされたJホラーの先駆け

「呪怨」とは、つよい怨みを抱いて死んだモノの呪い…呪われた家から溢れ出す、九の連続した死。「リング」シリーズの高橋洋(監修)が、清水崇監督とともに贈る究極の恐怖体験! 。', 'juon.jpg', false);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('ゴーストバスターズ 1&2パック', 2300, 'ホラー', 213, '2014-12-03 00:00:00', 'DVD', 'ソニー・ピクチャーズエンタテインメント', 'アイバン・ライトマン', '全年齢対象', 'ニューヨークにはゴーストがいっぱい。
危機に立ち向かえるのは彼らしかいない! 
ピーター、レイモンド、イーガンの科学者3人組が結成したオバケ撃退部隊“ゴーストバスターズ。', 'goastbasters.jpg', false);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('シャイニング', 1200, 'ホラー', 119, '2010-04-21 00:00:00', 'DVD', 'ワーナー・ホーム・ビデオ', 'スタンリー・キューブリック', '12年齢対象', 'スティーブン・キングの原作小説を基に、監督スタンリー・キューブリック自らが共同脚色を手がけた、ホラー映画の金字塔。鮮やかな演技、戦慄の設定、そしてトラッキング・ショットによる幻想的な映像を融合し、かつてない恐怖の世界を描き出す。ジャック・ニコルソン(「お客様だよ!」の台詞はあまりにも有名)演じるジャック・トランスは、妻(シェリー・デュバル)と息子(ダニー・ロイド)と共に優雅なオーバールック・ホテルを冬季管理人として訪れたことから物語は始まる。トランスはこのホテルを訪れたことはないはずなのだが ― 果たして?その答えは、狂気と殺戮が渦巻くこの場所にある。', 'shining.jpg', false);
INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('インサイドヘッド', 3100, 'ファンタジー', 95, '2015-11-18 00:00:00', 'DVD', 'ピクサー', 'ピートドクター', '全年齢対象', 'もっと自分が好きになる―
ディズニー/ピクサー待望の最新作。感動と驚きの冒険ファンタジー! 
はじめまして。
私たち、あなたの中の<きもち>です。', 'insidehead.jpg', false);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('映画 妖怪ウォッチ エンマ大王と5つの物語だニャン!', 1900, 'ファンタジー', 94, '2016-07-06 00:00:00', 'DVD', 'KADOKAWA メディアファクトリー', '髙橋滋春, ウシロシンジ', '全年齢対象', '驚きと興奮! 超てんこもりの大冒険! 楽しさ鬼盛りの5つの奇跡! ! 
「映画 妖怪ウォッチ」第2弾がリリース! 待たせたニャン! ! 

妖怪旋風再び! 2014年、日本中を熱狂させた妖怪たちが再びスクリーンに帰ってきた! ! 
超妖怪級大ヒットムービー「映画 妖怪ウォッチ」第2弾がいよいよDVD&ブルーレイでリリース! ', 'youkaienma.jpg', false);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('映画ドラえもん 新・のび太の日本誕生 ', 1900, 'ファンタジー', 104, '2016-08-10 00:00:00', 'DVD', 'ポニーキャニオン', '八鍬新之介', '全年齢対象', '「決心したぞ! 僕は家出する! ! 」家でも学校でも叱られてばかりののび太は、家出をしようと思い立つが、どこに行っても持ち主のいない土地はないことを知る。
そして、ドラえもん、しずか、ジャイアン、スネ夫もそれぞれの理由で家出を決心。みんなで行くところがなく途方に暮れていた。
それならばいっそのことまだ誰も住んでいない原始時代の日本へ行こうと思い立ち、史上最大の家出へと出発することに。たどり着いたのは7万年前の日本。
自分たちだけのパラダイスを作り、たっぷり遊んだのび太たちは、いったん家に帰ることにしたが、なぜか現代で原始人のククルと出会う。どうやら時空乱流に巻き込まれて現代に来てしまったらしい。
そして、ククルの家族がいるヒカリ族は、精霊王ギガゾンビとクラヤミ族に襲われたという…。
ククルとともに原始時代に戻った5人は、ヒカリ族を救うため立ち上がる! 

史上最大の家出から、史上最大の冒険が始まる! ! ', 'doraemonnobita.jpg', false);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('映画 クレヨンしんちゃん　ヘンダーランドの大冒険', 1300, 'ファンタジー', 100, '2016-11-26 00:00:00', 'DVD', 'バンダイビジュアル', '本郷みつる, ウシロシンジ', '全年齢対象', '２０周年記念スペシャルプライス!!「映画クレヨンしんちゃん」シリーズ１６作品を一挙リリース!!
第４作目は、オラが地球のピンチをお助けするゾ！！
ナンカヘンダー、ヘンダーランド！　ウソだと思うなら、チョイとおいで～', 'kureyonsintyanhenda.jpg', false);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('サイクロンZ', 1391, 'アクション', 94, '2011-12-09 00:00:00', 'DVD', 'パラマウントホームエンタテイメントジャパン', 'ジャッキーチェン', '全年齢対象', 'ジャッキー・チェン、サモ・ハン・キンポー、ユン・ピョウの3大スターが再集結したアクションコメディ。熱血弁護士が工場の汚染問題をきっかけに麻薬組織とバトルを繰り広げる香港映画のエネルギーみなぎる傑作。“ハッピー・ザ・ベスト!”。', 'saikuronz.jpg', false);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('ヒットマン:エージェント47 2枚組ブルーレイ&DVD(初回生産限定) ', 3100, 'アクション', 97, '2016-09-02 00:00:00', 'DVD', '20世紀フォックス・ホーム・エンターテイメント・ジャパン', 'アレクサンデル・バッハ', '12歳以上対象', 'DNA操作により作り上げられた最高の暗殺者エージェント47。感情も恐怖もなく、与えられたミッションを完璧に遂行するエリート暗殺者。そんな彼の新たな任務が、48時間以内に邪魔者を消し、カティアという名の女性を見つけること。時を同じくして、シンジケート社もまた、彼女を捜し出そうとドイツにひとりの男を送り込む。男はカティアを見つけ出し、「47が君を殺しに来る。助けられるのは僕だけだ」と告げるが、そこに銃を手にした47が現れ、壮絶で華麗なバトルが幕を開ける。訳も分からず危険へと巻き込まれていくカティア、執拗なまでに彼女を追い続ける男と47――ふたりは彼女の敵なのか、味方なのか? 彼らの狙いは何なのか? そして、彼女は一体何者なのか……?', 'hittoman.jpg', false);


INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES( 'バットマン vs スーパーマン ジャスティスの誕生', 3200, 'SF', 151, '2016-08-10 00:00:00', 'DVD', 'ワーナー・ブラザース・ホームエンターテイメント', 'リドリー・スコット', '全年齢対象','世紀の対決。
スーパーマンが悪に染まる

スーパーヒーロー映画の歴代No.1(全世界オープニング3日間)
世界的人気を誇る2大スーパーヒーローが激突! 
超人的な力で地球を救ってきたスーパーマン。
しかし皮肉にも人類の平和を守るために、街に甚大な被害を出してしまい、いつしか"正義の味方"から"人類の脅威"となっていく―。
そんな中、闇夜で正義を果たしてきたバットマンが、人類の希望を背負い、戦いの表舞台へ立つことになる。
この世紀の戦いに、勝つのはどっちだ―。

新バットマンはベン・アフレック、スーパーマンは『マン・オブ・スティール』に続きヘンリー・カビルが務める。
スーパーマンの宿敵レックス・ルーサー役はジェシー・アイゼンバーグが怪演する。
ワンダーウーマンは「ワイルド・スピード」シリーズのガル・ガドット。
監督は鬼才ザック・スナイダー。製作総指揮は巨匠クリストファー・ノーラン。', 'badmansuperman.jpg', false);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('ミッション:インポッシブル/ローグ・ネイション', 1300, 'アクション', 94, '2016-06-03 00:00:00', 'DVD', 'パラマウント', 'クリストファー・マッカリー', '全年齢対象', 'トム・クルーズ主演によるスパイアクションシリーズ第5弾。IMFのエージェント、イーサン・ハントは多国籍スパイ組織・シンジケートを追っていたが、捕らえられてしまう。拷問が始まろうとしたその時、謎の女に助けられ…。“ハッピー・ザ・ベスト!”。', 'missionroag.jpg', false);


INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('劇場版「進撃の巨人」前編～紅蓮の弓矢～', 4104, 'アニメ', 120, '2015-03-18 00:00:00', 'DVD', 'ポニーキャニオン', '荒木哲郎', '全年齢対象', '世界が震撼したあの衝撃をスクリーンで体感せよ！！コミックス累計発行部数4,200万部を誇る大ヒット漫画「進撃の巨人」のTVアニメを再構築した劇場版のDVDが登場！', '7156PuyIKXL._SL1134_.jpg', FALSE);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('劇場版「進撃の巨人」後編～自由の翼～', 4104, 'アニメ', 120, '2015-12-16 00:00:00', 'DVD', 'ポニーキャニオン', '荒木哲郎', '全年齢対象', '世界が震撼したあの衝撃をスクリーンで体感せよ！！コミックス累計発行部数4,200万部を誇る大ヒット漫画「進撃の巨人」のTVアニメを再構築した劇場版のDVDが登場！', '71KTqXUk79L._SL1000_.jpg', FALSE);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('コマンドー(ディレクターズ・カット)', 1533, 'アクション', 120, '2016-03-03 00:00:00', 'DVD', '20世紀フォックス・ホーム・エンターテイメント・ジャパン', 'マーク・L・レスター', '全年齢対象', '衝撃シーンが追加された<ディレクターズ・カット>&ファン待望の日本語吹替収録版! 映画の言葉 「とんでもねぇ、待ってたんだ」', '51aqGX8+AwL.jpg', FALSE);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('劇場版「空の境界」俯瞰風景3D', 5400, 'アニメ', 49, '2016-03-03 00:00:00', 'DVD', 'アニプレックス', 'あおきえい', '全年齢対象', '「行こう、行こう、行こう、行こう――」私はただ望んだだけ。この窓の外の世界を。彼に連れて行ってほしかっただけ。', '71nIVJHO1JL._SL1500_.jpg', FALSE);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('劇場版 魔法少女まどか☆マギカ[前編]はじまりの物語/[後編]永遠の物語【完全生産限定版】', 11000, 'アニメ', 239, '2013-07-24 00:00:00', 'DVD', 'アニプレックス', '宮本幸祐、新房昭之', '全年齢対象', 'それは、まだ誰も見たことのない、魔法少女の物語。', '6134GJaz44L._SL1378_.jpg', FALSE);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('ヒトラー～最後の12日間', 1135, '戦争ドラマ', 155, '2015-07-02 00:00:00', 'DVD', 'ギャガ', 'オリヴァー・ヒルシュビーゲル', '全年齢対象', 'ヒトラー最期の12日間を、秘書、ユンゲが敗戦後はじめてあからさまに告白した実話。', '812gwliAX0L._SL1441_.jpg', FALSE);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('DEATH NOTE デスノート', 3378, 'サスペンス', 126, '2007-03-14 00:00:00', 'DVD', 'バップ', '金子修介', '全年齢対象', '頭脳戦を制するものが、新世界を制す。
退屈な死神が人間界にノートを落とし、退屈な天才がそのノートを拾った。<このノートに名前を書かれた人間は死ぬ。>', '21fCgzaArIL.jpg', FALSE);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('トランスフォーマー/ロストエイジ', 1419, 'アクション', 165, '2015-06-10 00:00:00', 'DVD', 'パラマウント ホーム エンタテイメント ジャパン', 'マイケル・ベイ', '全年齢対象', '元オートボット司令官センチネル・プライムとディセプティコン破壊大帝メガトロンが引き起こしたシカゴの惨劇から5年。結果的にオートボットの協力によって地球が守られた事実をもって地球人の彼らに対する認識は変化しつつあるがオートボット否定派による迫害も激しくなっており、オートボット達は姿を消していた。テキサス州でしがない廃品回収業を営む発明家ケイド・イェーガーは仕事で赴いた映画館の中で眠っていたトレーラートラックを見つけ、それを自宅に持ち帰る。さっそくケイドはそのトラックを解体しようとした所、それがトランスフォーマーである事を知る。', '91p585IRC8L._SL1500_.jpg', FALSE);


--INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
--VALUES('女幽霊', 2000, 'ホラー', 72, '2014-08-01 00:00:00', 'DVD', '株式会社オールイン　エンタテインメント', '江尻大', '全年齢対象', 'そのフィルムを観てはいけない
--1本の古びた35㎜フィルムをきっかけに、映画を撮影した関係者が次々と姿を消していく! ! 
--40年前、ピンク映画の撮影事故から続く負の螺旋。 渦中に立たされた雪子の命運はいったい・・・。
 
--女優の霊が出ると噂の閉館した映画館。映画研究サークルの雪子は、心霊動画を撮る為、篠田、今村と共に深夜の廃映画館へと向かう。そこで雪子が古びたフィルムを目にした事から、身の周りで奇妙な事が相次いで起こり始める。遂には篠田が謎の行方不明になり、恐怖に慄きながらも事件の真相を探る為、雪子は再びあの映画館へと向かうのであった・・・。', '女幽霊.jpg', FALSE);

INSERT INTO cinemas( title, price, genre, time, release_date, media_type, company, directed_by, rating, description, image_path, deleted)
VALUES('うさぎドロップ', 2850, '日常', 114, '2012-02-02 00:00:00', 'DVD', 'Happinet', 'SABU', '全年齢対象', '6歳の女の子と独身男が突然、親子に!?
一生懸命な二人とたくさんの愛情を描いた、最高にキュートな感動作!

宇仁田ゆみの代表作『うさぎドロップ』を海外でも評価の高いSABU監督が映画化!松山ケンイチ×香里奈×芦田愛菜 豪華共演で贈る、とびきりハートウォーミングな物語。

ちょっと不器用、でも誠実で正義感たっぷりなイクメン、ダイキチを演じるのは、次々と主演作が公開され、2012年のNHK大河ドラマ「平清盛」での主演も決定している松山ケンイチ。
息子を一人で育てるシングルマザー、二谷ゆかり役には、モデル、女優と幅広く活躍する香里奈が扮する。
そして、天才子役として大ブレイクした“小さな大女優”芦田愛菜がりんを演じる。
さらに、桐谷美玲、キタキマユ、佐藤瑠生亮、綾野剛、木村了、高畑淳子、そして、池脇千鶴、風吹ジュン、中村梅雀ら実力派の面々豪華に結集し、二人を優しく包み、物語を盛り立てる。

2011年7月7日からは、ノイタミナ(CX)枠でアニメ『うさぎドロップ』が放映開始。異例のアニメ&映画同時主題歌として、PUFFYが楽曲「SWEET DROPS」を提供してくれ、映画とアニメの架け橋に。原作、アニメ、映画とメディアミックスで『うさぎドロップ』旋風が巻き起こる!

【ストーリー】
27歳、彼女なし。ごくフツーのサラリーマンであるダイキチが、祖父のお葬式で出会った孤独で悲しげな女の子は、おじいちゃんの隠し子だった!?引き取り手のないその少女・りんを男気を見せて連れ帰ったダイキチ。こうして、突然、二人の共同生活が始まった!
慣れない子育てにあたふたしつつも、いつもりんのことを一番に考え、底なしの優しさで包み込み育てていくダイキチ。そんなダイキチに心を開き、無邪気な笑顔を見せるようになるりん。ひょんなことから一緒に暮らすことになった二人が、周りのみんなに支えられ、見守られながら、本当の家族のような愛情と絆で結ばれていく。', '澤村.jpg', FALSE);

-- 注文
create table orders (
  id bigserial not null
  , order_number text not null
  , user_id bigint not null
  , status integer not null
  , total_price integer not null
  , date timestamp not null
  , constraint orders_PKC primary key (id)
) ;

-- 注文詳細
create table order_items (
  id bigserial not null
  , cinema_id bigint not null
  , order_id bigint REFERENCES orders(id) not null
  , quantity integer not null
  , constraint order_items_PKC primary key (id)
) ;


--利用者のテーブル
create table users (
  id bigserial not null
  , name text not null
  , email text not null
  , password text not null
  , address text not null
  , telephone text not null
  , constraint users_PKC primary key (id)
) ;
