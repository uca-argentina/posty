"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""permanent cards""
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
	player:		<Object>


    Implementation Points
"
Class {
	#name : #PermanentCardsOfAPlayer,
	#superclass : #Object,
	#instVars : [
		'player',
		'allCards',
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
PermanentCardsOfAPlayer class >> ofPlayer: aPlayer ofGame: aGame [
	^ self new initializeWithPlayer: aPlayer andGame: aGame;
	yourself
]

{ #category : #adding }
PermanentCardsOfAPlayer >> addCard: aCard [
	allCards addCard: aCard.
]

{ #category : #accesing }
PermanentCardsOfAPlayer >> allCards [
	^ allCards
]

{ #category : #initialization }
PermanentCardsOfAPlayer >> initializeWithPlayer: aPlayer andGame: aGame [
	player := aPlayer.
	allCards := PermanentCardRecords createForGame: aGame.
	game := aGame.
]

{ #category : #accesing }
PermanentCardsOfAPlayer >> player [
	^ player
]

{ #category : #removing }
PermanentCardsOfAPlayer >> removeCard: aCard [
	allCards removeCard: aCard.
]
