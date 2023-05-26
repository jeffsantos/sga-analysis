Class {
	#name : #Cohort,
	#superclass : #SGAObject,
	#instVars : [
		'id',
		'name'
	],
	#category : #'SGA-Domain'
}

{ #category : #'instance creation' }
Cohort class >> newFromData: rawData [
	^ self new
		rawData: rawData;
		id: (rawData at: 'id');
		name: (rawData at: 'nome')
]

{ #category : #accessing }
Cohort >> id [
	^ id
]

{ #category : #accessing }
Cohort >> id: anInteger [
	id := anInteger
]

{ #category : #accessing }
Cohort >> name [
	^ name
]

{ #category : #accessing }
Cohort >> name: aString [
	name := aString
]
