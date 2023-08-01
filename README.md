# Mulberry [![license: MIT](https://img.shields.io/github/license/b0o/mulberry?style=flat&color=green)](https://mit-license.org) [![Test Status](https://img.shields.io/github/actions/workflow/status/b0o/mulberry/test.yaml?branch=main&label=tests)](https://github.com/b0o/mulberry/actions/workflows/test.yaml)

Mulberry is a single-file Lua BDD library for testing Neovim plugins. Its goal is to make testing your plugins as easy and delicious as possible.

An example Mulberry test suite:

```lua
Describe("the awesome foobar plugin", function()
  It("can do the foo.do", function()
    local foo = require'foo'
    local myFoo = { lol: 'wut', yes: 'no' }
    local bar = foo.do(myFoo)
    Expect(bar).To.Be.A.ListLike()
  end)

  It("can foo.bar all the things", function()
    local foo = require'foo'
    local bar = foo.bar({ allTheThings: true })

    Expect(bar).To.HaveFieldPaths({
      { 'theThings.allOfThem[1].description', Which.Is.A.String   },
      { 'theThings.allOfThem[1].items',       Which.Is.A.ListLike },
      { 'theThings.allOfThem[1].name',        Which.Is.A.String   },
      { 'theThings.allOfThem[1].url',         Which.Is.A.String   },
      { 'theThings.allOfThem[1].enabled',     Which.Is.True       },
    })
  end)

  It("doesn't go meta on you", function()
    local foo = require'foo'
    Expect(foo).To.Not.HaveMetatable()
  end)

  It("always calls you back", function()
    local foo = require'foo'
    Expect(foo.someFooFunction).To.EvaluateTo(0xF00)
  end)
end)
```

## Changelog

```
v0.0.2                                                                2023-07-31
  fix: matchers.In should check for existence of keys, not values
```

## License

&copy; 2021-2023 Maddison Hellstrom

Released under the MIT License.
