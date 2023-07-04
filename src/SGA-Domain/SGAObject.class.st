Class {
	#name : #SGAObject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'SGA-Domain'
}

{ #category : #'instance creation' }
SGAObject class >> newFromData: rawData [
	self subclassResponsibility
]

{ #category : #'gt extensions' }
SGAObject >> gtPropertiesFor: aView [
	<gtView>
	^ aView forward
		title: 'Properties';
		priority: 10;
		object: [ rawData ];
		view: #gtItemsFor:
]

{ #category : #accessing }
SGAObject >> rawData [
	^ rawData
]

{ #category : #accessing }
SGAObject >> rawData: dict [
	rawData := dict.
]
