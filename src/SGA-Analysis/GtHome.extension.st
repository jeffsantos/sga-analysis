Extension { #name : #GtHome }

{ #category : #'*SGA-Analysis' }
GtHome >> sgaAnalysisSection [
	<gtHomeSection>
	^ GtHomeStartPageSection new 
		title: 'SGA Moldable Analysis';
		description: 'SGA''s Lepiter Database';
		databaseName: 'SGA Moldable Analysis';
		startPageName: 'SGA Analysis';
		priority: 9
]
