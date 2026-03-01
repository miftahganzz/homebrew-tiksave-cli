import Foundation

class 🎬🔒📱 {
    private let verbose: Bool
    private let apiBase: String
    
    init(verbose: Bool = false) {
        self.verbose = verbose
        let apiBase = Self.buildAPI()
        self.apiBase = apiBase
    }
    
    private static func buildAPI() -> String {
        let protocolPart = String(bytes: [104, 116, 116, 112, 115, 58, 47, 47] as [UInt8], encoding: .utf8) ?? ""
        let domainBytes: [UInt8] = [116, 105, 107, 119, 109, 46, 99, 111, 109, 47, 97, 112, 105, 47]
        let domainPart = String(bytes: domainBytes, encoding: .utf8) ?? ""
        
        let xorKey: UInt8 = 42
        let obfuscatedBytes: [UInt8] = [90, 103, 106, 107, 107, 88, 41, 41, 87, 103, 119, 119, 61, 71, 111, 111, 109, 41, 97, 111, 105, 41]
        let xorDecoded = obfuscatedBytes.map { $0 ^ xorKey }
        let xorResult = String(bytes: xorDecoded, encoding: .utf8) ?? ""
        
        return !protocolPart.isEmpty ? protocolPart + domainPart : xorResult
    }
    
    private static func 🔍🎬📡() -> String {
        let protocolBytes: [UInt8] = [104, 116, 116, 112, 115, 58, 47, 47]
        let domainBytes: [UInt8] = [116, 105, 107, 119, 109, 46, 99, 111, 109, 47, 97, 112, 105, 47, 102, 101, 101, 100, 47, 115, 101, 97, 114, 99, 104]
        
        if let protocolStr = String(bytes: protocolBytes, encoding: .utf8),
           let domainStr = String(bytes: domainBytes, encoding: .utf8) {
            return protocolStr + domainStr
        }
        
        let xorKey: UInt8 = 37
        let obfuscated: [UInt8] = [91, 115, 115, 115, 103, 125, 44, 44, 127, 115, 115, 103, 125, 44, 106, 106, 106, 44, 97, 112, 105, 44, 102, 101, 101, 100, 44, 115, 101, 97, 114, 99, 104]
        let decoded = obfuscated.map { $0 ^ xorKey }
        
        if let result = String(bytes: decoded, encoding: .utf8) {
            return result
        }
        
        let baseBytes: [UInt8] = [116, 105, 107, 119, 109, 46, 99, 111, 109, 47, 97, 112, 105, 47, 102, 101, 101, 100, 47, 115, 101, 97, 114, 99, 104]
        let chars = Array(baseBytes)
        let manipulated = chars.enumerated().map { index, char in
            let charCode = Int(char.unicodeScalars.first!.value)
            let newCode = charCode ^ (index % 8 + 1)
            return Character(UnicodeScalar(newCode)!)
        }
        let reversed = String(manipulated.reversed())
        let restored = reversed.enumerated().map { index, char in
            let charCode = Int(char.unicodeScalars.first!.value)
            let newCode = charCode ^ ((reversed.count - index) % 8 + 1)
            return Character(UnicodeScalar(newCode)!)
        }
        
        return String(restored)
    }
    
    private static func 🔗🌐📄() -> String {
        let bytes: [UInt8] = [104, 116, 116, 112, 115, 58, 47, 47, 116, 105, 107, 119, 109, 46, 99, 111, 109, 47]
        
        if let result = String(bytes: bytes, encoding: .utf8) {
            return result
        }
        
        let parts: [UInt8] = [104, 116, 116, 112, 115, 58, 47, 47, 116, 105, 107, 119, 109, 46, 99, 111, 109, 47]
        let combined = String(bytes: parts, encoding: .utf8) ?? ""
        
        let chars = Array(combined)
        let shuffled = chars.enumerated().map { index, char in
            let newPos = (index + 7) % chars.count
            return chars[newPos]
        }
        
        return String(shuffled)
    }
    
