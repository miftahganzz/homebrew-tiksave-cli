import Foundation
import ArgumentParser

@main
struct TikSave: AsyncParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "tiksave",
        abstract: "Download TikTok videos without watermarks from the command line",
        version: "1.0.1",
        subcommands: [Download.self, Profile.self, Batch.self, Search.self, History.self, Stats.self, Config.self],
        defaultSubcommand: Download.self
    )
}

extension TikSave {
    struct Download: AsyncParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Download TikTok video"
        )
        
        @Argument(help: "TikTok video URL")
        var url: String
        
        @Option(name: .shortAndLong, help: "Output directory")
        var output: String = "."
        
        @Option(name: .shortAndLong, help: "Format: video, audio, images")
        var format: DownloadFormat = .video
        
        @Flag(name: .shortAndLong, help: "Download with watermark")
        var watermark: Bool = false
        
        @Flag(name: .shortAndLong, help: "Verbose output")
        var verbose: Bool = false
        
        func run() async throws {
            let downloader = 🎬🔒📱(verbose: verbose)
            
            print("🎬 TikSave CLI v1.0.1")
            print("📥 Downloading from: \(url)")
            print("📁 Output: \(output)")
            print("🎯 Format: \(format)")
            print("")
            
            do {
                try await downloader.download(
                    url: url,
                    format: format,
                    watermark: watermark,
                    outputPath: output
                )
                print("\n✅ Download completed successfully!")
            } catch {
                print("\n❌ Error: \(error.localizedDescription)")
                throw ExitCode.failure
            }
        }
    }
    
    struct Profile: AsyncParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Download TikTok profile information"
        )
        
        @Argument(help: "TikTok username")
        var username: String
        
        @Option(name: .shortAndLong, help: "Output directory")
        var output: String = "."
        
        @Flag(name: .shortAndLong, help: "Download avatar")
        var avatar: Bool = false
        
        @Flag(name: .shortAndLong, help: "Verbose output")
        var verbose: Bool = false
        
        func run() async throws {
            let downloader = 🎬🔒📱(verbose: verbose)
            
            print("🎬 TikSave CLI v1.0.1")
            print("👤 Fetching profile: @\(username)")
            print("")
            
            do {
                try await downloader.📥👤👤信息(
                    username: username,
                    downloadAvatar: avatar,
                    outputPath: output
                )
                print("\n✅ Profile fetched successfully!")
            } catch {
                print("\n❌ Error: \(error.localizedDescription)")
                throw ExitCode.failure
            }
        }
    }
}

enum DownloadFormat: String, ExpressibleByArgument {
    case video
    case audio
    case images
}

// Helper functions for formatting
private func 🎯格式化时长(_ seconds: Int) -> String {
    if seconds == 0 { return "N/A" }
    let minutes = seconds / 60
    let remainingSeconds = seconds % 60
    if minutes == 0 {
        return "\(remainingSeconds)s"
    } else if remainingSeconds == 0 {
        return "\(minutes)m"
    } else {
        return "\(minutes)m \(remainingSeconds)s"
    }
}

private func 📅格式化时间(_ timestamp: Int) -> String {
    if timestamp == 0 { return "Unknown" }
    let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter.string(from: date)
}

private func 📊格式化数字(_ number: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
}

private func 🔧构建TikTokURL(author: String, id: String) -> String {
    // Hidden TikTok URL construction
    let protocolPart = String(bytes: [104, 116, 116, 112, 115, 58, 47, 47, 119, 119, 119, 46, 116, 105, 107, 116, 111, 107, 46, 99, 111, 109, 47, 64] as [UInt8], encoding: .utf8) ?? ""
    return protocolPart + author + "/video/" + id
}

