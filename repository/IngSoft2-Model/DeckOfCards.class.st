"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".
""A deck of cards""
For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	listOfEffects:		<Object>
	random:		<Object>


    Implementation Points
"
Class {
	#name : #DeckOfCards,
	#superclass : #Object,
	#instVars : [
		'listOfEffects',
		'random'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #creation }
DeckOfCards class >> withEffects: aListOfEffects [ 
	^ self new initializeWithEffects: aListOfEffects;
	yourself.
]

{ #category : #initalize }
DeckOfCards >> initializeWithEffects: aListOfEffects [ 
	listOfEffects := aListOfEffects .
	random := Random new.
]

{ #category : #action }
DeckOfCards >> isAValidEffect: anEffect [
	^ listOfEffects anySatisfy: [ :effect | effect = anEffect  ]
]

{ #category : #action }
DeckOfCards >> pickACard [
	^ listOfEffects at: ((random next * listOfEffects size) floor +1).
]
