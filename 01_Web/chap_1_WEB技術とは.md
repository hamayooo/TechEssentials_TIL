# -01 webとは
## output
    WWW: World Wide Web
    ハイパーテキスト（言語）で構成されている。WEBページの中に別のWEBページへの参照（ハイパーリンク）を埋め込むことができ、関連付けて大きな情報の集合体としている

## why
    ハイパーテキストマークアップランゲージがhtmlだから…
    phpとか色々あるけど最終的に見えているのはハイパーテキストってことか？

## check
## next action

# -02 インターネットとWeb
## output
    インターネットとWebは違う目的で作られた。
    ほぼ同義で使用していた。反省…

    Web: CERN（欧州原子核研究機構）でティムバーナーズ=リーによって開発。ENQUIREというシステムが開発され改良されてWWWが誕生。当初は文字のみ。画像が使える＋Webブラウザの普及に伴い世界中に広まる

    インターネット：ARPA(アメリカ国防総省)で開発されたコンピュータネットワークのARPANETが原型。
    回線費用が安くなるとともに、企業・研究機関だけのものから一般に広まった。

## why
    Webはインターネットありきだから、インターネットが先に普及してその後でWebかな。

## check
## next action


# -03 様々なWebの用途
## output
    たしかに曖昧なママ使ってるものも多い。反省。

    Webサイト: 1つのドメインにある複数のWebページの集まり。

    UI: コンピュータ機能とユーザのやり取りを橋渡しする「機能」。ハイパーテキストで作られたメールの操作画面に対して行った操作を、Webサーバがユーザに変わってメールサーバに伝えてメールの操作を行ってる

    API: Application Programming Interface　UIに対してソフトウェア同士のやり取りを橋渡しする機能。 
    天気予報アプリでは、アプリが送信した地域情報をプログラム用のAPI（Webサーバ）が天気予報データをアプリに返す

## why
    UIに対してAPIというのが違和感。が、ユーザインターフェースという名前が独り歩きしている感もある

## check
## next action

# -04 HTMLとWebブラウザ
## output
    HTML hyper text markup language
    Webブラウザ：ハイパーテキストを解釈して人間が読みやすいように作り変えて表示。


# -05 WebサーバーとHTTP
## output
    Webサーバー：Webブラウザからコンテンツ要求＞必要なコンテンツをネットワークを通してWebブラウザに送信する役割を持つ。ApacheやIISというプログラムがよく利用される。
    ※Apache(Apache HTTP Server)：Apache Software Foundationが開発・公開
    ※IIS：Microsoftが開発・公開

    HTTP：HyperText Transfer Protocol　ハイパーテキストを送信するためのやりとりの手順。ハイパーテキストの要求手順、送信手順、コンテンツをもっていなかった場合の手順などが定義されている。世界標準。WebブラウザによらずにWebサーバーとの間で同じ手順でやりとりできる。

## why
    HTTP2について、やりとりの手順ということでは変わりないはず。
    HTTP2はHTTPと何が違うのか
    あとHTTPS．ただセキュアというだけ？

## check
    Webブラウザ > Webサーバ > Webブラウザの「 > 」がhttp

## next action
    HTTP2の仕様を調べる。HTTPとの違いはなんだ？
    HTTPSもついでに


# -06 Webページが表示される流れ
## output
    URL：Uniform Resouce LocatorでWebサーバーにアクセスする。この中には、やり取りの手順、どのWebサーバか、何のコンテンツか、が含まれている。
    1度のコンテンツ転送で送られるファイルは1つ。他のファイル（画像など）が必要となった場合は、再度Webサーバにそのファイル転送を要求し、表示画面にはめ込む。

## why
## check
    たとえばhtmlと画像は1度に読み込めない。htmlを取ってきて次に画像。だからこのスピードを早めたいからLazyload.jsとかがあるのかな
## next action


# -07 静的ページと動的ページ
## output
    静的：研究資料を閲覧するために開発された。これだけで良かった。
    豊かな表現が求められるようになって動的ページが生まれる…

    動的：アクセスしたときの状況に応じて異なる内容が表示されるWebページを動的ページという。
    GoogleやYahoo!の結果表示ページ：ブラウザ上の検索文字列（データ） > Webサーバが検索処理 > 結果のhtmlをWebサーバが作成 > Webブラウザに送信・表示


