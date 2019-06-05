"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".
""Testing card behaviour""
For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CardTest,
	#superclass : #TestCase,
	#instVars : [
		'players',
		'jack',
		'ben',
		'theGame',
		'empty',
		'boxes',
		'aBoard',
		'threePlayerGame',
		'twoPlayerGame',
		'diceOne',
		'diceTwo',
		'card',
		'deckOfCards'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
CardTest >> setUp [
	super setUp.
	jack := Player called: 'Jack'.
	ben := Player called: 'Ben'.
	players := OrderedCollection with: jack with: ben.
	diceOne := SameFaceDice withFaces: 4.
	diceOne nextRollNumber: 4.
	diceTwo := SameFaceDice withFaces: 5.
	empty := Empty new.
	card := Card new.
	boxes := OrderedCollection with: empty with: empty with: empty with: empty with:card with: empty.
	boxes add: empty.
	boxes add: empty.
	boxes add: empty.
	boxes add: empty.
	aBoard := Board with: boxes.
	deckOfCards := OrderedCollection new.
	twoPlayerGame := Game withBoard: aBoard withLaps: 2  withPlayers:  players with: deckOfCards.
]
