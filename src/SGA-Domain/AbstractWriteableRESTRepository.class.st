Class {
	#name : #AbstractWriteableRESTRepository,
	#superclass : #AbstractReadableRESTRepository,
	#category : #'SGA-Domain'
}

{ #category : #action }
AbstractWriteableRESTRepository >> add: dict [
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
