# Changelog
## Version 3
### Version 3.0.0
* Improved test coverage and accuracy significantly by (a) having more tests; and (b) having tests cover return values as well as self-modification non-return values (i.e., checking what happens *after* a bang method is called).
* `spacify` and `underscorify` are no longer Rust native extensions. The Ruby methods were not slow enough to warrant native extensions, and this was complicated when using external build services like Heroku.
* `to_i_separated` no longer modifies the source string (it is non-destructive).
* `underscorify` is no longer destructive.
* New method `underscorify!`, destructive version of `underscorify`.
* `spacify` is no longer destructive.
* New method `spacify!`, destructive version of `spacify`.
* Remove `safely_gsub!`, as it undermines the actual usage of `gsub!` (you probably aren't going to be doing `str = str.gsub!('a', 'b')`, and if you are, you are using it wrongly.)
* New method `separate!`, destructive version of `separate`.

## Version 2
### Version 2.7.3
* Optimize underscorify and spacify with native extensions written in Rust, utilizing the ruru crate. These methods are now 2-5x faster. I did attempt to write a Rust extension for random_line, the slowest function in this library, but the performance increase was insignificant.

### Version 2.7.2
* No longer include tests in gem package.
* License as MIT

### Version 2.7.1
* Improve random_line performance by approximately 1 second real time.
* Improve random_color performance by about 400-500%.
* Improve separate performance by about 250%.

### Version 2.7.0
* Improve random_line by not dividing by 0.
* Add safely_gsub! refinement method for an easier, more readable version of `str.gsub!(pattern, replace) || str`.

### Version 2.6.1
* Fix issue where to_i_separated, underscorify, and spacify returned nil, due to tr! and gsub! returning nil ([#2](https://github.com/elifoster/string-utility-ruby/issues/2)).

### Version 2.6.0
* Improve performance.
* Add specs.

### Version 2.5.1
* Docs for the new color methods

### Version 2.5.0
* Improved spacify performance slightly.
* New methods for getting web colors.

### Version 2.4.1
* random_line properly returns the chomped version.

### Version 2.4.0
* New random_line method for getting a random line in a file.

### Version 2.3.0
* New spacify method, which is essentially the opposite of underscorify.

### Version 2.2.0
* New underscorify method to replace whitespace with underscores.

### Version 2.1.0
* New to_i_separated method for converting a separated string to an integer.

### Version 2.0.2
* Require the right Ruby version, 2.1.

### Version 2.0.1
* Fixed style issues thanks to Rubocop.

### Version 2.0.0
* There is no longer an initialize method.
* separate is now a monkeypatch using the refine keyword.

## Version 1
### Version 1.0.1
* No longer need to create an instance of StringUtility. Not really sure why I made that the case in the first place.
### Version 1.0.0
* Initial version. Currently only includes separate_with.
