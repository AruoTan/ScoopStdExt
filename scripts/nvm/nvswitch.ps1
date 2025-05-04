if (Test-Path -Path "package.json" -PathType Leaf) {
    try {
        # 读取并解析 package.json
        $packageJson = Get-Content -Raw -Path "package.json" | ConvertFrom-Json

        # 检查 engines.node 是否存在
        if ($packageJson.engines -and $packageJson.engines.node) {
            $nodeVersion = $packageJson.engines.node

            # 调用 nvm 切换版本
            if ($nodeVersion -match '(\d+)') {
                $majorVersion = $matches[1]
                nvm use $majorVersion | Out-Null
            } else {
                Write-Host "无法从 engines.node ($nodeVersion) 中提取有效版本号"
            }
        } else {
            Write-Host "package.json 缺少配置项 engines.node"
        }
    } catch {
        Write-Error "An error occurred: $_"
    }
}
