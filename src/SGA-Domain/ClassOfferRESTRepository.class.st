Class {
	#name : #ClassOfferRESTRepository,
	#superclass : #AbstractReadableRESTRepository,
	#category : #'SGA-Domain'
}

{ #category : #accessing }
ClassOfferRESTRepository >> classOfferId: id [
	| dict |
	dict := self getById: id.
	^ ClassOffer newFromData: dict
]

{ #category : #accessing }
ClassOfferRESTRepository >> classOffers [
	| array |
	array := self getAll.
			
	^ array
		collect: [ :each | ClassOffer newFromData: each ]
]

{ #category : #abstract }
ClassOfferRESTRepository >> initializeEndPoint [
	self serviceEndPoint: 'Classes'
]
