//
//  TrackMetadataHandler.swift
//  SwiftAudioPlayer
//
//  Created by Tobias Dunkel on 03.05.18.
//  Copyright © 2018 Tobias Dunkel. All rights reserved.
//

import Foundation
import AVFoundation

struct TrackMetadata {
    var title: String?
    var artist: String?
    var duration: String?
    var genre: String?
    var album: String?
}

class TrackMetadataHandler {
    
    static func getMetadata(for file: URL) -> TrackMetadata {
        
        let asset = AVURLAsset(url: file, options: nil)
        let commonMD = asset.commonMetadata
        var metadata = TrackMetadata()
        
        metadata.duration = String(asset.duration.durationText)
        
        for item in commonMD {
            switch item.commonKey {
            case AVMetadataKey.commonKeyArtist:
                metadata.artist = item.stringValue!
            case AVMetadataKey.commonKeyTitle:
                metadata.title = item.stringValue!
            case AVMetadataKey.commonKeyAlbumName:
                metadata.album = item.stringValue!
            default:
                break
            }
        }
        
        return metadata
    }
    
}