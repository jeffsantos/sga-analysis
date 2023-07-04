Class {
	#name : #SGAConstraint,
	#superclass : #GtLeafConstraint,
	#instVars : [
		'model'
	],
	#category : #'SGA-Analysis'
}

{ #category : #accessing }
SGAConstraint >> model [
	^ model
]

{ #category : #accessing }
SGAConstraint >> model: aModel [
	model := aModel
]
