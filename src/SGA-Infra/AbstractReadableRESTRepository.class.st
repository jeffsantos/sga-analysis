Class {
	#name : #AbstractReadableRESTRepository,
	#superclass : #Object,
	#instVars : [
		'urlBase',
		'authEndPoint',
		'serviceEndPoint',
		'authRawData'
	],
	#category : #'SGA-Infra'
}

{ #category : #'instance creation' }
AbstractReadableRESTRepository class >> createRESTRepository [
	^ self new
			urlBase: self defaultURL;
			authEndPoint: 'Auth';
			initializeEndPoint;
			authenticate.

]

{ #category : #'default values' }
AbstractReadableRESTRepository class >> defaultURL [
	| stream env url prefix version envKey |
	
	stream := 'sga-settings.json' asFileReference readStream.
	env := STON fromStream: stream.
	
	envKey := env at: 'current'.
	
	url := (env at: envKey) at: 'url'.
	prefix := (env at: envKey) at: 'prefix'.
	version := (env at: envKey) at: 'version'.
	
	(prefix ~= '') ifTrue: [ url := url,'/',prefix ].
	
	(version ~= '') ifTrue: [ url := url,'/',version ].

	^ url,'/'
]

{ #category : #accessing }
AbstractReadableRESTRepository >> authEndPoint [
	^ authEndPoint
]

{ #category : #accessing }
AbstractReadableRESTRepository >> authEndPoint: anObject [
	authEndPoint := anObject
]

{ #category : #accessing }
AbstractReadableRESTRepository >> authRawData: dictionary [
	authRawData := dictionary
]

{ #category : #authentication }
AbstractReadableRESTRepository >> authenticate [
	| json dictionary stream env accessParams loginBase pwdBase |
	
	stream := 'sga-settings.json' asFileReference readStream.
	env := STON fromStream: stream.
	
	accessParams := env at: 'access'.
	loginBase := accessParams at: 'loginBase'.
	pwdBase := accessParams at: 'senhaBase'.
	
	json := ZnClient new
			url: self urlBase, self authEndPoint;
			formAt: 'login' put: loginBase;
			formAt: 'senha' put: pwdBase;
			post.
			
	dictionary := STON fromString: json.
	
	self authRawData: dictionary.
]

{ #category : #querying }
AbstractReadableRESTRepository >> getAll [
	| json |
	json := ZnClient new
			"enforceHttpSuccess: true;"
			url: self urlBase , self serviceEndPoint;
			headerAt: 'Authorization' put: 'Bearer ' , self token;
			get.
	^ (STON fromString: json) at: 'data'
]

{ #category : #querying }
AbstractReadableRESTRepository >> getById: id [
	| json |
	json := ZnClient new
			"enforceHttpSuccess: true;"
			url: self urlBase , 
				   self serviceEndPoint , '/' , 
				   (id isString ifTrue: [id] ifFalse: [id printString]);
			headerAt: 'Authorization' put: 'Bearer ' , self token;
			get.
	"Halt now."
	^ (STON fromString: json) at: 'data'
]

{ #category : #initialization }
AbstractReadableRESTRepository >> initializeEndPoint [
	self subclassResponsibility
]

{ #category : #accessing }
AbstractReadableRESTRepository >> serviceEndPoint [
	^ serviceEndPoint
]

{ #category : #accessing }
AbstractReadableRESTRepository >> serviceEndPoint: anObject [
	serviceEndPoint := anObject
]

{ #category : #accessing }
AbstractReadableRESTRepository >> token [
	^ (authRawData at: 'data') at: 'token'
]

{ #category : #accessing }
AbstractReadableRESTRepository >> tokenValidity [
	^ (authRawData at: 'data') at: 'validoAte'
]

{ #category : #accessing }
AbstractReadableRESTRepository >> urlBase [
	^ urlBase
]

{ #category : #accessing }
AbstractReadableRESTRepository >> urlBase: anObject [
	urlBase := anObject
]
