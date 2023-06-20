Class {
	#name : #SGAApplicationRootComponent,
	#superclass : #SBSComponent,
	#instVars : [
		'main'
	],
	#category : #'SGA-WebComponents'
}

{ #category : #testing }
SGAApplicationRootComponent class >> canBeRoot [ 
	^ true
]

{ #category : #'class initialization' }
SGAApplicationRootComponent class >> initialize [

	"self initialize "

	| app |
	app := WAAdmin register: self asApplicationAt: 'SGA'.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: SBSDeploymentLibrary
]

{ #category : #hooks }
SGAApplicationRootComponent >> children [ 
	^ { main }
]

{ #category : #initialization }
SGAApplicationRootComponent >> initialize [ 
	super initialize. 
	main := SGAClassOfferListComponent new
]

{ #category : #accessing }
SGAApplicationRootComponent >> main: aComponent [

	main := aComponent
]

{ #category : #rendering }
SGAApplicationRootComponent >> renderContentOn: html [
	html render: main
]

{ #category : #updating }
SGAApplicationRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'SGA'
]
