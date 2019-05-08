"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Here we play the game with players and they are affected by differents boxes.""
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
	aGame:		<Object>
	albert:		<Object>
	diceOne:		<Object>
	diceTwo:		<Object>
	robert:		<Object>


    Implementation Points
"
Class {
	#name : #RandomBoardTest,
	#superclass : #TestCase,
	#instVars : [
		'albert',
		'robert',
		'aGame',
		'diceOne',
		'diceTwo'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
RandomBoardTest >> setUp [
	| players |
	diceOne := SameFaceDice withFaces: 6.
	diceTwo := SameFaceDice withFaces: 4.
	albert := Player called: 'Albert'.
	robert := Player called: 'Robert'.
	players := OrderedCollection with: albert with: robert.
	aGame := Game withSteps: 5 withLaps: 2 withPlayers: players.
	aGame board = aGame createRandomBoard
]
