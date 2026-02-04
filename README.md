# IosBaseProject

## Overview

**IosBaseProject** is a reusable iOS base project template designed for ICT projects. It provides a standardized project structure, commonly used components, and predefined architectural patterns to accelerate development while maintaining consistency, scalability, and code quality across multiple applications.

Most core components are already included as part of the starter project and are considered **mandatory** but **editable**. Some components are **optional** and can be safely removed if they are not required by the application.

---

## Project Structure

Below is the high-level structure of the project and its main responsibilities:

```
.
├── IosBaseProjects
│   ├── IosBaseProjects.entitlements
│   │
│   ├── Common
│   │   ├── Base
│   │   │   ├── IosBaseProjectsApp.swift
│   │   │   ├── Environment
│   │   │   │   └── EnvironmentConfiguration.swift
│   │   │   └── NavigationRoute
│   │   │       └── NavigationManager.swift
│   │   │
│   │   ├── Components
│   │   │   ├── Alert
│   │   │   │   └── BaseAlert.swift
│   │   │   ├── Button
│   │   │   │   ├── PrimaryButton.swift
│   │   │   │   └── OutlinedButton.swift
│   │   │   ├── Calendar
│   │   │   │   └── CalendarView.swift
│   │   │   ├── Card
│   │   │   │   └── Card.swift
│   │   │   ├── Picker
│   │   │   │   ├── DatePickerField.swift
│   │   │   │   ├── LabeledPickerSectionView.swift
│   │   │   │   └── WheelPickerView.swift
│   │   │   ├── TextField
│   │   │   │   ├── TextFieldWithTitle.swift
│   │   │   │   └── SecureFieldWithTitle.swift
│   │   │   ├── TextEditor
│   │   │   │   └── TextEditorWithTitle.swift
│   │   │   ├── Loading
│   │   │   │   ├── LoadingView.swift
│   │   │   │   └── CircularLoadingView.swift
│   │   │   ├── Toast
│   │   │   │   └── View+toast.swift
│   │   │   ├── Toolbar
│   │   │   │   └── CustomToolbarModifier.swift
│   │   │   ├── TopBar
│   │   │   │   └── TopBarView.swift
│   │   │   ├── VideoPlayer
│   │   │   │   └── AVPlayerControllerView.swift
│   │   │   └── Misc (ImageLoader, FilePreview, Footer, TagView, HTMLTextView)
│   │   │
│   │   ├── Enum
│   │   │   └── Shared enums (AlertType, NavigationPage, RequestState, etc.)
│   │   │
│   │   ├── Extension
│   │   │   ├── Date
│   │   │   ├── String
│   │   │   ├── Number
│   │   │   ├── View
│   │   │   └── Moya
│   │   │
│   │   ├── Helper
│   │   │   └── FirebaseHelper.swift
│   │   │
│   │   ├── Localization
│   │   │   └── Localizable.xcstrings
│   │   │
│   │   └── Resource
│   │       ├── Color.xcassets
│   │       │   ├── Brand / Neutral / Success / Danger / Warning / Info
│   │       │   └── Shared design color tokens
│   │       ├── Fonts
│   │       │   ├── Font+Base.swift
│   │       │   └── Base-*.ttf
│   │       ├── Image
│   │       │   └── Assets.xcassets (AppIcon, Alert, etc.)
│   │       └── Lottie
│   │           └── loading.json
│   │
│   ├── Data
│   │   ├── Model
│   │   │   └── [DOMAIN_NAME]
│   │   ├── Module
│   │   │   └── Repository & RemoteDataSource pattern
│   │   └── RequestStateExecutor.swift
│   │
│   ├── Features
│   │   ├── [FEATURE_NAME]
│   │   │   ├── View
│   │   │   └── ViewModel
│   │   └── TabContainer
│   │
│   ├── GoogleService-Info.plist   # Replaced per Firebase project
│   ├── Info.plist
│   └── Preview Content
│
├── IosBaseProjectsTests
│   ├── Data
│   │   ├── Mocks
│   │   └── Module (Repository & RemoteDataSource tests)
│   ├── ViewModel
│   │   └── ViewModel tests
│   └── Helpers
│       └── XCTestCase+MemoryLeakTracking.swift
│
├── IosBaseProject.xcodeproj
│   ├── project.pbxproj
│   └── project.xcworkspace
│
├── ci_scripts
│   └── ci_pre_xcodebuild.sh
│
└── README.md
```
---

## Component Status

### Mandatory (Editable, Do Not Delete)

These components are core to the base project and are expected to exist in most applications:

- Common reusable UI components
- Base navigation and environment configuration
- Localization structure
- Centralized resource management (colors, fonts, images)
- Data layer architecture (Repository & RemoteDataSource)

They **can be modified or renamed**, but should not be deleted.

---

### Optional (Can Be Deleted)

Some components are provided as convenience utilities and may not be required for every project.

Example:
- `Moya+DynamicProvider.swift`  
  Used for handling temporary tokens. If not required, the project can rely solely on `Moya+defaultProvider.swift`.

---

## Localization

The project supports localization to enable multi-language user interfaces while keeping development efficient and scalable.

### Localization Strategy

During development, the team primarily focuses on maintaining the **base language file** (default locale). Additional translations are added incrementally and only when required based on product or business needs.

### Localizable.strings / String Catalogs

User-visible text is centralized using Xcode’s localization system.  
The project supports **String Catalogs (`.xcstrings`)** as the primary approach, with compatibility for `Localizable.strings` where needed.

### Locale Helpers

Locale helper utilities ensure consistent access to localized strings and locale-specific formatting, such as dates, numbers, and currencies.

### Pluralization Handling

Pluralization is handled through the localization system using String Catalogs (or `.stringsdict` where applicable) to ensure grammatically correct text across different languages.

---

## Unit Testing

A default unit testing target is prepared and configured from the beginning of the project lifecycle.

- Test folder structure mirrors the production file and folder hierarchy
- Most tests focus on the **Repository** and **ViewModel** layers
- Networking and data sources are mocked to keep tests fast and deterministic

This approach improves reliability and confidence during refactoring.

---

## CI / CD

The project includes a `ci_scripts/` directory to support automated CI/CD workflows.

### CI/CD Steps

In general, the CI/CD pipeline consists of:

1. Build
2. Test
3. Lint
4. Archive
5. Upload (TestFlight)

These steps are intended to be executed using **Xcode Cloud** or a compatible CI environment.
```

```
---

## Google Services

`GoogleService-Info.plist` is included as a placeholder.  
Each application that uses Firebase services (such as FCM) must replace this file with the configuration provided by Firebase for that specific app.

---

## Starting a New Project

Follow these steps when creating a new project from this base template:

1. Clone or download this repository
2. Remove the existing `.git` folder
3. Initialize a new Git repository
4. Open the project and ensure it builds successfully (`Cmd + B`)
5. Rename all project contexts properly:
   - App name
   - Project name
   - Root folders
   - Target names (main & test)
   - Entitlements file

   Refer to:  
   https://stackoverflow.com/questions/33370175/how-do-i-completely-rename-an-xcode-project-i-e-inclusive-of-folders

6. Build again to verify the setup
7. Configure CI/CD using Xcode Cloud and the provided `ci_scripts`
8. Set up SonarQube when code quality analysis is required

---
