Class {
	#name : #ActionItemComponent,
	#superclass : #WAComponent,
	#instVars : [
		'element'
	],
	#category : #'Bookflix-UI-resources'
}

{ #category : #'instance creation' }
ActionItemComponent class >> with: anObject [
	^ self new with: anObject
]

{ #category : #callbacks }
ActionItemComponent >> onClick [
	self subclassResponsibility
]

{ #category : #initialization }
ActionItemComponent >> with: anObject [
	element := anObject
]
