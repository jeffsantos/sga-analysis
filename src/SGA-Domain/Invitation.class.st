Class {
	#name : #Invitation,
	#superclass : #SGAObject,
	#instVars : [
		'id',
		'dueDate',
		'classOffers',
		'professor'
	],
	#category : #'SGA-Domain'
}

{ #category : #'instance creation' }
Invitation class >> newFromData: rawData [
	| invitation |
	invitation := self new
				rawData: rawData;
				id: (rawData at: 'sgaId');
				dueDate: (rawData at: 'dataLimite').
				
	invitation classOffers addAll: ((rawData at: 'classes') 
				collect: [ :each | ClassOffer newFromData: each ]).
							
	invitation professor: (Professor newFromData: (rawData at: 'professor')).
		
	^ invitation
]

{ #category : #accessing }
Invitation >> addClassOffers: aClassOffer [
	classOffers add: aClassOffer
]

{ #category : #accessing }
Invitation >> classOffers [
	^ classOffers ifNil: [ classOffers := OrderedCollection new ]
]

{ #category : #accessing }
Invitation >> dueDate [
	^ dueDate
]

{ #category : #accessing }
Invitation >> dueDate: aDate [
	dueDate := aDate
]

{ #category : #accessing }
Invitation >> id [
	^ id
]

{ #category : #accessing }
Invitation >> id: aString [
	id := aString
]

{ #category : #accessing }
Invitation >> professor [
	^ professor
]

{ #category : #accessing }
Invitation >> professor: aProfessor [
	professor := aProfessor
]
