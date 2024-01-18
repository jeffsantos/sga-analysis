Class {
	#name : #SubjectRESTRepository,
	#superclass : #AbstractWriteableRESTRepository,
	#category : #'SGA-Infra'
}

{ #category : #action }
SubjectRESTRepository >> addDiscipline: aDiscipline [
	| array |
	array := self add: aDiscipline rawData.
	
	^ array
		collect: [ :each | Subject newFromData: each ]
]

{ #category : #initialization }
SubjectRESTRepository >> initializeEndPoint [
	self serviceEndPoint: 'Disciplinas'
]

{ #category : #accessing }
SubjectRESTRepository >> subjectId: id [
	| dict |
	dict := self getById: id.
	^ Subject newFromData: dict
		
]

{ #category : #accessing }
SubjectRESTRepository >> subjects [
	| array |
	array := self getAll.
			
	^ array
		collect: [ :each | Subject newFromData: each ]
		
]
