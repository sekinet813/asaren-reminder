# Cursor用プロンプトテンプレート

このファイルは、asaren-reminderプロジェクトのIssueをCursorで実装させる際のプロンプトテンプレートです。

## 使用方法
1. 対象のIssue番号をコピー
2. プロンプトのURL部分を書き換える
3. CursorのPrompt欄に貼り付けて使用

> 注意：コーディング規約、UI指針、要件追記のドキュメントも併せて更新・参照すること

---

## Cursor用プロンプト（実装者向け）

```markdown
## 依頼内容

以下の Issue を実装してください：

https://github.com/sekinet813/asaren-reminder/issues/XX

---

## 指示事項

- コーディング規則は `docs/cursor_rules.md` に従ってください  
- UI/UXに関する判断は `docs/design-guidelines.md` を参照してください  
- 実装に伴う要件の追加・変更は `docs/requirements.md` に追記してください  
- 必要な単体テスト・ウィジェットテストを `test/` 以下に追加・更新してください  
- ファイル命名規則（snake_case）やディレクトリ構成ルールも `cursor_rules.md` に準拠してください  
- DartDocコメントは、公開クラス・メソッドに最低限の説明を記述してください
- `flutter analyze` を実行して、警告が出ないことを確認してください
```
