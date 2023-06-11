Class {
	#name : #BaselineOfSGA,
	#superclass : #BaselineOf,
	#category : #BaselineOfSGA
}

{ #category : #lepiter }
BaselineOfSGA class >> loadLepiter [
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase properties.
	currentProperties
		addRegisteredDirectory: FileLocator imageDirectory / 'pharo-local' / 'iceberg' / 'jeffsantos'
				/ 'sga-analysis' / 'lepiter'.
	LeDatabasesRegistry default defaultLogicalDatabase reload
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
				package: 'SGA-Domain' with: [ spec requires: #('Tealight') ];
				package: 'SGA-Domain-Tests' with: [ spec requires: #('SGA-Domain') ].
				
			"Groups"
			spec
				group: 'Model' with: #('SGA-Domain');
				group: 'Tests' with: #('SGA-Domain-Tests');
				group: 'All' with: #('Model' 'Tests')
		]
]
