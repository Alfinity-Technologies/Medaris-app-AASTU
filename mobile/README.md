# Campus Medresa

Flutter foundation for the Campus Medresa student app. The current scope is app setup, onboarding, navigation, shared infrastructure, and feature-layer directories; feature data and backend behavior are intentionally not implemented.

## Architecture

Code is organized by feature under `lib/features`. Each feature owns its `presentation`, `domain`, and `data` layers. Presentation depends on domain contracts; data implements those contracts. Shared networking, routing, theme, errors, constants, and reusable widgets live under `lib/core`. Avoid importing another feature's data layer; share stable contracts through domain only when a real cross-feature need exists.

Riverpod is used for dependency injection and reactive state. Add providers only when a feature or dependency needs them. GoRouter owns app navigation. There are no authentication routes, guards, or assumed student data.

## Dependencies

- `flutter_riverpod`: dependency injection and reactive state.
- `go_router`: declarative routes and navigation.
- `dio`: configurable REST client.
- `freezed_annotation` and `freezed`: immutable model annotations and generation.
- `json_annotation` and `json_serializable`: JSON model annotations and generation.
- `build_runner`: runs the model code generators.
- Flutter `flutter_localizations` with ARB: localization without another runtime package.

PDF, audio, and file-storage packages are deferred until those features are implemented. `pdfrx` is a cross-platform PDF option to evaluate; `just_audio` supports streaming and local playback; `path_provider` supplies app-private file locations. Downloads can initially use Dio with path_provider, avoiding a dedicated downloader until background/resume requirements are known.

## Localization

English and Amharic translations live in `lib/l10n/arb`. Flutter generates the typed API into `lib/l10n/generated` using `l10n.yaml`. The system locale is used when supported, with English as the fallback. Add a locale by adding an ARB file with the same message keys.

## API configuration

The Dio client reads `API_BASE_URL` at build time and defaults to `https://api.example.com`, which is only a placeholder. Set the real value after the backend team provides it:

```powershell
flutter run --dart-define=API_BASE_URL=https://your-api-host
```

No endpoint paths or request models are assumed. `ApiErrorInterceptor` attaches a user-safe `AppException` to Dio errors; feature repositories can translate that into their own UI state.

## Development commands

```powershell
flutter pub get
flutter gen-l10n
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter run
```

Run code generation again after adding Freezed or JSON-serializable models. Generated localization and model files should be checked in with the source that requires them.

## Recommended next steps

1. Confirm the production API base URL and agree on endpoint and response contracts with the backend team.
2. Implement the Qirat domain contracts and data sources against those contracts, then add repositories and providers.
3. Build the first user-facing Qirat list and wire it to real data, loading, empty, and error states.
4. Select and validate PDF, audio, and offline-storage packages against required mobile platforms before implementing those feature slices.
5. Add profile preferences and a language selector when their persistence behavior is defined.

## Getting Started
