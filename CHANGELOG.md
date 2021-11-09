# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `page_title` as a front matter attribute in `.adoc` files. The content of that attribute is used to set `content_for :page_title`
- Support for `.adoc` files in `PagesController`
- `external_link_to` helper method for links which should open in a new tab/window
- `Metus.public_controller_class` to configure the public controller to be used by Metus
- `nav_link_to` helper to create links which have an `active` class set if the the link equals the current path

### Changed

- Current locale is now added to engine routes
