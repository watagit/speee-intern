## 変更点

-

## 特筆しておきたい点・確認したい点

-

## 目視テストで確認する項目一覧

<!-- 黙示テストの目的：本来？カピバラでやろうとしていたことを目視テストで確認する -->

トップページ
- [ ] `/` に都道府県の一覧が表示されている
- [ ] `/` において、都道府県名を選択した時に `/prefecture/:id` に遷移する

都道府県ページ
- [ ] `/prefectures/id` において、市区町村のリンクが表示されている
- [ ] `/prefectures/id` において、市区町村を選択した場合、`/cities/:id` に遷移する
- [ ] `/prefectures/id` に店舗一覧が表示される
- [ ] `/prefectures/id` において、店舗カードを押すと、`/branches/:id` に遷移する

市区町村ページ
- [ ] `/cities/id` において、店舗一覧が表示される
- [ ] `/cities/id` において、店舗カードを押すと、`/branches/:id` に遷移する

店舗ページ
- [ ] `branches/id` において、店舗の口コミ一覧が表示される
- [ ] `branches/id` において、口コミカードを押すと、`/reviews/:id` に遷移する
- [ ] `branches/id` において、企業情報が表示されている
- [ ] `branches/id` において、`査定依頼をする`ボタンが表示されている
- [ ] `branches/id` において、`査定依頼をする`ボタンを押すと、`/assessment_forms/new?ieul_branch_id=id`に遷移する

口コミ詳細ページ
- [ ] `reviews/id` において、口コミ詳細が表示される
- [ ] `reviews/id` において、`査定依頼をする`ボタンが表示されている
- [ ] `reviews/id` において、`査定依頼をする`ボタンを押すと、`/assessment_forms/new?ieul_branch_id=id`に遷移する

査定依頼フォーム
- [ ] `/assessment_forms/new?ieul_branch_id=id`において、バリーデーションに弾かれない情報をすべての欄に入力した場合、査定依頼が完了し、`/thanks`に遷移する
- [ ] `/assessment_forms/new?ieul_branch_id=id`において、バリーデーションに弾かれる情報ひとつでも入力した場合、バリデーションのエラーが表示され、査定依頼フォームを送信しない


## 解決する Issue

- close #0

## 関連する Issue

- #0
