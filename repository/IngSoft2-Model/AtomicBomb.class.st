"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
"" Special box ""
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
	probability:		<Object>


    Implementation Points
"
Class {
	#name : #AtomicBomb,
	#superclass : #Boxes,
	#instVars : [
		'probability'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
AtomicBomb class >> create [
	^ self new
		initializeWithProbability;
		yourself
]

{ #category : #actions }
AtomicBomb >> effect: toTheGame [
	(toTheGame players) do: [ :player | player position: 0 ]
	
]

{ #category : #initialize }
AtomicBomb >> initializeWithProbability [ 
	probability := 0.2
]
