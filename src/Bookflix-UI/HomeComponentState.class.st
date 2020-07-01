Class {
	#name : #HomeComponentState,
	#superclass : #Object,
	#instVars : [
		'homeComponent'
	],
	#category : #'Bookflix-UI-others'
}

{ #category : #construction }
HomeComponentState class >> of: aHomeComponent [
	^ self new of: aHomeComponent
]

{ #category : #seaside }
HomeComponentState >> children [
	^ Array new
]

{ #category : #get }
HomeComponentState >> getReadablesComponents [
	self subclassResponsibility
]

{ #category : #initialization }
HomeComponentState >> of: aHomeComponent [
	homeComponent := aHomeComponent
]

{ #category : #rendering }
HomeComponentState >> renderElementsOn: html [
	self subclassResponsibility
]
