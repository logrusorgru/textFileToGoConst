textFileToGoConst
=================

[![GoDoc](https://godoc.org/github.com/logrusorgru/textFileToGoConst?status.svg)](https://godoc.org/github.com/logrusorgru/textFileToGoConst)
[![WTFPL License](https://img.shields.io/badge/license-wtfpl-blue.svg)](http://www.wtfpl.net/about/)
[![GoReportCard](https://goreportcard.com/badge/logrusorgru/textFileToGoConst)](https://goreportcard.com/report/logrusorgru/textFileToGoConst)

Go generate tool that create Go file with constant
containing provided text file.


# Installation

Get
```
go get -u github.com/logrusorgru/textFileToGoConst
```

The project comes without any tests.

# Usage

For example, if you want to use Redis with your Go application and use
Lua scripts. Since, it is easy to use separate `*.lua` files to use
syntax highlighting and other editing features. But is't not easy to
laod this files at runtime, or if you want content of the files to
be a constant of you Go project. Thus, the textFileToGoConst loads
text files and creates Go file with constant that contains the text file.

For out example, the following file
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

wiht something like this
```
package some

const getLua = `<content of the get.lua file>`

```

See also command line help `textFileToGoConst -h`

# Contributing

Feel free.

### Licensing

Copyright &copy; 2018 Konstantin Ivanov <kostyarin.ivanov@gmail.com>  
This work is free. It comes without any warranty, to the extent permitted
by applicable law.  You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See the LICENSE file for more details.


