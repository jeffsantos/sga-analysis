Class {
	#name : #AsynchronousRange,
	#superclass : #SGAObject,
	#instVars : [
		'startDate',
		'endDate'
	],
	#category : #'SGA-Domain'
}

{ #category : #'instance cr' }
AsynchronousRange class >> startAt: aStartDate endAt: anEndDate [
    ^ self new 
			startDate: aStartDate; 
			endDate: anEndDate
		
]

{ #category : #accessing }
AsynchronousRange >> endDate [
	^ endDate
]

{ #category : #accessing }
AsynchronousRange >> endDate: aDate [
	"Private method - do not use outside of the class"
	endDate := aDate
]

{ #category : #accessing }
AsynchronousRange >> startDate [
	^ startDate
]

{ #category : #accessing }
AsynchronousRange >> startDate: aDate [
	"Private method - do not use outside of the class"
	startDate := aDate
]
