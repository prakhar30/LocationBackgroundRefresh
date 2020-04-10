//
//  FileWriter.swift
//  LocationBackgroundRefresh
//
//  Created by Prakhar Tripathi on 09/04/20.
//  Copyright © 2020 Prakhar. All rights reserved.
//

import Foundation

class FileWriter {

    static var logFile: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileName = "fetchIntervals.txt"
        return documentsDirectory.appendingPathComponent(fileName)
    }

    static func log(message: String) {
        guard let logFile = logFile else { return }

        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let timestamp = formatter.string(from: Date())
        guard let data = (timestamp + ": " + message + "\n").data(using: String.Encoding.utf8) else { return }

        if FileManager.default.fileExists(atPath: logFile.path) {
            if let fileHandle = try? FileHandle(forWritingTo: logFile) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
                fileHandle.closeFile()
            }
        } else {
            try? data.write(to: logFile, options: .atomicWrite)
        }
    }
}
