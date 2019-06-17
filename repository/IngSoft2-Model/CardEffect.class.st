"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Cuando caen en esta box, se les da una carta""
For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

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
	#name : #CardEffect,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
CardEffect >> effectOn: aGame [ 
	aGame addCardToPlayer: (aGame currentPlayer)
]
