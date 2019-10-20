HighScore.destroy_all


HighScore.create({
    username: "bob",
    readout: "4 - 1",
    score_difference: 3,
})
HighScore.create({
    username: "sam",
    readout: "4 - 0",
    score_difference: 4,
})
HighScore.create({
    username: "jade",
    readout: "21 - 1",
    score_difference: 20,
})

puts "seed complete!"