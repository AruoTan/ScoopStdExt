$tmp = [System.IO.Path]::GetTempFileName()
try {
    # 执行 yazi 命令并将输出写入临时文件
    yazi $args --cwd-file="$tmp"

    # 读取临时文件内容
    $cwd = Get-Content -Path $tmp -Encoding UTF8

    # 判断 $cwd 是否非空且不等于当前工作目录
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        # 获取完整路径并更改工作目录
        $fullPath = Resolve-Path -Path $cwd -ErrorAction Stop
        Set-Location -LiteralPath $fullPath
    }
}
catch {
    Write-Error "An error occurred: $_"
}
finally {
    # 删除临时文件
    if (Test-Path -Path $tmp) {
        Remove-Item -Path $tmp
    }
}
