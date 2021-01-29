textFileToGoConst
=================

[![GoDoc](https://godoc.org/github.com/logrusorgru/textFileToGoConst?status.svg)](https://godoc.org/github.com/logrusorgru/textFileToGoConst)
[![WTFPL License](https://img.shields.io/badge/license-wtfpl-blue.svg)](http://www.wtfpl.net/about/)
[![GoReportCard](https://goreportcard.com/badge/logrusorgru/textFileToGoConst)](https://goreportcard.com/report/logrusorgru/textFileToGoConst)

Go generate tool to put a text file to string constant of your Go project.


# Go 1.6+

Please refer to [go:embed](https://tip.golang.org/pkg/embed/) first. This package is not needed anymore.

# Installation

Get
```
go get -u github.com/logrusorgru/textFileToGoConst
```
The `go get` command installs `textFileToGoConst` executable in your
`$GOPATH/bin` or `$GOBIN/` directory.


The project comes without any tests.

# Usage

For example, if you want to use Redis with your Go application and want to
use Lua scripts. Since, it is easy to use separate `*.lua` files to use
syntax highlighting and other editing features. But it's not easy to load
this files at runtime, or if you want content of the files to be a constant
of you Go project. And since, manual copy-pasting is hard and slow. Thus,
the `textFileToGoConst` puts content of text file to you Go project, creating
`*.go` file with.

For example, the following file
```go
package some

//go:generate textFileToGoConst -in get.lua
//go:generate textFileToGoConst -in getIncr.lua
//go:generate textFileToGoConst -in getNotTouch.lua
//go:generate textFileToGoConst -in getIncrNotTouch.lua
```
used to generate Go files
- get.lua.go
- getIncr.lua.go
- getNotTouch.lua.go
- getIncrNotTouch.lua.go

with something like this
```
package some

const getLua = `<content of the get.lua file>`

```

## Flags and arguments

- `in` - source file name (required)
- `o`  - output file name (defaults to source + .go)
- `p`  - package name (defaults to autodetect)
- `c`  - constant name (defaults to CamelCased file name without dots)
- `h`  - show help

And trailing argument, that describes destination folder, folder with Go
project (defaults to `.`)

# Contributing

Feel free.

### Licensing

Copyright &copy; 2018 Konstantin Ivanov <kostyarin.ivanov@gmail.com>  
This work is free. It comes without any warranty, to the extent permitted
by applicable law.  You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See the LICENSE file for more details.


