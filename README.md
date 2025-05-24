## How to use this scoop bucket?

```pwsh
scoop bucket add self https://github.com/WisThrG/ScoopStdExt
scoop install self/<manifestname>
```

## How to install Scoop?

### 1st Method

```pwsh
$env:SCOOP='D:/Scoop'
iwr -useb get.scoop.sh | iex
```

### 2nd Method

```pwsh
irm get.scoop.sh -outfile 'install.ps1'
# .\install.ps1 -? // look command info
.\install.ps1 -ScoopDir 'D:/Scoop' -ScoopGlobalDir 'D:/Scoop/apps'
```

## Things that must be done before using Scoop normally

```pwsh
scoop install git
scoop bucket add extras
scoop bucket add self https://github.com/WisThrG/ScoopStdExt
scoop uninstall git 7zip
scoop install self/7zip self/git
scoop install dark innounp
```
