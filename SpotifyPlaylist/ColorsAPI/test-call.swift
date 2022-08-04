//
//  ImageColor.swift
//  SpotifyPlaylist
//
//  Created by Neal Archival on 8/2/22.
//

// Works!

import Foundation
import Darwin

class VibrantColors: Decodable {
    private(set) var hexValue: Int?
    private(set) var red: Int?
    private(set) var green: Int?
    private(set) var blue: Int?
}

fileprivate class reqBodyParams: Codable {
    let imageURL: String
    init(imageURL: String) {
        self.imageURL = imageURL
    }
}

class ImageColor {
    public func getVibrant(imageURL: String) async -> VibrantColors? {
        let apiURL = URL(string: "http://127.0.0.1:5001/color")!
        var request = URLRequest(url: apiURL)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(reqBodyParams(imageURL: imageURL))
        do {
            let (responseData, urlResponse) = try await URLSession.shared.data(for: request)
            let httpURLResponse = urlResponse as? HTTPURLResponse // Note: HTTPURLResponse is a subclass of URLResponse, if type coercion fails, returns nil
            if httpURLResponse == nil {
                return nil
            }
            if httpURLResponse!.statusCode != 200 {
                return nil
            }
            let colorData = try? JSONDecoder().decode(VibrantColors.self, from: responseData)
            return colorData
        } catch let error {
            print("Could not obtain image vibrant colors.")
            print(error.localizedDescription)
            return nil
        }
    }
}

func main() {
    let imageColor = ImageColor()
    Task {
        let color = await imageColor.getVibrant(imageURL: "https://i.scdn.co/image/ab67706f000000031889956ba0f579beaed6ab76")
        if color == nil {
            print("Could not obtain color data.")
            exit(1)
        } else {
            print(color!.hexValue!)
            print(color!.red!)
            print(color!.green!)
            print(color!.blue!)
            exit(0)
        }
    }

    RunLoop.main.run()
}

main()
