Class {
	#name : #Subject,
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
Subject class >> newFromData: rawData [
	^ self new
		id: (rawData at: 'id');
		code: (rawData at: 'codigo');		
		name: (rawData at: 'nome');
		workload: (rawData at: 'cargaHoraria').
]

{ #category : #accessing }
Subject >> code [
	^ code
]

{ #category : #accessing }
Subject >> code: aString [
	code := aString.
	rawData at: 'codigo' put: code
]

{ #category : #accessing }
Subject >> id [
	^ id
]

{ #category : #accessing }
Subject >> id: anInteger [
	id := anInteger.
	rawData at: 'id' put: (id asString)
]

{ #category : #accessing }
Subject >> name [
	^ name
]

{ #category : #accessing }
Subject >> name: aString [
	name := aString.
	rawData at: 'nome' put: name
]

{ #category : #accessing }
Subject >> workload [
	^ workload
]

{ #category : #accessing }
Subject >> workload: anInteger [
	workload := anInteger.
	rawData at: 'cargaHoraria' put: (workload asString)
]
