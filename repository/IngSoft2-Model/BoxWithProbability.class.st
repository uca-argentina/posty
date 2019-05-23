"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
""Box with Probability""
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
	#name : #BoxWithProbability,
	#superclass : #Object,
	#instVars : [
		'effect',
		'probability'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #creation }
BoxWithProbability class >> effect: anEffect withProbability: aProbability [
	^ self new
		initializeEffect: anEffect withProbability: aProbability;
		yourself
]

{ #category : #initialization }
BoxWithProbability >> initializeEffect: anEffect withProbability: aProbability [
	effect := anEffect .
	probability := aProbability .
]

{ #category : #accessing }
BoxWithProbability >> probability [
	^ probability .
]
