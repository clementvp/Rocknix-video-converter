# Video Converter for Rocknix (RG34XXSP)

This Bash script automates the video conversion process to ensure perfect compatibility with the Rocknix operating system on the Anbernic RG34XXSP.
It standardizes videos to a 720x480 resolution (3:2 aspect ratio) while preserving the original content's proportions by adding black bars (padding) where necessary.

## 🚀 Key Features

* **Resolution Optimization**: Resizes specifically for 720x480 displays.
* **Aspect Ratio Management**: Forces a 3:2 output while preventing image stretching.
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
./convert.sh
```

## ⚙️ Technical Specifications

The script applies the following FFmpeg parameters to ensure optimal playback:

* **Video Codec**: `libx264` (Main Profile, Level 4.0).
* **Pixel Format**: `yuv420p` (Standard for most players).
* **Scaling Filter**: Resizes to fit 720x480 using a "decrease" strategy to avoid distortion, then pads the remaining space.
* **Audio Codec**: `aac` at 128k.