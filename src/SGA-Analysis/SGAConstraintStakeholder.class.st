Class {
	#name : #SGAConstraintStakeholder,
	#superclass : #GtConstraintStakeholder,
	#classInstVars : [
		'developmentTeam'
	],
	#category : #'SGA-Analysis'
}

{ #category : #'instance creation' }
SGAConstraintStakeholder class >> developmentTeam [
	^ developmentTeam ifNil: [
      developmentTeam := self new name: 'Development Team' ]
]
