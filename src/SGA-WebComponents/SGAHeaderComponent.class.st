Class {
	#name : #SGAHeaderComponent,
	#superclass : #SBSComponent,
	#category : #'SGA-WebComponents'
}

{ #category : #rendering }
SGAHeaderComponent >> renderBrandOn: html [
	html navigationBarBrand
		url: self application url;
		with: 'SGA'
]

{ #category : #rendering }
SGAHeaderComponent >> renderContentOn: html [			
	| bar |
	bar := html navigationBar.
	bar beLight; expandLarge.
	bar background beLight.
	bar with: [ 
		html container: [ 
			self renderBrandOn: html 
			] 
		]
	
]
