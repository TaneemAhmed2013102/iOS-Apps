//
//  StoryBrain.swift
//  Hogwarts
//
//  Created by Taneem on 04/10/2024.

struct StoryBrain{
    
    let stories = [
        //0//
        Story(
        title: "It’s a quiet summer morning. You’re sitting by the window when a large barn owl swoops in and drops an envelope sealed with red wax. The letter is addressed to you — an invitation to attend Hogwarts School of Witchcraft and Wizardry. This is it. You’re about to embark on an adventure like no other!",
        choice1: "Excitedly rip open the letter and start packing your things.", choice1Destination: 1,
        choice2: "Stay skeptical and hide the letter, unsure if it’s real.", choice2Destination: 2
    ),
        //1//
    Story(
        title: "Inside, the letter informs you about the classes you’ll take, the wand you’ll need, and instructions to visit Diagon Alley for your school supplies. You pack up and head to the nearest wizarding spot, accompanied by a trusted friend. You arrive at Diagon Alley, a magical street filled with witches, wizards, and shops selling all sorts of magical items.",
        choice1: "Ollivander’s Wand Shop to get your first wand.", choice1Destination: 3,
        choice2: "Gringotts Wizarding Bank to collect some wizarding gold.", choice2Destination: 4
    ),
        //2//
    Story(
        title: "You decide to keep the letter hidden, thinking it must be some sort of prank. Days go by, but strange things start happening around you — objects move by themselves, animals seem to be watching you, and you’re having weird dreams. One night, an owl knocks on your window again with a second letter, urging you to respond.",
        choice1: "Write a letter back to Hogwarts, asking if this is all true.", choice1Destination: 5,
        choice2: "Ignore the letter again and carry on with your normal life.", choice2Destination: 6
    ),
        //3//
    Story(
        title: "Ollivander greets you with a knowing smile. 'The wand chooses the wizard,' he says, pulling a box from the shelf. You hold the wand, and a warm sensation fills your hand. Sparks fly from the tip. This is your wand. As you prepare to leave, Ollivander stops you.",
        choice1: "Ask Ollivander more about the dangers at Hogwarts.", choice1Destination: 7,
        choice2: "Thank him and leave without asking any more questions.", choice2Destination: 8
    ),
        //4//
    Story(
        title: "The goblins welcome you into the vault, where you collect your family’s fortune. As you leave Gringotts, you overhear two cloaked figures whispering about a dangerous plot involving the Dark Arts.",
        choice1: "Follow the cloaked figures to find out more.", choice1Destination: 10,
        choice2: "Ignore them and head to your next destination.", choice2Destination: 9
    ),
        //5//
    Story(
        title: "You decide to ask for more clarification from Hogwarts, and the response is immediate. Professor McGonagall herself appears at your doorstep, explaining that you are indeed a wizard. She takes you to Diagon Alley to get your supplies. Once there, you notice a strange man in a dark cloak following you.",
        choice1: "Confront the man and ask him why he’s following you.", choice1Destination: 15,
        choice2: "Ignore the man and quickly head to your next destination.", choice2Destination: 8
    ),
        //6//
    Story(
        title: "After days of strange occurrences and doubting your decision, you receive a final letter from Hogwarts: 'We regret to inform you that your enrollment has been canceled due to non-response. Your spot has been filled.' You watch the owl fly away, realizing you’ve lost your chance at magic forever.",
        choice1: "The End", choice1Destination: 0,
        choice2: "The End", choice2Destination: 0
    ),
        //7//
    Story(
        title: "As you talk with Ollivander, he reveals that strange things are happening at Hogwarts this year. 'Dark forces are gathering,' he whispers, 'and not everyone can be trusted.'",
        choice1: "Head to Hogwarts cautiously, keeping Ollivander’s warning in mind.", choice1Destination: 8,
        choice2: "Brush off his concerns and continue your adventure at Hogwarts.", choice2Destination: 13
    ),
        //8//
    Story(
        title: "You arrive at Hogwarts. The castle is magnificent, towering over the dark lake. As you settle in, the Sorting Hat is placed on your head. After a brief moment of hesitation, it yells 'Gryffindor!' Cheers erupt from the Gryffindor table.",
        choice1: "Join your new housemates and start your Hogwarts adventure.", choice1Destination: 13,
        choice2: "Explore the castle on your own, curious about the mysterious hallways.", choice2Destination: 16
    ),
        //9//
    Story(
        title: "Ignoring the man in the cloak, you continue gathering your school supplies. The next stop is Flourish and Blotts to get your textbooks. After purchasing all your materials, you head towards Hogwarts on the Hogwarts Express.",
        choice1: "The adventure at Hogwarts begins!", choice1Destination: 8,
        choice2: "The adventure at Hogwarts begins!", choice2Destination: 8
    ),
        //10//
    Story(
        title: "You follow the cloaked figures through the alleyways of Diagon Alley. They stop near a small shop and begin discussing plans involving something hidden at Hogwarts. 'We need to find it before Potter does,' one of them whispers.",
        choice1: "Run back and warn Dumbledore about the plot.", choice1Destination: 11,
        choice2: "Confront the figures directly and demand to know what they’re planning.", choice2Destination: 12
    ),
        //11//
    Story(
        title: "Professor Dumbledore listens carefully as you explain what you overheard in Diagon Alley. He thanks you for your bravery and asks you to keep the information secret. You are now part of a larger mission to protect Hogwarts.",
        choice1: "The End - You have become a trusted ally of Dumbledore.", choice1Destination: 0,
        choice2: "The End - You have become a trusted ally of Dumbledore.", choice2Destination: 0
    ),
        
        //12//
    Story(
        title: "The figures reveal that they are working for a dark wizard, but before they can capture you, Aurors (magical law enforcement) appear and save you. You are praised for your courage and become well-known for your bravery.",
        choice1: "The End - A hero is born.", choice1Destination: 0,
        choice2: "The End - A hero is born.", choice2Destination: 0
    ),
        //13//
    Story(
        title: "You begin your first day at Hogwarts, attending classes with Harry, Hermione, and Ron. Together, you explore the secrets of Hogwarts and uncover hidden passages, magical creatures, and, eventually, face dark forces.",
        choice1: "The End - Your adventure at Hogwarts has just begun.", choice1Destination: 0,
        choice2: "The End - Your adventure at Hogwarts has just begun.", choice2Destination: 0
    ),
        
        //14//
    Story(
        title: "You refuse to join the magical world. Hagrid shakes his head sadly and leaves. You continue your life in the muggle world, but always wonder what could have been.",
        choice1: "The End - You chose to stay in the Muggle world.", choice1Destination: 0,
        choice2: "The End - You chose to stay in the Muggle world.", choice2Destination: 0
    ),
        //15//
        Story(
            title: "You boldly approach the man in the dark cloak and ask why he’s been following you. He looks startled for a moment before revealing that he’s actually an Auror sent by the Ministry of Magic. He’s been keeping an eye on you because of a potential threat tied to your magical lineage.",
            choice1: "Get scared by the threat and refuse to join the magical world", choice1Destination: 14,
            choice2: "Thank him for his protection and head towards Hogwarts.", choice2Destination: 8
        ),
        //16//
        Story(
            title: "As you explore further through the hidden corridors of Hogwarts, you stumble upon a large, heavy door. Pushing it open with effort, you are met with the low, rumbling growl of a massive creature. Before you stands Fluffy, the giant three-headed dog guarding something. All three of his heads are staring right at you, and you realize that stepping any closer could be dangerous.",
            choice1: "Talk to Hagrid what they are guarding.", choice1Destination: 17,
            choice2: "Run back away and head back to the castle.", choice2Destination: 13
        ),
        //17//
        Story(
            title: "You decide it's best not to confront the three-headed beast directly, so you make your way back to Hagrid's hut. As you arrive, Hagrid is tending to some magical creatures. When you mention Fluffy, Hagrid looks alarmed and quickly pulls you inside. 'That’s a secret!' he says in a hushed tone. 'Fluffy’s guarding somethin' real important, but it's not for you to worry about.",
            choice1: "Head to the Gryffindor common room and meet your fellow housemates.", choice1Destination: 13,
            choice2: "Respect Hagrid’s wishes.", choice2Destination: 13
        )
        
]
    
    var storyNo = 0
    
    mutating func getStoryNext(_ option: String){
        
        if(option == stories[storyNo].choice1){
            storyNo = stories[storyNo].choice1Destination
        }else{
            storyNo = stories[storyNo].choice2Destination
        }
    }
    
    
}




