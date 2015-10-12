lit-cookie
==========

Lit package to parse and serialize cookies

This package was converted from a javascript module called [jshttp/cookie](https://github.com/jshttp/cookie).

### Usage

```lua
local cookie = require('cookie')

assert('foo=bar', cookie.serialize('foo', 'bar'))
assert({ foo = '123' }, cookie.parse('foo=123'))
assert({ priority = 'true', Path = '/', expires = 'Wed, 29 Jan 2014 17:43:25 GMT' }, cookie.parse('priority=true; expires=Wed, 29 Jan 2014 17:43:25 GMT; Path=/'))
```

More examples are in the `test.lua` file.
