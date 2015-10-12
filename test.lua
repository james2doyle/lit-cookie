local cookie = require('./init')

assert('foo=bar', cookie.serialize('foo', 'bar'))
assert('foo=bar%20baz', cookie.serialize('foo', 'bar baz'))
assert('foo=', cookie.serialize('foo', ''))

assert('foo=bar; Path=/', cookie.serialize('foo', 'bar', { path = '/' }))

assert('foo=bar; Secure', cookie.serialize('foo', 'bar', { secure = true }))

assert('foo=bar', cookie.serialize('foo', 'bar', { secure = false }))

assert('foo=bar; Domain=example.com', cookie.serialize('foo', 'bar', { domain = 'example.com' }))

assert('foo=bar; HttpOnly', cookie.serialize('foo', 'bar', { httpOnly = true }))

assert('foo=bar; Max-Age=1000', cookie.serialize('foo', 'bar', { maxAge = 1000 }))

assert('foo=bar; Max-Age=0', cookie.serialize('foo', 'bar', { maxAge = 0 }))

assert('foo=bar; First-Party-Only', cookie.serialize('foo', 'bar', { firstPartyOnly = true }))

assert('foo=bar', cookie.serialize('foo', 'bar', { firstPartyOnly = false }))

assert('cat=%2B%20', cookie.serialize('cat', '+ '))

assert({ cat = 'foo=123&name=baz five' }, cookie.parse(cookie.serialize('cat', 'foo=123&name=baz five')))

assert({ cat = ' ";/' }, cookie.parse(cookie.serialize('cat', ' ";/')))
assert('cat=+ ', cookie.serialize('cat', '+ '))

print('Serialize tests passed assert successfully')

assert({ foo = 'bar' }, cookie.parse('foo=bar'))
assert({ foo = '123' }, cookie.parse('foo=123'))

assert({ FOO = 'bar', baz = 'raz' }, cookie.parse('FOO    = bar;   baz  =   raz'))

assert({ foo = 'bar=123456789&name=Magic+Mouse' }, cookie.parse('foo="bar=123456789&name=Magic+Mouse"'))

assert({ email = ' ",;/' }, cookie.parse('email=%20%22%2c%3b%2f'))

assert({ foo = '%1', bar = 'bar' }, cookie.parse('foo=%1;bar=bar'))

assert({ foo = '%1', bar = 'bar' }, cookie.parse('foo=%1;bar=bar;HttpOnly;Secure'))

assert({ foo = 'bar=123456789&name=Magic+Mouse' }, cookie.parse('foo="bar=123456789&name=Magic+Mouse"'))

assert({ email = '%20%22%2c%3b%2f' }, cookie.parse('email=%20%22%2c%3b%2f'))

assert({ priority = 'true', Path = '/', expires = 'Wed, 29 Jan 2014 17:43:25 GMT' }, cookie.parse('priority=true; expires=Wed, 29 Jan 2014 17:43:25 GMT; Path=/'))

assert({ foo = '%1', bar = 'bar' }, cookie.parse('foo=%1;bar=bar;foo=boo'))
assert({ foo = 'false', bar = 'bar' }, cookie.parse('foo=false;bar=bar;foo=true'))
assert({ foo = '', bar = 'bar' }, cookie.parse('foo=;bar=bar;foo=boo'))

print('Parse tests passed assert successfully')