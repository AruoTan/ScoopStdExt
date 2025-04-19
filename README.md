## How to use this scoop bucket?

```pwsh
scoop bucket add std-ext https://github.com/WisThrG/ScoopStdExt
scoop install std-ext/<manifestname>
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
