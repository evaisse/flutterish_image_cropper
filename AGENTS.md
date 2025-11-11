# Copilot Agent Instructions

This document provides guidance for GitHub Copilot agents working on this repository.

## Code Quality Standards

All code contributions must comply with the following standards enforced by our CI pipeline:

### 1. Code Formatting

- **Requirement**: All Dart code must be properly formatted according to Dart style guidelines
- **Enforcement**: CI runs `dart format --set-exit-if-changed .`
- **Action**: Before committing, run `dart format .` to format all files
- **Failure**: CI will fail if any files are not properly formatted

### 2. Static Analysis

- **Requirement**: Zero errors, warnings, and infos from the Dart analyzer
- **Enforcement**: CI runs `flutter analyze --fatal-infos --fatal-warnings`
- **Action**: Before committing, run `flutter analyze` and fix all reported issues
- **Failure**: CI will fail on any error, warning, or info-level issue

### 3. Tests

- **Requirement**: All tests must pass, including widget tests and golden tests
- **Enforcement**: CI runs `flutter test` on every commit
- **Action**: Run `flutter test` locally to verify all tests pass
- **Failure**: CI will fail if any test fails

### 4. Golden Tests

- **Requirement**: Widget golden tests must match reference images
- **Location**: Golden reference images are stored in `test/goldens/`
- **Action**: If UI changes are intentional, update goldens with `flutter test --update-goldens`
- **Failure**: CI will fail if widget appearance doesn't match golden files and will upload failure artifacts

## Pre-Commit Checklist

Before submitting a pull request, ensure:

1. ✅ Code is formatted: `dart format .`
2. ✅ Analysis passes: `flutter analyze` (zero issues)
3. ✅ Tests pass: `flutter test`
4. ✅ Golden files are up-to-date (if UI was modified)

## Working with the CI Pipeline

### CI Workflow

The CI workflow (`.github/workflows/ci.yml`) runs automatically on:
- Push to `main` or `master` branches
- Pull requests to `main` or `master` branches

### CI Steps

1. **Setup**: Installs Flutter and dependencies
2. **Format Check**: Verifies code formatting
3. **Analysis**: Runs static analysis
4. **Tests**: Executes all tests including golden tests
5. **Coverage**: Generates test coverage report
6. **Artifacts**: Uploads failure artifacts if tests fail

### Handling CI Failures

If CI fails:

1. **Check the failure logs** in the GitHub Actions tab
2. **Identify the failing step**: format, analysis, or tests
3. **Fix the issue locally**:
   - Format issues: Run `dart format .`
   - Analysis issues: Run `flutter analyze` and fix reported problems
   - Test failures: Run `flutter test` and fix failing tests
   - Golden failures: Review changes and update with `flutter test --update-goldens` if intentional
4. **Verify the fix**: Run the appropriate command locally
5. **Commit and push**: The fix will trigger a new CI run

## Common Issues and Solutions

### Import Order

**Problem**: Imports must appear at the top of files, before any declarations.

**Solution**: Move all `import` statements to the beginning of the file.

```dart
// ❌ Wrong
class MyClass {}
import 'dart:io';

// ✅ Correct
import 'dart:io';
class MyClass {}
```

### Unused Imports

**Problem**: Analyzer reports unused imports as warnings.

**Solution**: Remove unused imports or use the imported elements.

### Golden Test Failures

**Problem**: Widget appearance changed, golden tests fail.

**Solution**: 
- If change is intentional: Run `flutter test --update-goldens` and commit updated images
- If change is unintentional: Fix the code to match expected appearance

## Best Practices for Agents

1. **Always run format before committing**: Use `dart format .`
2. **Check analysis early**: Run `flutter analyze` after making changes
3. **Test frequently**: Run `flutter test` after significant changes
4. **Understand failures**: Read CI logs to understand what went wrong
5. **Fix root causes**: Don't just silence warnings, fix the underlying issues
6. **Update documentation**: If you change APIs, update relevant docs

## Resources

- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [Flutter Testing Documentation](https://docs.flutter.dev/testing)
- [Golden File Testing](https://api.flutter.dev/flutter/flutter_test/matchesGoldenFile.html)

## Support

For questions about CI failures or code quality standards, refer to:
- CI workflow: `.github/workflows/ci.yml`
- Analysis rules: `analysis_options.yaml`
- Golden test documentation: `test/goldens/README.md`
