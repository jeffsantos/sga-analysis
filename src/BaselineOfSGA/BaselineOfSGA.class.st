Class {
	#name : #BaselineOfSGA,
	#superclass : #BaselineOf,
	#category : #BaselineOfSGA
}

{ #category : #loading }
BaselineOfSGA class >> loadLepiter [
	| repositoryName |
	repositoryName := 'sga-analysis'.

	IceRepository registry
		detect: [ :aRepository | aRepository name = repositoryName ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties
				addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
				defaultDatabase reload]
		ifNone: [ self inform: 'Repository not found.' ]
]

{ #category : #loading }
BaselineOfSGA class >> renameLepiter [
	LeDatabasesRegistry defaultLogicalDatabase databases 
		detect: [ :aDatabase | aDatabase databaseName includesSubstring: 'sga-analysis' ] 
		ifFound: [ :aDatabase | aDatabase databaseName: 'SGA Moldable Analysis']
]

{ #category : #baselines }
BaselineOfSGA >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
		    "Dependencies"
			spec
				baseline: 'Tealight'
				with: [ spec repository: 'github://astares/Tealight:main/src' ].
		
			"Packages"
			spec 
				package: 'RESTDomain-Core';
				package: 'SGA-Domain'with: [ spec requires: #('RESTDomain-Core') ];
				package: 'SGA-Infra' with: [ spec requires: #('Tealight' 'SGA-Domain') ];
				package: 'SGA-Domain-Tests' with: [ spec requires: #('SGA-Domain') ];
				package: 'SGA-WebComponents' with: [ spec requires: #('SGA-Infra') ];
				package: 'SGA-Analysis' with: [ spec requires: #('SGA-Infra' 'SGA-Domain-Tests') ].
				
			"Groups"
			spec
				group: 'Infra' with: #('SGA-Infra');
				group: 'Model' with: #('SGA-Domain');
				group: 'Tests' with: #('SGA-Domain-Tests');
				group: 'Web' with: #('SGA-WebComponents' 'SGA-Domain-Tests');
				group: 'NonWeb' with: #('SGA-Infra' 'SGA-Domain-Tests');
				group: 'Analysis' with: #('SGA-Analysis');
				group: 'All' with: #('Web' 'Model' 'Infra' 'Tests')
		]
]
