Class {
	#name : #SGAConstrainerReport,
	#superclass : #GtConstrainerReport,
	#instVars : [
		'model'
	],
	#category : #'SGA-Analysis'
}

{ #category : #'instance creation' }
SGAConstrainerReport class >> onModel: aModel [
	^ self basicNew
		model: aModel;
		initialize
]

{ #category : #private }
SGAConstrainerReport >> build: aComposite [
	aComposite name: 'SGA Constrainer Report'.
	aComposite
		addConstraint: (SGAConstraint new 
			model: self model)
]

{ #category : #accessing }
SGAConstrainerReport >> model [
	^ model
]

{ #category : #accessing }
SGAConstrainerReport >> model: aModel [
	model := aModel
]
