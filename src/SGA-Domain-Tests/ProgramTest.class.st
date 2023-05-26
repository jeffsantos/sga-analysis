Class {
	#name : #ProgramTest,
	#superclass : #TestCase,
	#instVars : [
		'mockAPI'
	],
	#category : #'SGA-Domain-Tests'
}

{ #category : #running }
ProgramTest >> setUp [
	super setUp.
	mockAPI := MockAPI createWithMockData
]

{ #category : #running }
ProgramTest >> tearDown [
	mockAPI := nil.
	super tearDown 
]

{ #category : #tests }
ProgramTest >> testProgramWithCohortsWithoutInvitations [
	| prog |
	prog := Program newFromData: (mockAPI programId: 1).
	
	self assert: prog id equals: 1.
	self assert: prog name equals: 'Mestrado Profissional Executivo em Gestão Empresarial'.
	self assert: prog type equals: 'MESTRADO'.
	
	self assert: prog cohorts size equals: 2.
	
	self assert: prog invitations size equals: 0.
	
]

{ #category : #tests }
ProgramTest >> testProgramWithoutCohortsWithoutInvitations [
	| prog |
	prog := Program newFromData: (mockAPI programId: 2).
	
	self assert: prog cohorts size equals: 0.
	
	self assert: prog invitations size equals: 0.
]
