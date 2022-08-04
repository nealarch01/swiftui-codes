//
//  ImageColor.swift
//  SpotifyPlaylist
//
//  Created by Neal Archival on 8/2/22.
//

import Foundation

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

