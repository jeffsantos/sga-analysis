Class {
	#name : #Program,
	#superclass : #SGAObject,
	#instVars : [
		'id',
		'name',
		'type',
		'cohorts',
		'invitations'
	],
	#category : #'SGA-Domain'
}

{ #category : #'instance creation' }
Program class >> newFromData: rawData [
	| program |
	program := self new
					rawData: rawData;
					id: (rawData at: 'id');
					name: (rawData at: 'nome');
					type: (rawData at: 'curso').
					
	program cohorts addAll: ((rawData at: 'turmas') 
					collect: [ :each | Cohort newFromData: each ]).
					
	program invitations addAll: ((rawData at: 'convites') 
					collect: [ :each | Invitation newFromData: each ]).
						
	^ program
	
]

{ #category : #action }
Program >> addCohort: aChort [
	self cohorts add: aChort
]

{ #category : #accessing }
Program >> cohorts [
	^ cohorts ifNil: [ cohorts := OrderedCollection new ]
]

{ #category : #accessing }
Program >> id [
	^ id
]

{ #category : #accessing }
Program >> id: anInteger [
	id := anInteger
]

{ #category : #accessing }
Program >> invitations [
	^ invitations ifNil: [ invitations := OrderedCollection new ]
]

{ #category : #accessing }
Program >> name [
	^ name
]

{ #category : #accessing }
Program >> name: aString [
	name := aString
]

{ #category : #accessing }
Program >> type [
	^ type
]

{ #category : #accessing }
Program >> type: aString [
	type := aString
]
