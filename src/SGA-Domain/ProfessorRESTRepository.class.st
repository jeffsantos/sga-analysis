Class {
	#name : #ProfessorRESTRepository,
	#superclass : #AbstractReadableRESTRepository,
	#category : #'SGA-Domain'
}

{ #category : #accessing }
ProfessorRESTRepository >> initializeEndPoint [
	self serviceEndPoint: 'Professores'
]

{ #category : #accessing }
ProfessorRESTRepository >> professorId: id [
	| dict |
	dict := self getById: id.
	^ Professor newFromData: dict
]

{ #category : #accessing }
ProfessorRESTRepository >> professors [
	| array |
	array := self getAll.

	^ array
		collect: [ :each | Professor newFromData: each ]
]
