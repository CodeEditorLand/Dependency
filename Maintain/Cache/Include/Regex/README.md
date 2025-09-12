# Find all emoji with whitespace

## Emoticon

```
(([\u{1F600}-\u{1F64F}])\u{0020})
(\u{0020}([\u{1F600}-\u{1F64F}]))
```

## Pictograph

```
(([\u{1F300}-\u{1F5FF}])\u{0020})
(\u{0020}([\u{1F300}-\u{1F5FF}]))
```

## Map

```
(([\u{1F680}-\u{1F6FF}])\u{0020})
(\u{0020}([\u{1F680}-\u{1F6FF}]))
```

## Dingbat

```
(([\u{2600}-\u{26FF}\u{2700}-\u{27BF}])\u{0020})
(\u{0020}([\u{2600}-\u{26FF}\u{2700}-\u{27BF}]))
```

# Search for end of file

```sh
content
$(?![\r\n])
```

# Format all files

```sh
**/*.{js,ts,jsx,tsx,cjs,mjs,cts,mts,rs,yaml,toml,json,md}
```

# Rust replace revision

Use:

```sh
^(?!version|edition|rust-version|resolver)(\w+) = "((\d)(.*))"
```

Replace:

```sh
$1 = { version = "$2" }
```

# TODO: Replace (; + indent + any word) with (; + new line + indent + any word)

## Funding

This project is funded through
[NGI0 Commons Fund](https://NLnet.NL/commonsfund), a fund established by
[NLnet](https://NLnet.NL) with financial support from the European Commission's
[Next Generation Internet](https://ngi.eu) program. Learn more at the
[NLnet project page](https://NLnet.NL/project/Land).

| Land                                                                                                                                                  | PlayForm                                                                                                                                                    | NLnet                                                                                         | NGI0 Commons Fund                                                                                                                                    |
| ----------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| [<img src="https://raw.githubusercontent.com/CodeEditorLand/Asset/refs/heads/Current/Logo/Land.svg" height="80px" alt="Land" />](https://Editor.Land) | [<img src="https://raw.githubusercontent.com/PlayForm/Asset/refs/heads/Current/Logo/PlayForm.svg" height="80px" alt="PlayForm" />](https://PlayForm.Cloud) | [<img width="240px" src="https://NLnet.NL/logo/banner.svg" alt="NLnet" />](https://NLnet.NL) | [<img width="240px" src="https://NLnet.NL/image/logos/NGI0CommonsFund_tag_black_mono.svg" alt="NGI0 Commons Fund" />](https://NLnet.NL/commonsfund) |
