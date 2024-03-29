Class {
	#name : #ProfessorRESTRepository,
	#superclass : #AbstractReadableRESTRepository,
	#category : #'SGA-Infra'
}

{ #category : #initialization }
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