extension TikSave {
    struct Batch: AsyncParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Download multiple TikTok videos from file or URLs"
        )
        
        @Argument(help: "File containing TikTok URLs (one per line) or comma-separated URLs")
        var input: String
        
        @Option(name: .shortAndLong, help: "Output directory")
        var output: String = "."
        
        @Option(name: .shortAndLong, help: "Format: video, audio, images")
        var format: DownloadFormat = .video
        
        @Flag(name: .shortAndLong, help: "Download with watermark")
        var watermark: Bool = false
        
        @Flag(name: .shortAndLong, help: "Verbose output")
        var verbose: Bool = false
        
        func run() async throws {
            let downloader = 🎬🔒📱(verbose: verbose)
            
            print("🎬 TikSave CLI v1.0.1 - Batch Mode")
            print("📦 Processing: \(input)")
            print("📁 Output: \(output)")
            print("🎯 Format: \(format)")
            print("")
            
            let urls: [String]
            if input.hasSuffix(".txt") {
                // Read from file
                let content = try String(contentsOfFile: input)
                urls = content.components(separatedBy: .newlines)
                    .map { $0.trimmingCharacters(in: .whitespaces) }
                    .filter { !$0.isEmpty }
            } else {
                // Parse comma-separated URLs
                urls = input.components(separatedBy: ",")
                    .map { $0.trimmingCharacters(in: .whitespaces) }
            }
            
            if urls.isEmpty {
                print("❌ No URLs found!")
                throw ExitCode.failure
            }
            
            do {
                try await downloader.📥📦📦(
                    urls: urls,
                    format: format,
                    watermark: watermark,
                    outputPath: output
                )
                print("\n✅ Batch download completed!")
            } catch {
                print("\n❌ Error: \(error.localizedDescription)")
                throw ExitCode.failure
            }
        }
        
        // Helper functions for formatting
        private func 🎯格式化时长(_ seconds: Int) -> String {
            if seconds == 0 { return "N/A" }
            let minutes = seconds / 60
            let remainingSeconds = seconds % 60
            if minutes == 0 {
                return "\(remainingSeconds)s"
            } else if remainingSeconds == 0 {
                return "\(minutes)m"
            } else {
                return "\(minutes)m \(remainingSeconds)s"
            }
        }
        
        private func 📅格式化时间(_ timestamp: Int) -> String {
            if timestamp == 0 { return "Unknown" }
            let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            return formatter.string(from: date)
        }
        
        private func 📊格式化数字(_ number: Int) -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
        }
    }
    
    struct Search: AsyncParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Search for TikTok videos"
        )
        
        @Argument(help: "Search keyword")
        var keyword: String
        
        @Option(name: .shortAndLong, help: "Number of results (default: 10)")
        var count: Int = 10
        
        @Flag(name: .shortAndLong, help: "Download found videos")
        var download: Bool = false
        
        @Option(name: .shortAndLong, help: "Output directory for downloads")
        var output: String = "."
        
        @Option(name: .shortAndLong, help: "Format for downloads (video/audio/images)")
        var format: DownloadFormat = .video
        
        @Flag(name: .shortAndLong, help: "Verbose output")
        var verbose: Bool = false
        
        func run() async throws {
            let downloader = 🎬🔒📱(verbose: verbose)
            
            print("🎬 TikSave CLI v1.0.1 - Search Mode")
            print("🔍 Keyword: '\(keyword)'")
            print("📊 Results: \(count)")
            print("")
            
            do {
                let results = try await downloader.🔍🎬📡(keyword: keyword, count: count)
                if results.isEmpty {
                    print("❌ No results found")
                    throw ExitCode.failure
                }
                
                print("✅ Found \(results.count) videos:")
                print("")
                
                for (index, video) in results.enumerated() {
                    print("\(index + 1). \(video.title)")
                    print("   � @\(video.author)")
                    print("   ⏱️ \(🎯格式化时长(video.duration)) | ❤️ \(📊格式化数字(video.likes)) | 💬 \(📊格式化数字(video.comments))")
                    print("   🌍 \(video.region) | 📅 \(📅格式化时间(video.createTime))")
                    print("")
                }
                
                if download {
                    print("📥 Downloading found videos...")
                    var successCount = 0
                    var failCount = 0
                    
                    for video in results {
                        // Construct TikTok URL from video ID
                        let videoUrl = 🔧构建TikTokURL(author: video.author, id: video.id)
                        
                        do {
                            print("📹 Downloading: \(video.title.prefix(50))...")
                            try await downloader.download(
                                url: videoUrl,
                                format: format,
                                watermark: false,
                                outputPath: output
                            )
                            successCount += 1
                        } catch {
                            print("❌ Failed to download: \(error.localizedDescription)")
                            failCount += 1
                        }
                    }
                    
                    print("")
                    print("📊 Download Summary:")
                    print("✅ Successful: \(successCount)")
                    if failCount > 0 {
                        print("❌ Failed: \(failCount)")
                    }
                }
                
            } catch {
                print("\n❌ Error: \(error.localizedDescription)")
                throw ExitCode.failure
            }
        }
    }
    
    struct History: AsyncParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Show download history"
        )
        
        @Option(name: .shortAndLong, help: "Number of recent downloads to show")
        var limit: Int = 10
        
        @Flag(name: .shortAndLong, help: "Clear history")
        var clear: Bool = false
        
        func run() throws {
            print("🎬 TikSave CLI v1.0.1 - History")
            print("")
            
            if clear {
                try clearHistory()
                print("✅ History cleared!")
                return
            }
            
            let history = try getHistory(limit: limit)
            if history.isEmpty {
                print("📝 No download history found")
            } else {
                print("📊 Recent Downloads (\(history.count) shown):")
                for (index, item) in history.enumerated() {
                    print("\(index + 1). \(item)")
                }
            }
        }
        
        private func clearHistory() throws {
            let historyFile = FileManager.default.homeDirectoryForCurrentUser
                .appendingPathComponent(".tiksave_history")
            
            if FileManager.default.fileExists(atPath: historyFile.path) {
                try FileManager.default.removeItem(at: historyFile)
            }
        }
        
        private func getHistory(limit: Int) throws -> [String] {
            let historyFile = FileManager.default.homeDirectoryForCurrentUser
                .appendingPathComponent(".tiksave_history")
            
            guard FileManager.default.fileExists(atPath: historyFile.path) else {
                return []
            }
            
            let content = try String(contentsOfFile: historyFile.path)
            let lines = content.components(separatedBy: .newlines)
                .map { $0.trimmingCharacters(in: .whitespaces) }
                .filter { !$0.isEmpty }
            
            return Array(lines.suffix(limit)).reversed()
        }
    }
    
    struct Stats: AsyncParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Show download statistics"
        )
        
        @Flag(name: .shortAndLong, help: "Detailed statistics")
        var detailed: Bool = false
        
        func run() throws {
            print("🎬 TikSave CLI v1.0.1 - Statistics")
            print("")
            
            let stats = try getStats()
            
            print("📊 Overall Statistics:")
            print("📹 Total Downloads: \(stats.totalDownloads)")
            print("💾 Total Size: \(stats.totalSizeFormatted)")
            print("📅 First Download: \(stats.firstDownload)")
            print("🕐 Last Download: \(stats.lastDownload)")
            
            if detailed {
                print("")
                print("📈 Detailed Breakdown:")
                print("🎬 Videos: \(stats.videoCount)")
                print("🎵 Audio: \(stats.audioCount)")
                print("🖼️  Images: \(stats.imageCount)")
                print("👤 Profiles: \(stats.profileCount)")
                
                if !stats.topUsers.isEmpty {
                    print("")
                    print("🏆 Top Downloaded Users:")
                    for (user, count) in stats.topUsers.prefix(5) {
                        print("@\(user): \(count) downloads")
                    }
                }
            }
        }
        
        private func getStats() throws -> (totalDownloads: Int, totalSizeFormatted: String, firstDownload: String, lastDownload: String, videoCount: Int, audioCount: Int, imageCount: Int, profileCount: Int, topUsers: [(String, Int)]) {
            // Placeholder statistics - would read from actual history file
            return (
                totalDownloads: 42,
                totalSizeFormatted: "125.3 MB",
                firstDownload: "Feb 15, 2026",
                lastDownload: "Mar 1, 2026",
                videoCount: 25,
                audioCount: 10,
                imageCount: 5,
                profileCount: 2,
                topUsers: [("ivigilante", 8), ("charlidamelio", 3), ("khaby.lame", 2)]
            )
        }
    }
    
    struct Config: AsyncParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Configure TikSave CLI settings"
        )
        
        @Option(name: .shortAndLong, help: "Set default output directory")
        var outputDir: String?
        
        @Option(name: .shortAndLong, help: "Set default format (video/audio/images)")
        var format: DownloadFormat?
        
        @Flag(name: .shortAndLong, help: "Show current configuration")
        var show: Bool = false
        
        @Flag(name: .shortAndLong, help: "Reset to defaults")
        var reset: Bool = false
        
        func run() throws {
            print("🎬 TikSave CLI v1.0.1 - Configuration")
            print("")
            
            if reset {
                try resetConfig()
                print("✅ Configuration reset to defaults!")
                return
            }
            
            if show {
                let config = try getConfig()
                print("⚙️  Current Configuration:")
                print("📁 Output Directory: \(config.outputDir)")
                print("🎯 Default Format: \(config.defaultFormat)")
                print("🔍 Verbose Mode: \(config.verbose ? "On" : "Off")")
                print("💾 Save History: \(config.saveHistory ? "On" : "Off")")
                return
            }
            
            var config = try getConfig()
            
            if let outputDir = outputDir {
                config.outputDir = outputDir
                print("📁 Output directory set to: \(outputDir)")
            }
            
            if let format = format {
                config.defaultFormat = format.rawValue
                print("🎯 Default format set to: \(format)")
            }
            
            try saveConfig(config)
            print("✅ Configuration updated!")
        }
        
        private func getConfig() throws -> (outputDir: String, defaultFormat: String, verbose: Bool, saveHistory: Bool) {
            let configFile = FileManager.default.homeDirectoryForCurrentUser
                .appendingPathComponent(".tiksave_config")
            
            if FileManager.default.fileExists(atPath: configFile.path) {
                let content = try String(contentsOfFile: configFile.path)
                let lines = content.components(separatedBy: .newlines)
                    .map { $0.trimmingCharacters(in: .whitespaces) }
                
                return (
                    outputDir: lines.first { $0.hasPrefix("output=") }?.dropFirst(7).description ?? ".",
                    defaultFormat: lines.first { $0.hasPrefix("format=") }?.dropFirst(7).description ?? "video",
                    verbose: lines.first { $0.hasPrefix("verbose=") }?.dropFirst(8).description == "true",
                    saveHistory: lines.first { $0.hasPrefix("history=") }?.dropFirst(8).description == "true"
                )
            }
            
            return (outputDir: ".", defaultFormat: "video", verbose: false, saveHistory: true)
        }
        
        private func saveConfig(_ config: (outputDir: String, defaultFormat: String, verbose: Bool, saveHistory: Bool)) throws {
            let configFile = FileManager.default.homeDirectoryForCurrentUser
                .appendingPathComponent(".tiksave_config")
            
            let content = """
            output=\(config.outputDir)
            format=\(config.defaultFormat)
            verbose=\(config.verbose)
            history=\(config.saveHistory)
            """
            
            try content.write(to: configFile, atomically: true, encoding: .utf8)
        }
        
        private func resetConfig() throws {
            let configFile = FileManager.default.homeDirectoryForCurrentUser
                .appendingPathComponent(".tiksave_config")
            
            if FileManager.default.fileExists(atPath: configFile.path) {
                try FileManager.default.removeItem(at: configFile)
            }
        }
    }
}
