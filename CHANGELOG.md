# Changelog
## Version 2
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
