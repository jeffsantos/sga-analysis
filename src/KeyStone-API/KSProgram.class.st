Class {
	#name : #KSProgram,
	#superclass : #RESTDomainObject,
	#category : #'KeyStone-API'
}

{ #category : #accessing }
KSProgram >> id [
	^ (rawData at: 'id')
]
