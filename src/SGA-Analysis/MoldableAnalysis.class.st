Class {
	#name : #MoldableAnalysis,
	#superclass : #Object,
	#instVars : [
		'selectedNamespaces'
	],
	#classVars : [
		'uniqueInstance'
	],
	#category : #'SGA-Analysis'
}

{ #category : #'class initialization' }
MoldableAnalysis class >> current [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #'class initialization' }
MoldableAnalysis class >> initialize [ 
	self reset
]

{ #category : #'class initialization' }
MoldableAnalysis class >> reset [
	uniqueInstance := nil
]

{ #category : #accessing }
MoldableAnalysis >> selectedNamespaces [
	^ selectedNamespaces
]

{ #category : #accessing }
MoldableAnalysis >> selectedNamespaces: anObject [
	selectedNamespaces := anObject
]
