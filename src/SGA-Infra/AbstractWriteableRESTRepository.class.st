Class {
	#name : #AbstractWriteableRESTRepository,
	#superclass : #AbstractReadableRESTRepository,
	#category : #'SGA-Infra'
}

{ #category : #action }
AbstractWriteableRESTRepository >> add: dict [

	"An add method should return its argument to keep consistence
	with the Smalltalk Collection api. Here, we return a list of the 
	entity with the new object included. This is the standard on SGA."

	| json |
	json := ZnClient new
			"enforceHttpSuccess: true;"
			"logToTranscript;"
			url: self urlBase , self serviceEndPoint;
			headerAt: 'Authorization' put: 'Bearer ' , self token;
			formAddAll: dict;
			post.
	"Halt now."
	^ (STON fromString: json) at: 'data'
]
