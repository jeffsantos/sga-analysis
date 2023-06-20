Class {
	#name : #SGAScreenComponent,
	#superclass : #SBSComponent,
	#instVars : [
		'header'
	],
	#category : #'SGA-WebComponents'
}

{ #category : #hooks }
SGAScreenComponent >> children [
	^ { header }
]

{ #category : #initialization }
SGAScreenComponent >> createHeaderComponent [
	^ SGAHeaderComponent new
]

{ #category : #initialization }
SGAScreenComponent >> initialize [
	super initialize.
	header := self createHeaderComponent
]

{ #category : #rendering }
SGAScreenComponent >> renderContentOn: html [
	html render: header
]
