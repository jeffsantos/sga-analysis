Class {
	#name : #SGAClassOfferListComponent,
	#superclass : #SGAScreenComponent,
	#category : #'SGA-WebComponents'
}

{ #category : #rendering }
SGAClassOfferListComponent >> renderContentOn: html [
	super renderContentOn: html.
	html text: 'Demandas já cadastradas aparecerão aqui.'
]
