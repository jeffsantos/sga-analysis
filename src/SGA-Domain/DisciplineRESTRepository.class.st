Class {
	#name : #DisciplineRESTRepository,
	#superclass : #AbstractWriteableRESTRepository,
	#category : #'SGA-Domain'
}

{ #category : #action }
DisciplineRESTRepository >> add: dict [
	| returnedDict |
	returnedDict := super add: dict.
	
	^ Discipline newFromData: returnedDict
]

{ #category : #accessing }
DisciplineRESTRepository >> disciplineId: id [
	| dict |
	dict := self getById: id.
	^ Discipline newFromData: dict
		
]

{ #category : #accessing }
DisciplineRESTRepository >> disciplines [
	| array |
	array := self getAll.
			
	^ array
		collect: [ :each | Discipline newFromData: each ]
		
]

{ #category : #abstract }
DisciplineRESTRepository >> initializeEndPoint [
	self serviceEndPoint: 'Disciplinas'
]
