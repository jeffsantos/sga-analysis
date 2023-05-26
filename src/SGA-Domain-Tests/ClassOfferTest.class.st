Class {
	#name : #ClassOfferTest,
	#superclass : #TestCase,
	#category : #'SGA-Domain-Tests'
}

{ #category : #tests }
ClassOfferTest >> testCreateFromData [
	self assert: 1 equals: 0.
]

{ #category : #tests }
ClassOfferTest >> testCreateFromDataWithoutDiscipline [
	self assert: 1 equals: 0.
]

{ #category : #tests }
ClassOfferTest >> testCreateFromDataWithoutProfessor [
	self assert: 1 equals: 0.
]

{ #category : #tests }
ClassOfferTest >> testCreateFromDataWithoutProfessorAndDiscipline [
	self assert: 1 equals: 0.
]
