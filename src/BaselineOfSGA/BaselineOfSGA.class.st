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
				package: 'SGA-Infrastructure-REST' with: [ spec requires: #('Tealight') ];
				package: 'SGA-Domain';
				package: 'SGA-Domain-Tests' with: [ spec requires: #('SGA-Domain') ];
				package: 'SGA-WebComponents' with: [ spec requires: #('SGA-Domain') ];
				package: 'SGA-Analysis'.
				
			"Groups"
			spec
				group: 'Infra' with: #('SGA-Infrastructure-REST');
				group: 'Model' with: #('SGA-Domain');
				group: 'Tests' with: #('SGA-Domain-Tests');
				group: 'Web' with: #('SGA-WebComponents' 'SGA-Domain' 'SGA-Infrastructure-REST' 'SGA-Domain-Tests');
				group: 'NonWeb' with: #('SGA-Domain' 'SGA-Infrastructure-REST' 'SGA-Domain-Tests');
				group: 'Analysis' with: #('SGA-Analysis');
				group: 'All' with: #('Web' 'Model' 'Infra' 'Tests')
		]
]
