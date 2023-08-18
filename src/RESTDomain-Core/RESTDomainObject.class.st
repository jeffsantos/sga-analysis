Class {
	#name : #RESTDomainObject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'RESTDomain-Core'
}

{ #category : #'instance creation' }
RESTDomainObject class >> newFromData: rawData [
	self subclassResponsibility
]

{ #category : #'gt extensions' }
RESTDomainObject >> gtPropertiesFor: aView [
	<gtView>
	^ aView forward
		title: 'Properties';
		priority: 10;
		object: [ rawData ];
		view: #gtItemsFor:
]

{ #category : #accessing }
RESTDomainObject >> rawData [
	^ rawData
]

{ #category : #accessing }
RESTDomainObject >> rawData: dict [
	rawData := dict.
]
