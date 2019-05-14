"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Boxes of a Board""
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
	#name : #Box,
	#superclass : #Object,
	#instVars : [
		'probability',
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #creation }
Box class >> withProbability: aNumber [
	^ self new
		initializeWithProbability: aNumber;
		yourself
]

{ #category : #action }
Box >> effectOn: aGame [

	self subclassResponsibility
]

{ #category : #initialization }
Box >> initializeWithProbability: aNumber [

	probability  := aNumber.
]

{ #category : #action }
Box >> positionInBoard: aNumber [
	position := aNumber.
]

{ #category : #accessing }
Box >> probability [ 
	^ probability .
]
