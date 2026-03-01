import Foundation

class 🎬🔒📱 {
    private let verbose: Bool
    private let apiBase: String
    
    init(verbose: Bool = false) {
        self.verbose = verbose
        let protocolBytes: [UInt8] = [104, 116, 116, 112, 115, 58, 47, 47]
        let domainBytes: [UInt8] = [116, 105, 107, 119, 109, 46, 99, 111, 109, 47, 97, 112, 105, 47]
        
        if let protocolStr = String(bytes: protocolBytes, encoding: .utf8),
           let domainStr = String(bytes: domainBytes, encoding: .utf8) {
            self.apiBase = protocolStr + domainStr
        } else {
            let xorKey: UInt8 = 42
            let obfuscated: [UInt8] = [90, 103, 106, 107, 107, 88, 41, 41, 87, 103, 119, 119, 61, 71, 111, 111, 109, 41, 97, 111, 105, 41]
            let decoded = obfuscated.map { $0 ^ xorKey }
            self.apiBase = String(bytes: decoded, encoding: .utf8) ?? ""
        }
    }
    
    private static func 🔗🌐📄() -> String {
        let bytes: [UInt8] = [104, 116, 116, 112, 115, 58, 47, 47, 116, 105, 107, 119, 109, 46, 99, 111, 109, 47]
        return String(bytes: bytes, encoding: .utf8) ?? ""
    }
    
    private static func 🖥️🌐🔧() -> String {
        let bytes: [UInt8] = [77, 111, 122, 105, 108, 108, 97, 47, 53, 46, 48, 32, 40, 77, 97, 99, 105, 110, 116, 111, 115, 104, 32, 73, 110, 116, 101, 108, 32, 77, 97, 99, 32, 79, 83, 32, 88, 49, 48, 95, 49, 53, 95, 55, 41, 32, 65, 112, 112, 108, 101, 87, 101, 98, 75, 105, 116, 47, 53, 51, 55, 46, 51, 54, 32, 40, 75, 72, 84, 77, 76, 44, 32, 108, 105, 107, 101, 32, 71, 101, 99, 107, 111, 41, 32, 67, 104, 114, 111, 109, 101, 47, 49, 52, 53, 46, 48, 46, 48, 46, 48, 32, 83, 97, 102, 97, 114, 105, 47, 53, 51, 55, 46, 51, 54]
        return String(bytes: bytes, encoding: .utf8) ?? ""
    }
    
    func download(url: String, format: DownloadFormat, watermark: Bool, outputPath: String) async throws {
        let videoId = try extractVideoId(from: url)
        
        if verbose {
            print("🔍 Extracted video ID: \(videoId)")
        }
        
        print("⏳ Fetching video information...")
        let videoInfo = try await fetchVideoInfo(videoId: videoId)
        
        print("📊 Title: \(videoInfo.title)")
        print("👤 Author: @\(videoInfo.author)")
        print("❤️  Likes: \(formatNumber(videoInfo.likes))")
        print("💬 Comments: \(formatNumber(videoInfo.comments))")
        print("🔄 Shares: \(formatNumber(videoInfo.shares))")
        print("")
        
        switch format {
        case .video:
            let downloadURL = watermark ? videoInfo.playURL : videoInfo.downloadURL
            try await downloadFile(
                from: downloadURL,
                to: outputPath,
                filename: "\(videoInfo.id)_\(watermark ? "wm" : "nowm").mp4",
                type: "video"
            )
            
        case .audio:
            try await downloadFile(
                from: videoInfo.musicURL,
                to: outputPath,
                filename: "\(videoInfo.id)_audio.mp3",
                type: "audio"
            )
            
        case .images:
            if videoInfo.images.isEmpty {
                print("❌ This video has no images")
                throw DownloadError.noImages
            }
            
            for (index, imageUrl) in videoInfo.images.enumerated() {
                try await downloadFile(
                    from: imageUrl,
                    to: outputPath,
                    filename: "\(videoInfo.id)_image_\(index + 1).jpg",
                    type: "image"
                )
            }
        }
        
        print("✅ Download completed successfully!")
    }
    
    func downloadProfile(username: String, downloadAvatar: Bool, outputPath: String) async throws {
        print("⏳ Fetching profile information...")
        let profileInfo = try await fetchProfileInfo(username: username)
        
        print("👤 Username: @\(profileInfo.username)")
        print("📝 Nickname: \(profileInfo.nickname)")
        print("📊 Followers: \(formatNumber(profileInfo.followers))")
        print("👥 Following: \(formatNumber(profileInfo.following))")
        print("❤️  Total Likes: \(formatNumber(profileInfo.totalLikes))")
        print("🎬 Videos: \(formatNumber(profileInfo.videos))")
        print("📄 Bio: \"\(profileInfo.bio)\"")
        print("")
        
        let profileText = """
        TikTok Profile Information
        =========================
        Username: @\(profileInfo.username)
        Nickname: \(profileInfo.nickname)
        Followers: \(profileInfo.followers)
        Following: \(profileInfo.following)
        Total Likes: \(profileInfo.totalLikes)
        Videos: \(profileInfo.videos)
        Bio: "\(profileInfo.bio)"
        Region: \(profileInfo.region)
        """
        
        let profilePath = "\(outputPath)/\(profileInfo.username)_profile.txt"
        try profileText.write(toFile: profilePath, atomically: true, encoding: .utf8)
        print("💾 Profile saved to: \(profilePath)")
        
        if downloadAvatar {
            try await downloadFile(
                from: profileInfo.avatarURL,
                to: outputPath,
                filename: "\(profileInfo.username)_avatar.jpg",
                type: "avatar"
            )
        }
        
        print("✅ Profile fetched successfully!")
    }
    
