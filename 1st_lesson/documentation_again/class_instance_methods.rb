=begin

# File::path
- https://ruby-doc.org/core-2.5.0/File.html#method-c-path
- https://docs.ruby-lang.org/en/2.5.0/File.html#method-c-path
- Returns the string representation of the path
- class method


# File#path
- https://docs.ruby-lang.org/en/2.5.0/File.html#method-i-path
-  Returns the pathname used to create file as a string. Does not normalize the name.
The pathname may not point to the file corresponding to file. For instance, the pathname becomes void when the file has been moved or deleted.
This method raises IOError for a file created using File::Constants::TMPFILE because they don't have a pathname.
- instance method

=end