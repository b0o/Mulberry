# Mulberry [![license: MIT](https://img.shields.io/github/license/b0o/mulberry?style=flat&color=green)](https://mit-license.org) [![Build Status](https://img.shields.io/github/workflow/status/b0o/mulberry/test)](https://github.com/b0o/mulberry/actions/workflows/test.yaml)

Mulberry is a single-file Lua BDD library for testing Neovim plugins. Its goal is to make testing your plugins as easy and delicious as possible.

**Mulberry is still in alpha. Its API will change, a lot! Don't use it yet!**

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
    Expect(foo.someFooFunction).To.Not.EvaluateTo(0xF00)
  end)
end)
```

## Changelog

```
N/a
```

## License

&copy; 2021 Maddison Hellstrom

Released under the MIT License.
