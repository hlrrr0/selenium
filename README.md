# line up
<!-- ## 1, get price
### 1-1, kusuribank
janコードの一覧を渡すと、クスリバンクのサイトから価格と取得してくれる

#### Usage
```
bundle exec ruby get_price/kusuribank.rb
```

## 2, get items from ranking
### 2-1, yahoo shopping
yahoo!ショッピングのランキングページから、ランキング掲載中の商品情報を取得してくれる。

#### Usage
```
bundle exec ruby get_items_from_ranking/yahoo.rb
```
もし、yahoo shoppingのrankingページから配下の詳細ランキングページを取得したい場合は、下記を実行する
ex)
ダイエット
ダイエット > ダイエットサプリメント
ダイエット > ダイエット器具

```
ruby generate_ranking_page_yahoo.rb
```

### 2-2, （wip）rakuten
楽天のランキングページから、ランキング掲載中の商品情報を取得してくれる。

#### Usage
```
bundle exec ruby get_items_from_ranking/rakuten.rb
```

 -->

## 3, research lowest price 
### 3-1, yahoo shopping
janコードを渡すと、送料込みの最安値を取得してくれる
NEの商品管理ページの一覧ダウンロードからDLしたCSVファイルを`input/syohin_basic.csv`というファイル名で格納する
（ref.https://main.next-engine.com/User_Syohin_Search）

#### Usage
```
bundle exec ruby research_lowest_price/yahoo_shopping.rb
```

### 3-2, rakuten
janコードを渡すと、送料込みの最安値を取得してくれる
NEの商品管理ページの一覧ダウンロードからDLしたCSVファイルを`input/syohin_basic.csv`というファイル名で格納する
（ref.https://main.next-engine.com/User_Syohin_Search）

#### Usage
```
bundle exec ruby research_lowest_price/rakuten.rb
```

### 3-3, （WIP）Qoo10
janコードを渡すと、送料込みの最安値を取得してくれる
`input/import_data.txt`にjanコードの一覧を格納しておく（1行1janコード）

#### Usage
```
bundle exec ruby research_lowest_price/qoo10.rb
```

### 3-2, (WIP）Amazon
janコードを渡すと、送料込みの最安値を取得してくれる
`input/import_data.txt`にjanコードの一覧を格納しておく（1行1janコード）

#### Usage
```
bundle exec ruby research_lowest_price/amazon.rb
```

## 4, research reviews
### 4-1, yahoo shopping
janコードを渡すと、送料込みの最安値を取得してくれる
`input/import_data.txt`にjanコードの一覧を貼り付ける（スプシなどからコピペ）

#### Usage
```
bundle exec ruby research_reviews/yahoo_shopping.rb
```

### 4-2, rakuten
janコードを渡すと、送料込みの最安値を取得してくれる
`input/import_data.txt`にjanコードの一覧を貼り付ける（スプシなどからコピペ）

#### Usage
```
bundle exec ruby research_reviews/rakuten.rb
```
