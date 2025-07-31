# Trivia Quiz App – Flutter mobilní aplikace

## Popis

Tento projekt je mým **prvním větším projektem ve frameworku Flutter** a zároveň první prací v jazyce Dart. Aplikace slouží jako interaktivní **kvízová hra**, která využívá externí **Trivia API** určené pro vzdělávací účely.

Na hlavní stránce aplikace je možné nastavit parametry hry (např. obtížnost, počet otázek, typ odpovědí), které se předávají jako parametry do API volání. Po stisknutí tlačítka se vytvoří `GET` požadavek, který stáhne otázky odpovídající uživatelskému výběru.

## Funkce

- **Nastavení hry** před spuštěním (počet otázek, kategorie, obtížnost, typ otázek)
- **Zobrazení otázek**:
  - Typ: Ano/Ne nebo výběr z více možností
  - Časový limit: **20 sekund** na každou otázku
- **Bodování**:
  - +10 bodů za správnou odpověď (zobrazí se zeleně)
  - -5 bodů za špatnou odpověď (zobrazí se červeně)
  - -5 bodů za vypršení času (automatický přechod na další otázku)
- **ProgressBar** pod AppBarem zobrazuje zbývající čas

## Použité technologie

- **Jazyk**: Dart
- **Framework**: Flutter
- **API**: [Trivia API](https://opentdb.com/api_config.php)
