# FFmpeg-SDRtoHDR
SDR video convert to HDR video script
FFmpegを使用してSDR動画をH.265/HEVC HDR 10へエンコードするスクリプト

## 使い方
スクリプト使用前にスクリプト内のFFmpeg=ffmpegでFFmpegのパスを指定してください
## sdr2hdr.sh
オーディオトラックをエンコードしない場合
```
./sdr2hdr.sh [入力ファイル] [出力ファイル]
```
AACエンコーダーを指定する場合
```
./sdr2hdr.sh [入力ファイル] [出力ファイル] [aacエンコーダー名]
```
fdk_aacを指定する場合の例:
```
./sdr2hdr.sh [入力ファイル] [出力ファイル] libfdk_aac
```

## sdr2hdr.bat
バッチファイルにエンコードしたいファイルをドロップするとEncodedディレクトリ内にmp4コンテナで出力されます