    private func fetchVideoInfo(videoId: String) async throws -> VideoInfo {
        let urlString = "\(apiBase)/?url=https://www.tiktok.com/@x/video/\(videoId)"
        guard let url = URL(string: urlString) else {
            throw DownloadError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue(Self.🖥️🌐🔧(), forHTTPHeaderField: "User-Agent")
        request.setValue(Self.🔗🌐📄(), forHTTPHeaderField: "Referer")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if verbose {
            if let httpResponse = response as? HTTPURLResponse {
                print("📊 Status: \(httpResponse.statusCode)")
            }
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw DownloadError.networkError
        }
        
        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        guard let dataDict = json?["data"] as? [String: Any] else {
            throw DownloadError.parseError
        }
        
        return VideoInfo(
            id: videoId,
            title: dataDict["title"] as? String ?? "",
            author: (dataDict["author"] as? [String: Any])?["unique_id"] as? String ?? "",
            downloadURL: dataDict["play"] as? String ?? "",
            playURL: dataDict["wmplay"] as? String ?? "",
            musicURL: dataDict["music"] as? String ?? "",
            images: (dataDict["images"] as? [String]) ?? [],
            likes: dataDict["digg_count"] as? Int ?? 0,
            comments: dataDict["comment_count"] as? Int ?? 0,
            shares: dataDict["share_count"] as? Int ?? 0,
            duration: dataDict["duration"] as? Int ?? 0,
            createTime: dataDict["create_time"] as? Int ?? 0,
            region: dataDict["region"] as? String ?? "Unknown"
        )
    }
    
    private func fetchProfileInfo(username: String) async throws -> ProfileInfo {
        let urlString = "\(apiBase)/user/info?unique_id=\(username)"
        guard let url = URL(string: urlString) else {
            throw DownloadError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue(Self.🖥️🌐🔧(), forHTTPHeaderField: "User-Agent")
        request.setValue(Self.🔗🌐📄(), forHTTPHeaderField: "Referer")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if verbose {
            if let httpResponse = response as? HTTPURLResponse {
                print("📊 Status: \(httpResponse.statusCode)")
            }
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw DownloadError.networkError
        }
        
        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        guard let dataDict = json?["data"] as? [String: Any],
              let userDict = dataDict["user"] as? [String: Any] else {
            throw DownloadError.parseError
        }
        
        let statsDict = userDict["stats"] as? [String: Any]
        return ProfileInfo(
            username: userDict["unique_id"] as? String ?? "",
            nickname: userDict["nickname"] as? String ?? "",
            avatarURL: userDict["avatarLarger"] as? String ?? "",
            followers: statsDict?["followerCount"] as? Int ?? 0,
            following: statsDict?["followingCount"] as? Int ?? 0,
            totalLikes: statsDict?["heartCount"] as? Int ?? 0,
            videos: statsDict?["videoCount"] as? Int ?? 0,
            bio: userDict["signature"] as? String ?? "",
            region: dataDict["region"] as? String ?? "Unknown"
        )
    }
    
    private func downloadFile(from urlString: String, to outputPath: String, filename: String, type: String) async throws {
        guard let url = URL(string: urlString) else {
            throw DownloadError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue(Self.🖥️🌐🔧(), forHTTPHeaderField: "User-Agent")
        request.setValue(Self.🔗🌐📄(), forHTTPHeaderField: "Referer")
        
        print("⬇️  Downloading \(type)...")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if verbose {
            if let httpResponse = response as? HTTPURLResponse {
                print("📊 Status: \(httpResponse.statusCode)")
                print("📏 Size: \(formatByteCount(data.count))")
            }
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw DownloadError.networkError
        }
        
        let outputPathWithSlash = outputPath.hasSuffix("/") ? outputPath : outputPath + "/"
        let filePath = outputPathWithSlash + filename
        
        try data.write(to: URL(fileURLWithPath: filePath))
        print("💾 Saved: \(filename) (\(formatByteCount(data.count)))")
    }
    
    private func extractVideoId(from url: String) throws -> String {
        let patterns = [
            #"(?:vm\.tiktok\.com|vt\.tiktok\.com)/([A-Za-z0-9]+)"#,
            #"tiktok\.com/@[^/]+/video/(\d+)"#,
            #"tiktok\.com/t/([A-Za-z0-9]+)"#
        ]
        
        for pattern in patterns {
            let regex = try NSRegularExpression(pattern: pattern)
            let range = NSRange(location: 0, length: url.utf16.count)
            
            if let match = regex.firstMatch(in: url, options: [], range: range) {
                let matchRange = match.range(at: 1)
                if let swiftRange = Range(matchRange, in: url) {
                    return String(url[swiftRange])
                }
            }
        }
        
        throw DownloadError.invalidURL
    }
    
    private func formatNumber(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
    
    private func formatByteCount(_ bytes: Int) -> String {
        let formatter = ByteCountFormatter()
        formatter.countStyle = .file
        return formatter.string(fromByteCount: Int64(bytes))
    }
}

enum DownloadError: LocalizedError {
    case invalidURL
    case networkError
    case parseError
    case noImages
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL provided"
        case .networkError: return "Network error occurred"
        case .parseError: return "Failed to parse response"
        case .noImages: return "This video has no images"
        }
    }
}

struct VideoInfo {
    let id: String
    let title: String
    let author: String
    let downloadURL: String
    let playURL: String
    let musicURL: String
    let images: [String]
    let likes: Int
    let comments: Int
    let shares: Int
    let duration: Int
    let createTime: Int
    let region: String
}

struct ProfileInfo {
    let username: String
    let nickname: String
    let avatarURL: String
    let followers: Int
    let following: Int
    let totalLikes: Int
    let videos: Int
    let bio: String
    let region: String
}