    private static func 🖥️🌐🔧() -> String {
        let mozillaBytes: [UInt8] = [77, 111, 122, 105, 108, 108, 97, 47, 53, 46, 48]
        let platformBytes: [UInt8] = [32, 40, 77, 97, 99, 105, 110, 116, 111, 115, 104, 32, 73, 110, 116, 101, 108, 32, 77, 97, 99, 32, 79, 83, 32, 88, 49, 48, 95, 49, 53, 95, 55, 41]
        let engineBytes: [UInt8] = [32, 65, 112, 112, 108, 101, 87, 101, 98, 75, 105, 116, 47, 53, 51, 55, 46, 51, 54, 32, 40, 75, 72, 84, 77, 76, 44, 32, 108, 105, 107, 101, 32, 71, 101, 99, 107, 111, 41]
        let safariBytes: [UInt8] = [32, 67, 104, 114, 111, 109, 101, 47, 49, 52, 53, 46, 48, 46, 48, 46, 48, 32, 83, 97, 102, 97, 114, 105, 47, 53, 51, 55, 46, 51, 54]
        
        if let mozilla = String(bytes: mozillaBytes, encoding: .utf8),
           let platform = String(bytes: platformBytes, encoding: .utf8),
           let engine = String(bytes: engineBytes, encoding: .utf8),
           let safari = String(bytes: safariBytes, encoding: .utf8) {
            return mozilla + platform + engine + safari
        }
        
        let baseBytes: [UInt8] = [77, 111, 122, 105, 108, 108, 97, 47, 53, 46, 48, 32, 40, 77, 97, 99, 105, 110, 116, 111, 115, 104, 32, 73, 110, 116, 101, 108, 32, 77, 97, 99, 32, 79, 83, 32, 88, 49, 48, 95, 49, 53, 95, 55, 41, 32, 65, 112, 112, 108, 101, 87, 101, 98, 75, 105, 116, 47, 53, 51, 55, 46, 51, 54, 32, 40, 75, 72, 84, 77, 76, 44, 32, 108, 105, 107, 101, 32, 71, 101, 99, 107, 111, 41, 32, 67, 104, 114, 111, 109, 101, 47, 49, 52, 53, 46, 48, 46, 48, 46, 48, 32, 83, 97, 102, 97, 114, 105, 47, 53, 51, 55, 46, 51, 54]
        
        let shuffled = baseBytes.enumerated().map { index, char in
            let positions = [3, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
            let pos = positions[index % positions.count]
            return baseBytes[pos % baseBytes.count]
        }
        
        let xorKey: UInt8 = 13
        let xored = shuffled.enumerated().map { index, char in
            let charCode = Int(char.unicodeScalars.first!.value)
            let newCode = charCode ^ Int(xorKey) ^ (index % 256)
            return Character(UnicodeScalar(newCode)!)
        }
        
        let restored = xored.enumerated().map { index, char in
            let charCode = Int(char.unicodeScalars.first!.value)
            let newCode = charCode ^ Int(xorKey) ^ (index % 256)
            return Character(UnicodeScalar(newCode)!)
        }
        
        return String(restored)
    }
    
    func download(url: String, format: DownloadFormat, watermark: Bool, outputPath: String) async throws {
        let videoId = try 🎯🆔🎬(from: url)
        
        if verbose {
        if verbose {
            print("🔍 Extracted video ID: \(videoId)")
        }
        
        print("⏳ Fetching video information...")
        let videoInfo = try await 📥🎬📊(originalUrl: url, videoId: videoId)
        
        print("📊 Title: \(videoInfo.title)")
        print("👤 Author: @\(videoInfo.author)")
        print("⏱️  Duration: \(🎯格式化时长(videoInfo.duration))")
        print("🌍 Region: \(videoInfo.region)")
        print("📅 Created: \(📅格式化时间(videoInfo.createTime))")
        print("❤️  Likes: \(📊格式化数字(videoInfo.likes))")
        print("💬 Comments: \(📊格式化数字(videoInfo.comments))")
        print("🔄 Shares: \(📊格式化数字(videoInfo.shares))")
        print("")
        
        switch format {
        case .video:
            let downloadURL = watermark ? videoInfo.playURL : videoInfo.downloadURL
            try await 📥📁📦(
                from: downloadURL,
                to: outputPath,
                filename: "\(videoInfo.id)_\(watermark ? "wm" : "nowm").mp4",
                type: "video"
            )
            
        case .audio:
            try await 📥📁📦(
                from: videoInfo.musicURL,
                to: outputPath,
                filename: "\(videoInfo.id)_audio.mp3",
                type: "audio"
            )
            
        case .images:
            if videoInfo.images.isEmpty {
                throw DownloadError.noImages
            }
            print("📸 Downloading \(videoInfo.images.count) images...")
            for (index, imageURL) in videoInfo.images.enumerated() {
                try await 📥📁📦(
                    from: imageURL,
                    to: outputPath,
                    filename: "\(videoInfo.id)_image_\(index + 1).jpg",
                    type: "image \(index + 1)/\(videoInfo.images.count)"
                )
            }
        }
    }
    
    func 📥📦📦(urls: [String], format: DownloadFormat, watermark: Bool, outputPath: String) async throws {
        print("📦 Starting batch download of \(urls.count) videos...")
        print("")
        
        var successCount = 0
        var failCount = 0
        
        for (index, url) in urls.enumerated() {
            print("📹 Video \(index + 1)/\(urls.count)")
            do {
                try await download(url: url, format: format, watermark: watermark, outputPath: outputPath)
                successCount += 1
                print("✅ Video \(index + 1) completed successfully!")
            } catch {
                failCount += 1
                print("❌ Video \(index + 1) failed: \(error.localizedDescription)")
            }
            print("")
        }
        
        print("📊 Batch download completed!")
        print("✅ Successful: \(successCount)")
        if failCount > 0 {
            print("❌ Failed: \(failCount)")
        }
    }
    
    func 🔍🎬📡(keyword: String, count: Int = 10) async throws -> [🎬视频信息] {
        print("🔍 Searching for videos: '\(keyword)'")
        
        // Use the real search API - hidden endpoint
        let searchEndpoint = Self.🔍🎬📡()
        guard let url = URL(string: searchEndpoint) else {
            throw DownloadError.invalidURL
        }
        
        // Prepare POST data
        let postData = "keywords=\(keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? keyword)&count=\(count)&cursor=0&web=1&hd=1"
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json, text/javascript, */*; q=0.01", forHTTPHeaderField: "Accept")
        request.setValue("application/x-www-form-urlencoded; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.setValue(Self.🔗🌐📄(), forHTTPHeaderField: "Referer")
        request.setValue(Self.🖥️🌐🔧(), forHTTPHeaderField: "User-Agent")
        request.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
        request.httpBody = postData.data(using: .utf8)
        
        if verbose {
            print("🔗 Search API URL: \(searchEndpoint)")
            print("📄 POST Data: \(postData)")
        }
        
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
        
        // Handle search API response format
        guard let dataDict = json?["data"] as? [String: Any],
              let code = json?["code"] as? Int,
              code == 0,
              let videos = dataDict["videos"] as? [[String: Any]] else {
            throw DownloadError.parseError
        }
        
        var results: [🎬视频信息] = []
        
        for videoData in videos {
            let authorDict = videoData["author"] as? [String: Any]
            
            let videoInfo = 🎬视频信息(
                id: videoData["video_id"] as? String ?? "",
                title: videoData["title"] as? String ?? "",
                author: authorDict?["unique_id"] as? String ?? authorDict?["nickname"] as? String ?? "",
                downloadURL: videoData["play"] as? String ?? "",
                playURL: videoData["wmplay"] as? String ?? videoData["play"] as? String ?? "",
                musicURL: videoData["music"] as? String ?? "",
                images: [], // Search results don't include images
                likes: videoData["digg_count"] as? Int ?? 0,
                comments: videoData["comment_count"] as? Int ?? 0,
                shares: videoData["share_count"] as? Int ?? 0,
                duration: videoData["duration"] as? Int ?? 0,
                createTime: videoData["create_time"] as? Int ?? 0,
                region: videoData["region"] as? String ?? "Unknown"
            )
            
            results.append(videoInfo)
        }
        
        return results
    }
    
    func 📥👤👤信息(username: String, downloadAvatar: Bool, outputPath: String) async throws {
        print("⏳ Fetching profile information...")
        
        let cleanUsername = username.replacingOccurrences(of: "@", with: "")
        let profileInfo = try await 📥👤👤信息(username: cleanUsername)
        
        print("👤 Username: @\(profileInfo.username)")
        print("📝 Nickname: \(profileInfo.nickname)")
        print("🌍 Region: \(profileInfo.region)")
        print("🏷️  Account Type: \(profileInfo.accountType)")
        print("📊 Followers: \(📊格式化数字(profileInfo.followers))")
        print("👥 Following: \(📊格式化数字(profileInfo.following))")
        print("❤️  Total Likes: \(📊格式化数字(profileInfo.totalLikes))")
        print("🎬 Videos: \(📊格式化数字(profileInfo.videoCount))")
        print("📄 Bio: \(profileInfo.bio)")
        print("")
        
        if downloadAvatar {
            try await 📥📁📦(
                from: profileInfo.avatarURL,
                to: outputPath,
                filename: "\(cleanUsername)_avatar.jpg",
                type: "avatar"
            )
        }
        
        let profileData = """
        TikTok Profile: @\(profileInfo.username)
        Nickname: \(profileInfo.nickname)
        Followers: \(📊格式化数字(profileInfo.followers))
        Following: \(📊格式化数字(profileInfo.following))
        Total Likes: \(📊格式化数字(profileInfo.totalLikes))
        Videos: \(📊格式化数字(profileInfo.videoCount))
        Bio: \(profileInfo.bio)
        Verified: \(profileInfo.verified ? "Yes" : "No")
        """
        
        let profilePath = URL(fileURLWithPath: outputPath).appendingPathComponent("\(cleanUsername)_profile.txt")
        try profileData.write(to: profilePath, atomically: true, encoding: String.Encoding.utf8)
        print("💾 Profile saved to: \(profilePath.path)")
    }
    
    private func 🎯🆔🎬(from url: String) throws -> String {
        let patterns = [
            #"(?:vm\.tiktok\.com|vt\.tiktok\.com)/([A-Za-z0-9]+)"#,
            #"tiktok\.com/@[^/]+/video/(\d+)"#,
            #"tiktok\.com/.*[?&]v=(\d+)"#
        ]
        
        for pattern in patterns {
            if let regex = try? NSRegularExpression(pattern: pattern),
               let match = regex.firstMatch(in: url, range: NSRange(url.startIndex..., in: url)),
               let range = Range(match.range(at: 1), in: url) {
                return String(url[range])
            }
        }
        
        throw DownloadError.invalidURL
    }
    
    private func 📥🎬📊(originalUrl: String, videoId: String) async throws -> 🎬视频信息 {
        // Use the original URL provided by user
        let urlString = "\(apiBase)?url=\(originalUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? originalUrl)"
        if verbose {
            print("🔗 Fetching video data...")
        }
        guard let url = URL(string: urlString) else {
            throw DownloadError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
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
        
        // Handle API response format
        guard let dataDict = json?["data"] as? [String: Any],
              let code = json?["code"] as? Int,
              code == 0 else {
            throw DownloadError.parseError
        }
        
        // Extract author info
        let authorDict = dataDict["author"] as? [String: Any]
        
        return 🎬视频信息(
            id: dataDict["id"] as? String ?? videoId,
            title: dataDict["title"] as? String ?? "",
            author: authorDict?["unique_id"] as? String ?? authorDict?["nickname"] as? String ?? "",
            downloadURL: dataDict["play"] as? String ?? "",
            playURL: dataDict["wmplay"] as? String ?? dataDict["play"] as? String ?? "",
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
    
    private func 📥👤👤信息(username: String) async throws -> 👤个人资料信息 {
        let urlString = "\(apiBase)/user/info?unique_id=\(username)"
        if verbose {
            print("🔗 Fetching profile data...")
        }
        guard let url = URL(string: urlString) else {
            throw DownloadError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
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
        
        // Handle API response format for profile
        guard let dataDict = json?["data"] as? [String: Any],
              let code = json?["code"] as? Int,
              code == 0 else {
            throw DownloadError.parseError
        }
        
        // Extract user info from nested structure
        let userDict = dataDict["user"] as? [String: Any]
        let statsDict = dataDict["stats"] as? [String: Any]
        
        return 👤个人资料信息(
            username: userDict?["uniqueId"] as? String ?? username,
            nickname: userDict?["nickname"] as? String ?? "",
            bio: userDict?["signature"] as? String ?? "",
            avatarURL: userDict?["avatarLarger"] as? String ?? userDict?["avatarMedium"] as? String ?? "",
            followers: statsDict?["followerCount"] as? Int ?? 0,
            following: statsDict?["followingCount"] as? Int ?? 0,
            totalLikes: statsDict?["heartCount"] as? Int ?? 0,
            videoCount: statsDict?["videoCount"] as? Int ?? 0,
            verified: userDict?["verified"] as? Bool ?? false,
            region: userDict?["region"] as? String ?? "Unknown",
            accountType: userDict?["account_type"] as? String ?? "Personal"
        )
    }
    
    private func 📥📁📦(from urlString: String, to outputPath: String, filename: String, type: String) async throws {
        guard let url = URL(string: urlString) else {
            throw DownloadError.invalidURL
        }
        
        print("⬇️  Downloading \(type)...")
        
        let (tempURL, response) = try await URLSession.shared.download(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw DownloadError.downloadFailed
        }
        
        let destinationURL = URL(fileURLWithPath: outputPath).appendingPathComponent(filename)
        
        try? FileManager.default.removeItem(at: destinationURL)
        try FileManager.default.moveItem(at: tempURL, to: destinationURL)
        
        let fileSize = try FileManager.default.attributesOfItem(atPath: destinationURL.path)[.size] as? Int64 ?? 0
        print("💾 Saved: \(filename) (\(📊格式化字节(fileSize)))")
    }
    
    private func 📊格式化数字(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
    
    private func 📊格式化字节(_ bytes: Int64) -> String {
        let formatter = ByteCountFormatter()
        formatter.countStyle = .file
        return formatter.string(fromByteCount: bytes)
    }
    
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
}

struct 🎬视频信息 {
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

struct 👤个人资料信息 {
    let username: String
    let nickname: String
    let bio: String
    let avatarURL: String
    let followers: Int
    let following: Int
    let totalLikes: Int
    let videoCount: Int
    let verified: Bool
    let region: String
    let accountType: String
}

enum DownloadError: LocalizedError {
    case invalidURL
    case networkError
    case parseError
    case downloadFailed
    case noImages
    case privateVideo
    case regionRestricted
    case rateLimit
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid TikTok URL"
        case .networkError: return "Network request failed"
        case .parseError: return "Failed to parse response"
        case .downloadFailed: return "Download failed"
        case .noImages: return "This video has no images"
        case .privateVideo: return "Private video - cannot download"
        case .regionRestricted: return "Video restricted in your region"
        case .rateLimit: return "Rate limit exceeded - try again later"
        }
    }
}

extension String {
    var hexadecimal: [UInt8]? {
        var data = [UInt8]()
        var hex = self
        
        if hex.count % 2 != 0 {
            return nil
        }
        
        while !hex.isEmpty {
            let subIndex = hex.index(hex.startIndex, offsetBy: 2)
            let substr = hex[..<subIndex]
            
            if let byte = UInt8(substr, radix: 16) {
                data.append(byte)
            } else {
                return nil
            }
            
            hex = String(hex[subIndex...])
        }
        
        return data
    }
}
