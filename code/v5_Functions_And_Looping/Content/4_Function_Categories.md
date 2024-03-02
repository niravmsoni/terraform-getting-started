# Common function categories
- Numeric functions
    - Used to manipulate numbers
    - Example - min(42, 13, 7)
        - Returns 7

- String functions
    - Manipulate strings
    - Example - lower("TACOS")
        - Returns tacos. Useful for naming S3 buckets since they cannot have upper case

- Collection functions
    - Lists and maps
    - Example - merge(map1, map2)
        - Merges 2 maps and returns results

- IP network functions
    - Dedicated functions that help with IP network related things
    - Example cidrsubnet()

- Filesystem functions
    - Useful for interacting with local file system
    - Example - file(path) - Read contents of file on path and returns string to us

- Type conversion
    - Convert 1 data-type to another
    - Example - toset() - Used most often. Converts list/tuple to set