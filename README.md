# 🎬 TikSave CLI

Download TikTok videos without watermarks from the command line.

## ✨ Features

- ⚡ **Fast downloads** - Download videos in seconds
- 💧 **No watermarks** - Get clean videos without TikTok branding
- 🎵 **Audio extraction** - Download audio separately
- 👤 **Profile downloads** - Get user info and avatars
- 🖼️ **Image slideshows** - Download TikTok photo posts
- 🎨 **Beautiful CLI** - Clean and intuitive interface
- 🔒 **100% private** - No data collection

## 📥 Installation

### Quick Install (One-Liner)

```bash
curl -fsSL https://raw.githubusercontent.com/miftahganzz/tiksave-cli/main/install.sh | bash
```

### Via Homebrew

```bash
brew install miftahganzz/tiksave-cli/tiksave
```

Or tap first, then install:

```bash
brew tap miftahganzz/tiksave-cli
brew install tiksave
```

### From Source

```bash
git clone https://github.com/miftahganzz/tiksave-cli.git
cd tiksave-cli
swift build -c release
cp .build/release/tiksave /usr/local/bin/
```

## 🚀 Usage

### Download Video (No Watermark)

```bash
tiksave https://www.tiktok.com/@user/video/1234567890
```

### Download with Watermark

```bash
tiksave https://www.tiktok.com/@user/video/1234567890 --watermark
```

### Download Audio Only

```bash
tiksave https://www.tiktok.com/@user/video/1234567890 --format audio
```

### Download Images (Slideshow)

```bash
tiksave https://www.tiktok.com/@user/video/1234567890 --format images
```

### Custom Output Directory

```bash
tiksave https://www.tiktok.com/@user/video/1234567890 --output ~/Downloads/TikTok
```

### Download Profile Info

```bash
tiksave profile username
```

### Download Profile with Avatar

```bash
tiksave profile username --avatar
```

### Verbose Mode

```bash
tiksave https://www.tiktok.com/@user/video/1234567890 --verbose
```

## 📖 Commands

### `tiksave [URL]`

Download a TikTok video.

**Options:**
- `-o, --output <path>` - Output directory (default: current directory)
- `-f, --format <format>` - Format: video, audio, images (default: video)
- `-w, --watermark` - Download with watermark
- `-v, --verbose` - Verbose output

### `tiksave profile [USERNAME]`

Download TikTok profile information.

**Options:**
- `-o, --output <path>` - Output directory (default: current directory)
- `-a, --avatar` - Download avatar image
- `-v, --verbose` - Verbose output

### `tiksave --help`

Show help information.

### `tiksave --version`

Show version information.

## 📝 Examples

```bash
# Download video without watermark
tiksave https://vm.tiktok.com/ZMhKqvF8D/

# Download audio only to Music folder
tiksave https://vm.tiktok.com/ZMhKqvF8D/ -f audio -o ~/Music

# Download user profile with avatar
tiksave profile charlidamelio --avatar

# Download with verbose output
tiksave https://vm.tiktok.com/ZMhKqvF8D/ --verbose
```

## 💻 Requirements

- macOS 13.0 (Ventura) or later
- Swift 5.9 or later (for building from source)

## 🔒 Privacy

TikSave CLI is completely private:
- ✅ No data collection
- ✅ No analytics
- ✅ All processing happens locally
- ✅ No third-party services

## ⚠️ Legal

- Use for **personal purposes** only
- **Respect copyright** and content creators' rights
- Follow **TikTok's Terms of Service**
- TikSave is **not affiliated** with TikTok or ByteDance Ltd.

## 📜 License

Copyright (c) 2026 miftahganzz. All rights reserved.

This software is provided for personal use only. See [LICENSE](LICENSE) for details.

## 🐛 Issues

Report bugs at: https://github.com/miftahganzz/tiksave-cli/issues

## ⭐ Support

If you find TikSave CLI useful, please star the repository!
