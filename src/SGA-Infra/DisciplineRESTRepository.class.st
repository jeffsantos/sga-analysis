Class {
	#name : #DisciplineRESTRepository,
	#superclass : #AbstractWriteableRESTRepository,
	#category : #'SGA-Infra'
}

{ #category : #action }
DisciplineRESTRepository >> addDiscipline: aDiscipline [
	| array |
	array := super add: aDiscipline rawData.
	
	^ array
		collect: [ :each | Discipline newFromData: each ]
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