# -08 動的ページの仕組み
## output
    CGI(Common Gateway Interface): Webサーバがブラウザからの要求に応じてプログラムを起動させるための仕組み。はじめWebサーバ > CGIが用意された場所を示すURLにアクセスする。

    サーバーサイド・スクリプト：CGIが呼び出されるプログラム。Perl,Ruby,Python,PHP,JavaScriptなど
    
    クライアントサイド・スクリプト：HTMLに埋め込まれWebブラウザによって読み込まれる際に実行される。主にJavaScript。


# -09 Webの標準化
## output
    W3C(World Wide Web Consortium): ティム・バーナーズ=リーガ創設。HTML,CSS,XML,XHTMLの標準化を行っている。標準化したものは「勧告」という形で発表。
    従うことは強制ではないが、どのWebブラウザでも同じようにWebページが表示される状態を実現するために、ほとんどのWebサイトが準拠している。
    ※W3C:非営利団体。会費や研究助成金、寄付金などで活動を行っている。
    ※ちなみに、下記が会費。なかなか高い。
      営利企業で年商57億5000万円以上 (税込) であれば，会費額は年間 740 万円(税込)(= Full Member)
      営利企業で年商57億5000万円未満 (税込) であれば，会費額は年間  85 万円(税込)(= Affiliate Member)
      非営利組織や教育機関，行政組織等，その他の場合も，会費額は年間  85 万円(税込)(= Affiliate Member)

# -10 Webの設計思想
## output
    RESTfulなシステム：REST(REpresentational State Transfer)とは4つの原則からなるシンプルな設計。
    RESTfulなシステムは、やり取りの方法や情報の示し方が統一されていることや1つの情報に別の情報をリンクさせられるためシンプルな構造になりやすく円滑に情報連携を行える。多くのWebアプリケーションがRESTfulになるように設計されている。

    セマンティックWeb：ティム・バーナーズ=リーが提唱している。Webページの情報に意味（セマンティック）を付け加えたもの。HTMLではできない。
    XMLで構成する。文書中にRDFという言語で意味を記述し、言葉の相互関係などはOWLという言語で記述する。情報に関する意味を示す情報をメタデータと呼ぶ。
    情報を検索するときの制度を上げることができたり、Web中から特定の種類の情報を集めて活用できるようになる。

## why
    セマンティックWebはXMLで構成されるもの。RDFとOWLという言語はよくわからないが、RESTfulと対になっているのか。HTMLには意味づけする機能はなくても、googleが提唱してた構造化マークアップとかで意味づけされるんじゃないか？
    て、これはgoogleブラウザの中の世界か。
    もっと広い意味のWeb，と理解した。


## check
    RESTfulなシステムとは？
      4つの原則からなるシンプルな設計思想。円滑に情報連携が行える。
      4つの原則とは
        - 統一インターフェース：HTTPなど定義された方法で情報がやりとり
        - アドレス可能性：一意なURLの構文で示される
        - 接続性：情報にはリンクを含めることができる
        - ステートレス性：やり取りは1回ごとに完結、前のやり取りの影響を受けない
        - 
    セマンティックWebとは？
      Webページの情報に意味を加えたもの。XMLで構成され、メタデータはRDFやOWLで記述される。
      情報検索の制度を高めたり情報を集めて活用できる様になる反面、普及はまだ先になりそう
      ※Webページ中のテキストが住所か人名かという情報をもたせ、機械検索などの精度を高める、というイメージ（「長野　病院」：今はテキストで長野と入ってる病院のページすべてが対象だけど、ホントはエリアの長野だけに絞りたい、とか）

## next action
    体感するまでテキストベースで覚えられなそう。思想はなんとなく理解したので、体感しよう

# -chapter1 COLUMN 
## output
    Webアプリケーション：Webを介して人が利用するサービスを提供する（EC，ネットバンキングとか）
    Webサービス：プログラムが利用するサービスを提供する（プログラムAPI）
    Webシステム：Webアプリケーション、Webサービスを提供する仕組み
    Webサイト：OK
    Webページ：OK

    人を介するかどうか、で名前変わるのか。あまり意識しないで使っていたので意識してみようと思った。あまり本質ではないと思うけど…
