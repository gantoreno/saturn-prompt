# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.2] - 2020-01016

### Added

- Add rocket emoji to title on README.md.
- Automatically set "saturn" as $ZSH_THEME on install script.
- Add double quotes on prompt variables.

### Changed

- Change SATURN_TIME_FORMAT to a custom format.
- Replace contact email.

### Removed

- Remove extra quotes from README.md.
- Remove extra space on $RPROMPT after status symbol.

### Fixed

- Fix installation scripts on README.md.
- Fix escaped pipes on README.md.
- Fix git prompt icon color.
- Replace local repo with global repo on install.sh.

## [0.1.1] - 2020-01-11

### Added

- Add reminder to set saturn as ZSH_THEME after installation.

### Changed

- Check for $ZSH existence before installation.
- Fallback to default path format if shrink-path is not present.
- Update README.md with new title & description.

### Fixed

- Fix installation script replacing /bin/sh with /bin/zsh.

## [0.1.0] - 2020-01-11

### Added

- Initial project files.
