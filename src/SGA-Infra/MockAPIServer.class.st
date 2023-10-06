Class {
	#name : #MockAPIServer,
	#superclass : #TLWebserver,
	#category : #'SGA-Infra'
}

{ #category : #action }
MockAPIServer class >> rebuildRoutes [
	
	self defaultServer initializeTeapotDefaultOptions.
	self defaultServer createTeapotDefaultRoutes.	
	
]

{ #category : #defaults }
MockAPIServer >> createTeapotDefaultRoutes [
	| mockData returnDict allIds id |

	teapot stop.
	teapot removeAllDynamicRoutes.

	mockData := MockAPI createWithMockData.
	
	returnDict := { 'statusCode' -> 200 . 
			  'message' -> 'OK' .
			  'error' -> false .
			  'uiMessage' -> 'Sucesso' } asDictionary.	
	
	teapot
		GET: '/api/Programas'
				-> [ returnDict at: 'data' put: mockData programs;
					   yourself ];
		GET: '/api/Programas/<id:IsInteger>'
				-> [ :request | 
						returnDict at: 'data' put: (mockData programId: (request at: #id));
						yourself ];
		GET: '/api/Professores'
				-> [ returnDict at: 'data' put: mockData professors;
					   yourself ];
		GET: '/api/Professores/<id:IsInteger>'
				-> [ :request | 
						returnDict at: 'data' put: (mockData professorId: (request at: #id));
						yourself ];
		GET: '/api/Disciplinas'
				-> [ returnDict at: 'data' put: mockData disciplines;
					   yourself ];
		GET: '/api/Disciplinas/<id:IsInteger>'
				-> [ :request | 
						returnDict at: 'data' put: (mockData disciplineId: (request at: #id));
						yourself ];
		POST: '/api/Disciplinas'
				-> [ :request | 
						| disc allDisciplines |
						disc := {'codigo' -> (request at: #codigo).						
								'nome' -> (request at: #nome).
								'cargaHoraria' -> (request at: #cargaHoraria) asInteger} asDictionary.
	
						allDisciplines := mockData disciplines asOrderedCollection.
						
						allIds := allDisciplines collect: [ :each | each at: 'id'].
						
						id := allIds max + 1.
						
						disc at: 'id' put: id.
						
						allDisciplines add: disc.
						mockData disciplines: allDisciplines.
						returnDict at: 'data' put: mockData disciplines;
						yourself ];
		GET: '/api/Classes'
				-> [ returnDict at: 'data' put: mockData classOffers;
					   yourself ];
		GET: '/api/Classes/<id>'
				-> [ :request | 
						returnDict at: 'data' put: (mockData classOfferId: (request at: #id));
						yourself ];
		POST: '/api/Auth'
				-> [ :request | 
					| login |
					login := {'login' -> (request at: #login).
							'senha' -> (request at: #senha)} asDictionary.

					returnDict at: 'data' put: {'token' -> '4302917e-c0bd-4f02-a15b-b7cf42ad6f5c'} asDictionary;
					yourself ];
		POST: '/api/Auth/Token'
				-> [ :request |
						| returnDataFile content jsonData |
						returnDataFile := 'auth-token.json' asFileReference.
						
						content := returnDataFile contents.
						jsonData := NeoJSONReader fromString: content. 
						
						(jsonData at: 'data') at: 'validoAte' put: '04/10/2024 11:33:48'.
						jsonData ]
]

{ #category : #initialization }
MockAPIServer >> initializeTeapotDefaultOptions [

	teapot initializeOptions: { #defaultOutput -> #json. 
								   #port -> 8282.
								   } asDictionary.
]
