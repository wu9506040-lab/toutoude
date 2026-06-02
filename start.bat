@echo off
chcp 65001 >nul 2>&1
title 莞香3D博物馆 - 开发服务器

echo ========================================
echo   莞香非遗文化3D数字化展示系统
echo   一键启动脚本
echo ========================================
echo.

:: 切换到项目目录
cd /d "%~dp0"

:: 尝试端口 3005, 3006, 3007, 3008, 3009, 3010
set PORT=3005

:: 检查端口是否被占用，如果被占用就换下一个
:CHECK_PORT
netstat -ano | findstr ":%PORT% " | findstr "LISTENING" >nul 2>&1
if %errorlevel%==0 (
    echo 端口 %PORT% 已被占用，尝试下一个...
    set /a PORT+=1
    if %PORT% gtr 3010 (
        echo 所有端口都被占用了！请手动关闭占用端口的程序。
        pause
        exit /b 1
    )
    goto CHECK_PORT
)

echo 启动开发服务器，端口: %PORT%
echo 浏览器将自动打开...
echo 按 Ctrl+C 停止服务器
echo.

:: 启动 Vite 并自动打开浏览器
start "" "http://localhost:%PORT%"
npx vite --port %PORT% --force --open

pause
