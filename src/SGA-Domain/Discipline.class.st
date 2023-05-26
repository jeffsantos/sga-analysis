Class {
	#name : #Discipline,
	#superclass : #SGAObject,
	#instVars : [
		'id',
		'code',
		'workload',
		'name'
	],
	#category : #'SGA-Domain'
}

{ #category : #'instance creation' }
Discipline class >> newFromData: rawData [
	^ self new
		id: (rawData at: 'id');
		code: (rawData at: 'codigo');		
		name: (rawData at: 'nome');
		workload: (rawData at: 'cargaHoraria').
]

{ #category : #accessing }
Discipline >> code [
	^ code
]

{ #category : #accessing }
Discipline >> code: aString [
	code := aString.
	rawData at: 'codigo' put: code
]

{ #category : #accessing }
Discipline >> id [
	^ id
]

{ #category : #accessing }
Discipline >> id: anInteger [
	id := anInteger.
	rawData at: 'id' put: (id asString)
]

{ #category : #initialization }
Discipline >> initialize [
	rawData := Dictionary new.
]

{ #category : #accessing }
Discipline >> name [
	^ name
]

{ #category : #accessing }
Discipline >> name: aString [
	name := aString.
	rawData at: 'nome' put: name
]

{ #category : #accessing }
Discipline >> workload [
	^ workload
]

{ #category : #accessing }
Discipline >> workload: anInteger [
	workload := anInteger.
	rawData at: 'cargaHoraria' put: (workload asString)
]
