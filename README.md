# 📱 Trivia Quiz App – Flutter mobilní aplikace

## 📝 Popis

Tento projekt je mým **prvním větším projektem ve frameworku Flutter** a zároveň první zkušeností s jazykem **Dart**.  
Aplikace slouží jako interaktivní **kvízová hra**, která využívá externí **Trivia API** určené pro vzdělávací účely.

Na hlavní stránce aplikace lze nastavit parametry hry *(obtížnost, počet otázek, typ odpovědí)*, které se následně předávají do API volání. Po spuštění se provede `GET` požadavek a stáhnou se otázky odpovídající uživatelskému výběru.

## 🎯 Funkce

- ⚙️ **Nastavení hry** před spuštěním:
  - Počet otázek
  - Kategorie
  - Obtížnost
  - Typ otázek
- ❓ **Zobrazení otázek**:
  - Typ: *Ano/Ne* nebo *výběr z více možností*
  - Časový limit: **20 sekund** na každou otázku
- 🏆 **Bodování**:
  - ✅ +10 bodů za správnou odpověď *(zelené zvýraznění)*
  - ❌ -5 bodů za špatnou odpověď *(červené zvýraznění)*
  - ⏳ -5 bodů za vypršení času *(automatický přechod na další otázku)*
- 📊 **ProgressBar** pod AppBarem zobrazuje zbývající čas

## 🛠️ Použité technologie

- 💻 **Jazyk**: Dart
- 🎨 **Framework**: Flutter
- 🌐 **API**: [Trivia API](https://opentdb.com/api_config.php)
