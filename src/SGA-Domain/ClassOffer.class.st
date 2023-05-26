Class {
	#name : #ClassOffer,
	#superclass : #SGAObject,
	#instVars : [
		'id',
		'language',
		'startDate',
		'endDate',
		'trimester',
		'discipline',
		'professor',
		'cohort',
		'calendar',
		'standardTime'
	],
	#category : #'SGA-Domain'
}

{ #category : #'instance creation' }
ClassOffer class >> newFromData: rawData [
	| class |
	class := self new
				rawData: rawData;
				id: (rawData at: 'sgaId');
				startDate: (rawData at: 'inicio');
				endDate: (rawData at: 'fim');
				language: (rawData at: 'idioma');
				trimester: (rawData at: 'trimestre').
				
	class discipline: (Discipline newFromData: (rawData at: 'disciplina')).
							
	class professor: (Professor newFromData: (rawData at: 'professor')).
	
	class cohort: (Cohort newFromData: (rawData at: 'turma')).
		
	^ class
		
]

{ #category : #accessing }
ClassOffer >> calendar [
	^ calendar
]

{ #category : #accessing }
ClassOffer >> calendar: aCalendar [
	calendar := aCalendar
]

{ #category : #accessing }
ClassOffer >> cohort [
	^ cohort
]

{ #category : #accessing }
ClassOffer >> cohort: aCohort [
	cohort := aCohort
]

{ #category : #accessing }
ClassOffer >> discipline [
	^ discipline
]

{ #category : #accessing }
ClassOffer >> discipline: aDiscipline [
	discipline := aDiscipline
]

{ #category : #accessing }
ClassOffer >> endDate [
	^ endDate
]

{ #category : #accessing }
ClassOffer >> endDate: aDate [
	endDate := aDate
]

{ #category : #accessing }
ClassOffer >> id [
	^ id
]

{ #category : #accessing }
ClassOffer >> id: aString [
	id := aString
]

{ #category : #accessing }
ClassOffer >> language [
	^ language
]

{ #category : #accessing }
ClassOffer >> language: aString [
	language := aString
]

{ #category : #accessing }
ClassOffer >> professor [
	^ professor
]

{ #category : #accessing }
ClassOffer >> professor: aProfessor [
	professor := aProfessor
]

{ #category : #accessing }
ClassOffer >> standardTime [
	^ standardTime
]

{ #category : #accessing }
ClassOffer >> standardTime: aStandardTime [
	standardTime := aStandardTime
]

{ #category : #accessing }
ClassOffer >> startDate [
	^ startDate
]

{ #category : #accessing }
ClassOffer >> startDate: aDate [
	startDate := aDate
]

{ #category : #accessing }
ClassOffer >> trimester [
	^ trimester
]

{ #category : #accessing }
ClassOffer >> trimester: aString [
	trimester := aString
]
