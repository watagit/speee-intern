## 変更点

-

## 特筆しておきたい点・確認したい点

-

## 目視テストで確認する項目一覧

<!-- 黙示テストの目的：本来？カピバラでやろうとしていたことを目視テストで確認する -->

トップページ
- [ ] `/` に都道府県の一覧が表示されている
- [ ] `/` において、都道府県名を選択した時に [/prefecture/:id](http://localhost:3000/prefectures/2) に遷移する

都道府県ページ
- [ ] [/prefecture/:id](http://localhost:3000/prefectures/2) において、市区町村のリンクが表示されている
- [ ] [/prefecture/:id](http://localhost:3000/prefectures/2) において、市区町村を選択した場合、[/cities/id](http://localhost:3000/cities/197) に遷移する
- [ ] [/prefecture/:id](http://localhost:3000/prefectures/2) に店舗一覧が表示される
- [ ] [/prefecture/:id](http://localhost:3000/prefectures/2) において、店舗カードを押すと、[branches/id](http://localhost:3000/branches/135) に遷移する

- [ ] 査定可能な企業がない場合、例えば、北海道[/prefecture/:id](http://localhost:3000/prefectures/1) において、`査定可能な企業がありません`と表示される

市区町村ページ
- [ ] [/cities/id](http://localhost:3000/cities/197) において、店舗一覧が表示される
- [ ] [/cities/id](http://localhost:3000/cities/197) において、店舗カードを押すと、[branches/id](http://localhost:3000/branches/135) に遷移する

店舗ページ
- [ ] [branches/id](http://localhost:3000/branches/135) において、店舗の口コミ一覧が表示される
- [ ] [branches/id](http://localhost:3000/branches/135) において、口コミカードを押すと、[reviews/id](http://localhost:3000/reviews/133) に遷移する
- [ ] [branches/id](http://localhost:3000/branches/135) において、企業情報が表示されている
- [ ] [branches/id](http://localhost:3000/branches/135) において、`査定依頼をする`ボタンが表示されている
- [ ] [branches/id](http://localhost:3000/branches/135) において、`査定依頼をする`ボタンを押すと、[/assessment_forms/new?ieul_branch_id=id](http://localhost:3000/assessment_forms/new?ieul_branch_id=135)に遷移する

- [ ] 口コミが無い店舗のページ、例えば、[branches/14](http://localhost:3000/branches/14) において、口コミが表示されない

口コミ詳細ページ
- [ ] [reviews/id](http://localhost:3000/reviews/133) において、口コミ詳細が表示される
- [ ] [reviews/id](http://localhost:3000/reviews/133) において、`査定依頼をする`ボタンが表示されている
- [ ] [reviews/id](http://localhost:3000/reviews/133) において、`査定依頼をする`ボタンを押すと、[/assessment_forms/new?ieul_branch_id=id](http://localhost:3000/assessment_forms/new?ieul_branch_id=135)に遷移する

査定依頼フォーム
- [ ] [/assessment_forms/new?ieul_branch_id=id](http://localhost:3000/assessment_forms/new?ieul_branch_id=135)において、バリーデーションに弾かれない情報をすべての欄に入力した場合、査定依頼が完了し、`/thanks`に遷移する
- [ ] [/assessment_forms/new?ieul_branch_id=id](http://localhost:3000/assessment_forms/new?ieul_branch_id=135)において、バリーデーションに弾かれる情報ひとつでも入力した場合、バリデーションのエラーが表示され、査定依頼フォームを送信しない

査定依頼完了ページ
- [ ] [/thanks](http://localhost:3000/thanks)において、査定依頼が完了した文言が表示されている


## 解決する Issue

- close #0

## 関連する Issue

- #0
