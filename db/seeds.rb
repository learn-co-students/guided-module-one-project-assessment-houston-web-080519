MadLib.destroy_all
PartsOfSpeech.destroy_all
UserInput.destroy_all

puts "adding story 1"
story1 = MadLib.create(story_id: 1, story: "Coding gets a bad rap as _ , but it’s actually very _ . People use coding _ , for things like browsing reddit to playing _ . For example, if you want a computer to _ your _ , you can create your own _ . Coding can be very _ , but remember- it’s not about the _ , it’s about the _ ! I love _ !")

adj1 = PartsOfSpeech.create(order_id: 0, story_id: story1.story_id, part_of_speech: "Adjective")
adj2 = PartsOfSpeech.create(order_id: 1, story_id: story1.story_id, part_of_speech: "Adjective")
fot = PartsOfSpeech.create(order_id: 2, story_id: story1.story_id, part_of_speech: "Frequency of Time")
game = PartsOfSpeech.create(order_id: 3, story_id: story1.story_id, part_of_speech: "Game")
ptv = PartsOfSpeech.create(order_id: 4, story_id: story1.story_id, part_of_speech: "Present Tense Verb")
noun1 = PartsOfSpeech.create(order_id: 5, story_id: story1.story_id, part_of_speech: "Noun")
noun2 = PartsOfSpeech.create(order_id: 6, story_id: story1.story_id, part_of_speech: "Noun")
adj3 = PartsOfSpeech.create(order_id: 7, story_id: story1.story_id, part_of_speech: "Adjective")
noun3 = PartsOfSpeech.create(order_id: 8, story_id: story1.story_id, part_of_speech: "Noun")
noun4 = PartsOfSpeech.create(order_id: 9, story_id: story1.story_id, part_of_speech: "Noun")
ving = PartsOfSpeech.create(order_id: 10, story_id: story1.story_id, part_of_speech: "Verb + ing")

puts "adding story 2"
story2 = MadLib.create(story_id: 2, story: "Have you ever wished you could _ a(n) _ ? Last weekend, I did just that. I went to _ on my _ . On the way, I stopped for _ at a(n) _ place called _ . If you have never been there, I highly recommend it. My favorite dish there is the _ . Afterwards, I was super full, but I went to _ and climbed to the top of the _ . What a view! We should all go there _ .")

n1 = PartsOfSpeech.create(order_id: 0, story_id: story2.story_id, part_of_speech: "Noun")
p2 = PartsOfSpeech.create(order_id: 1, story_id: story2.story_id, part_of_speech: "Place")
mot3 = PartsOfSpeech.create(order_id: 2, story_id: story2.story_id, part_of_speech: "Mode of Transportation")
n2 = PartsOfSpeech.create(order_id: 3, story_id: story2.story_id, part_of_speech: "Noun")
a1 = PartsOfSpeech.create(order_id: 4, story_id: story2.story_id, part_of_speech: "Adjective")
p3 = PartsOfSpeech.create(order_id: 5, story_id: story2.story_id, part_of_speech: "Place")
n4 = PartsOfSpeech.create(order_id: 6, story_id: story2.story_id, part_of_speech: "Noun")
f1 = PartsOfSpeech.create(order_id: 7, story_id: story2.story_id, part_of_speech: "Food")
p4 = PartsOfSpeech.create(order_id: 8, story_id: story2.story_id, part_of_speech: "Place")
n5 = PartsOfSpeech.create(order_id: 9, story_id: story2.story_id, part_of_speech: "Noun")
ft1 = PartsOfSpeech.create(order_id: 10, story_id: story2.story_id, part_of_speech: "Future Time (i.e. next weekend, next Christmas, etc.")

puts "seeding COMPLETE!"
