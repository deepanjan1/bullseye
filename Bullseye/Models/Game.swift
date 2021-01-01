//
//  Game.swift
//  Bullseye
//
//  Created by Deepanjan De on 12/30/20.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 34, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 180, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 56, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 39, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 95, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 65, date: Date()))
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(self.target - sliderValue)
        if difference == 0 {
            return 200
        } else if difference <= 2 {
            return 100 - abs(self.target - sliderValue) + 50
        } else {
            return 100 - abs(self.target - sliderValue)
        }
    }
    
    mutating func addToLeaderboard(score: Int) {
        let newEntry = LeaderboardEntry(score: score, date: Date())
        
        leaderboardEntries.append(newEntry)
        leaderboardEntries.sort { $0.score > $1.score }
    }
    
    mutating func startNewRound (points: Int) {
        self.score += points
        self.round += 1
        addToLeaderboard(score: points)
        
        self.target = Int.random(in: 1...100)
    }
    
    mutating func restart () {
        self.score = 0
        self.round = 1
        self.target = Int.random(in: 1...100)
    }
}
