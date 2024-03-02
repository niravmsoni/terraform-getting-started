# Path Expressions
    
- Whenever there is a need to reference path within terraform, we could use Path expressions
- There are 3 common expressions we need to be aware of
    - path.root - Gives us root module
    - path.module - Current module
    - path.cwd - Current working directory

- Usually, path.root and path.cwd are same
