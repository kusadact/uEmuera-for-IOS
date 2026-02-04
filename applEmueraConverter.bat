@echo off
setlocal enabledelayedexpansion

rem 지정된 폴더 경로를 입력 받음
set "root_folder=%~1"

rem CSV 폴더 내 파일 이름 및 확장자 대문자로 변경
if exist "%root_folder%\CSV" (
    powershell.exe -Command "Get-ChildItem -Path "%root_folder%\CSV" -Filter *.csv | Rename-Item -NewName {$_.FullName.ToUpper()}"
    if exist "%root_folder%\CSV\_RENAME.CSV" (
        ren "%root_folder%\CSV\_RENAME.CSV" "_Rename.csv"
    )
    if exist "%root_folder%\CSV\VARIABLESIZE.CSV" (
        ren "%root_folder%\CSV\VARIABLESIZE.CSV" "VariableSize.CSV"
    )
) else (
    echo CSV 폴더가 존재하지 않습니다. 에라 파일을 다시 확인해주십시오.
)

rem 폴더가 존재하는지 확인
if not exist "%root_folder%\resources" (
    echo resources 폴더가 존재하지 않는 에라입니다.
) else (
    rem 리소스 폴더 안 파일들 이름 및 파일 확장자 대문자로 변경
    powershell.exe -Command "Get-ChildItem -Path "%root_folder%\resources" -Recurse | Rename-Item -NewName {$_.FullName.ToUpper()}"
)

echo 확장자 변경 완료!
endlocal

pause