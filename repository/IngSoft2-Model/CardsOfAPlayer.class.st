"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""a cards of a player""
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
	cards:		<Object>
	player:		<Object>


    Implementation Points
"
Class {
	#name : #CardsOfAPlayer,
	#superclass : #Object,
	#instVars : [
		'player',
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CardsOfAPlayer class >> player: aPlayer cards: twoCards [
	^ self new
		initializeWithPlayer: aPlayer cards: twoCards;
		yourself
]

{ #category : #action }
CardsOfAPlayer >> addCard: aCard [
	cards add: aCard.
	
]

{ #category : #accessing }
CardsOfAPlayer >> allCards [
	^ cards
]

{ #category : #accessing }
CardsOfAPlayer >> amountOfCards [
	^ cards size
]

{ #category : #initialization }
CardsOfAPlayer >> initializeWithPlayer: aPlayer cards: twoCards [
	player := aPlayer .
	cards := twoCards.
]

{ #category : #accessing }
CardsOfAPlayer >> player [ 
	^ player .
]

{ #category : #action }
CardsOfAPlayer >> usesTheCard: aCard [ 
	cards remove: aCard.
]

{ #category : #action }
CardsOfAPlayer >> willHaveTheCards: collectionOfCards [
	cards := collectionOfCards.
]
