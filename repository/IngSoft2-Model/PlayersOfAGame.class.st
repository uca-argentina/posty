"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""nothing yet""
For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	listOfXYZ:		<Object>


    Implementation Points
"
Class {
	#name : #PlayersOfAGame,
	#superclass : #Object,
	#instVars : [
		'listOfPositionOfPlayers',
		'listOfCardsOfPlayer',
		'listOfPermanentCardsOfPlayer',
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
PlayersOfAGame class >> listOfPositionOfPlayers: aListOfPositionOfPlayers listOfCardsOfPlayers: aListOfCardsOfPlayer listOfPermanentCardsOfPlayers: aListOfPermanentCardsOfPlayer [
	^ self new
		initializeWithListOfPositionOfPlayers: aListOfPositionOfPlayers
		listOfCardsOfPlayers: aListOfCardsOfPlayer
		listOfPermanentCardsOfPlayers: aListOfPermanentCardsOfPlayer; yourself
]

{ #category : #cardActions }
PlayersOfAGame >> addCard: aCard toPlayer: aPlayer [ 
	(self cardsOfPlayer: aPlayer) addCard: aCard.
]

{ #category : #playerActions }
PlayersOfAGame >> allPlayers [
	^ listOfPositionOfPlayers collect: [ :eachPositionOfPlayer | eachPositionOfPlayer player ]
]

{ #category : #positionActions }
PlayersOfAGame >> allPositionRecord [
	^ listOfPositionOfPlayers collect: [ :eachPositionOfPlayer | eachPositionOfPlayer allPositionRecord ]

]

{ #category : #description }
PlayersOfAGame >> amountOfCardsOf: aPlayer [
	^ (self cardsOfPlayer: aPlayer) amountOfCards.
]

{ #category : #cardActions }
PlayersOfAGame >> applyCardTo: aPlayer [ 
	^ (self permanentCardsOf: aPlayer) applyEffects.
]

{ #category : #cardActions }
PlayersOfAGame >> applyCardToAll: aCard [ 
	listOfPermanentCardsOfPlayer do: [ :eachPermanentCardsOfPlayer | eachPermanentCardsOfPlayer addCard: aCard  ]
]

{ #category : #cardActions }
PlayersOfAGame >> cardsOfPlayer: aPlayer [
	^ listOfCardsOfPlayer do: [ :cardsOfAPlayer | cardsOfAPlayer player = aPlayer ifTrue: [ ^cardsOfAPlayer ] ].
]

{ #category : #playerActions }
PlayersOfAGame >> hasAnyPlayerReachedPosition: aPosition [ 
	^ (self allPositionRecord) anySatisfy: [ :eachPositionRecord | eachPositionRecord position > aPosition ]
]

{ #category : #initialization }
PlayersOfAGame >> initializeWithListOfPositionOfPlayers: aListOfPositionOfPlayers listOfCardsOfPlayers: aListOfCardsOfPlayer listOfPermanentCardsOfPlayers: aListOfPermanentCardsOfPlayers [
	listOfPositionOfPlayers := aListOfPositionOfPlayers.
	listOfCardsOfPlayer := aListOfCardsOfPlayer.
	listOfPermanentCardsOfPlayer := aListOfPermanentCardsOfPlayers.
]

{ #category : #cardActions }
PlayersOfAGame >> permanentCardsOf: aPlayer [ 
	^ listOfPermanentCardsOfPlayer do: [ :permenentCardsOfAPlayer | permenentCardsOfAPlayer player = aPlayer ifTrue: [ ^permenentCardsOfAPlayer allCards ] ].

]

{ #category : #positionActions }
PlayersOfAGame >> positionRecordsOf: aPlayer [ 
	listOfPositionOfPlayers do: [ :eachPositionOfPlayer | eachPositionOfPlayer player = aPlayer ifTrue: [ ^eachPositionOfPlayer allPositionRecord ] ].
]

{ #category : #'ranking of the game' }
PlayersOfAGame >> ranking [
	(listOfPositionOfPlayers) sort: [ :element1 :element2 | (element1 allPositionRecord) position  > (element2 allPositionRecord) position].
	^ listOfPositionOfPlayers collect: [ :element | element player ]
]

{ #category : #'ranking of the game' }
PlayersOfAGame >> rankingPositionOf: aPlayer [
	(self ranking) doWithIndex: [ :element :index | element = aPlayer 
		ifTrue: [ ^ index ]].
]

{ #category : #removing }
PlayersOfAGame >> removeCard: aCard [
	listOfPermanentCardsOfPlayer do: [ :eachPermanentCardsOfPlayer | eachPermanentCardsOfPlayer removeCard: aCard  ]
]

{ #category : #playerActions }
PlayersOfAGame >> sendAllPlayersToInitialPosition [ 
	(self allPositionRecord ) do: [ :eachPositionOfPlayer | eachPositionOfPlayer moveToBeginning ].
]
