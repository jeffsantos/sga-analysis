Class {
	#name : #ProgramRESTRepository,
	#superclass : #AbstractReadableRESTRepository,
	#category : #'SGA-Domain'
}

{ #category : #abstract }
ProgramRESTRepository >> initializeEndPoint [
	self serviceEndPoint: 'Programas'
]

{ #category : #accessing }
ProgramRESTRepository >> programId: id [
	| dict |
	dict := self getById: id.
	^ Program newFromData: dict
]

{ #category : #accessing }
ProgramRESTRepository >> programs [
	| array |
	array := self getAll.

	^ array
		collect: [ :each | Program newFromData: each ]
]
