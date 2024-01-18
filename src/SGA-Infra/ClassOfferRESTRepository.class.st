Class {
	#name : #ClassOfferRESTRepository,
	#superclass : #AbstractReadableRESTRepository,
	#category : #'SGA-Infra'
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

{ #category : #initialization }
ClassOfferRESTRepository >> initializeEndPoint [
	self serviceEndPoint: 'Classes'
]
