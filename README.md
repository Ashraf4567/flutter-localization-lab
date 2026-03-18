# localization_lab

A Flutter project demonstrating two different approaches to localization (l10n).

## Localization Approaches

This project explores two different methods for handling localized strings across branches:

### 1. Standard Approach (`master` branch)
This is the conventional Flutter localization approach using `AppLocalizations`.
- **Usage:** Requires a `BuildContext` to retrieve the localized string.
- **Example:**
  ```dart
  final l10n = AppLocalizations.of(context)!;
  Text(l10n.loginTitle);
  ```
- **Pros:** Native to Flutter, automatically rebuilds the UI upon locale changes via `InheritedWidget`.
- **Cons:** Can be verbose. Makes it difficult to access strings in layers of code that lack access to a `BuildContext` (e.g., ViewModels, external services, background tasks).

### 2. Contextless Approach (`single-file-localization` branch)
This approach abstracts localized strings into a single static class (`Strings`), ideal for projects where you don't want to change every file to accommodate context passing.
- **Usage:** Initialize it once (e.g., when the app starts or locale changes) using `Strings.init(AppLocalizations.of(context)!)`, then access strings statically anywhere.
- **Example:**
  ```dart
  Text(Strings.loginTitle);
  ```
- **Pros:** Keeps UI code clean. Easily accessible in Business Logic (BLoCs/Cubits) and Services without propagating `BuildContext` down the widget tree.
- **Cons:** You must manually ensure the UI rebuilds when the locale updates, as static variable accesses are not inherently reactive.

