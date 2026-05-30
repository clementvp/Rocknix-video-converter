# Video Converter for Rocknix and PSP (RG34XXSP / RGDS / PSP)

This Bash script automates the video conversion process to ensure perfect compatibility with the Rocknix operating system on Anbernic handhelds and the Sony PSP.
It standardizes videos to the target device's native resolution while preserving the original content's proportions by adding black bars (padding) where necessary.

## 🎮 Supported Devices

| Device | Resolution | Aspect Ratio | H.264 Profile |
|--------|-----------|--------------|---------------|
| `rg34xxsp` | 720x480 | 3:2 | Main, Level 4.0 |
| `rgds` | 640x480 | 4:3 | Main, Level 4.0 |
| `psp` | 480x272 | 16:9 | Baseline, Level 3.0 |

## 🚀 Key Features

* **Multi-Device Support**: Target a specific device or convert for all at once.
* **Resolution Optimization**: Resizes to each device's native display resolution.
* **Aspect Ratio Management**: Forces the correct output ratio while preventing image stretching.
* **Maximum Compatibility**: Uses H.264 (Main Profile, Level 4.0) and AAC audio for smooth hardware decoding.
* **Batch Processing**: Automatically handles `.mp4`, `.mkv`, `.avi`, and `.mov` files within a directory.

## 🛠 Prerequisites

You must have FFmpeg installed on your system.

* **Linux (Ubuntu/Debian)**: `sudo apt install ffmpeg`
* **macOS (Homebrew)**: `brew install ffmpeg`
* **Windows**: Install FFmpeg and run the script via Git Bash or WSL.

## 📁 Folder Structure

Ensure your project directory is organized as follows:

```
.
├── convert.sh      # The script file
├── input/          # Place your source videos here
└── output/         # Converted videos will appear here
```

## 💻 How to Use

1. Place your source video files into the `input/` folder.
2. Make the script executable:

```bash
chmod +x convert.sh
```

3. Run the conversion:

```bash
./convert.sh              # Convert for all devices
./convert.sh rg34xxsp     # Convert for RG34XXSP only (720x480)
./convert.sh rgds         # Convert for RGDS only (640x480)
./convert.sh psp          # Convert for PSP only (480x272)
```

Output files are saved in `output/<device>/` (e.g. `output/rgds/video.mp4`).

## ⚙️ Technical Specifications

The script applies the following FFmpeg parameters to ensure optimal playback:

* **Video Codec**: `libx264` (Main Profile, Level 4.0).
* **Pixel Format**: `yuv420p` (Standard for most players).
* **Scaling Filter**: Resizes to fit the target resolution using a "decrease" strategy to avoid distortion, then pads the remaining space.
* **Audio Codec**: `aac` at 128k.