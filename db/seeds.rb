MadLib.destroy_all
PartsOfSpeech.destroy_all
UserInput.destroy_all

story1 = MadLib.create(story_id: 1, story: "Coding gets a bad rap as _, but it’s actually very _. People use coding _, for things like browsing reddit to playing _. For example, if you want a computer to _ your _, you can create your own _. Coding can be very _, but remember- it’s not about the _, it’s about the _! I love _!")
adj1 = PartsOfSpeech.create(order_id: 101, story_id: story1.story_id, part_of_speech: "Adjective")
adj2 = PartsOfSpeech.create(order_id: 102, story_id: story1.story_id, part_of_speech: "Adjective")
fot = PartsOfSpeech.create(order_id: 103, story_id: story1.story_id, part_of_speech: "Frequency of Time")
game = PartsOfSpeech.create(order_id: 104, story_id: story1.story_id, part_of_speech: "A Game")
ptv = PartsOfSpeech.create(order_id: 105, story_id: story1.story_id, part_of_speech: "Present Tense Verb")
noun1 = PartsOfSpeech.create(order_id: 106, story_id: story1.story_id, part_of_speech: "Noun")
noun2 = PartsOfSpeech.create(order_id: 107, story_id: story1.story_id, part_of_speech: "Noun")
adj3 = PartsOfSpeech.create(order_id: 108, story_id: story1.story_id, part_of_speech: "Adjective")
noun3 = PartsOfSpeech.create(order_id: 109, story_id: story1.story_id, part_of_speech: "Noun")
noun4 = PartsOfSpeech.create(order_id: 110, story_id: story1.story_id, part_of_speech: "Noun")
ving = PartsOfSpeech.create(order_id: 111, story_id: story1.story_id, part_of_speech: "Verb + ing")

input1 = UserInput.create(order_id: adj1.order_id, input: "cute")
puts PartsOfSpeech.partofspeech WHEN order_id = 110
