# applEmueraConverter
uEmuera Converter for apple. iOS

iOS를 위한 에라 변환기

## applEmueraConverter.bat란?

[applEmueraConverter.bat](https://github.com/Cowmelie/applEmueraConverter/blob/main/applEmueraConverter.bat)은 에라파일의 resources, CSV 폴더 안에 있는 파일들의 이름과 확장자를 대문자로 바꿔 iOS상에서 게임이 정상 작동하도록 만들어주는 Windows 배치 파일입니다.

## applEmueraConverter.bat 사용 방법

cmd에서 실행
```cmd
  applEmueraConverter.bat C:/path/your_era_folder/
```

실행하고 빨간색 글씨가 뜨는 오류는 무시하면 됩니다. 

resources, CSV 폴더를 확인해서 파일들의 확장자명과 이름의 알파벳이 대문자로 바뀌었는지 확인해주세요.

변환기를 실행한 후, CSV 파일 안에 _Rename.csv와 VariableSize.CSV는 예외이기 때문에 그 상태로 두세요.

**(CSV 폴더 하위에 있는 폴더에 파일 이름 편집 금지.)**

이 파일은 TW에 맞춰진 변환기이기 때문에 다른 에라 파일을 변환할 때 CSV 파일이 잘 바뀌어졌는지 추가적으로 확인해보아야 합니다.
