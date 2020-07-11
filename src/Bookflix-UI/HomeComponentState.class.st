Class {
	#name : #HomeComponentState,
	#superclass : #Object,
	#instVars : [
		'homeComponent',
		'readableListComponent'
	],
	#category : #'Bookflix-UI-others'
}

{ #category : #construction }
HomeComponentState class >> of: aHomeComponent [
	^ self new of: aHomeComponent
]

{ #category : #seaside }
HomeComponentState >> children [
	^ Array with: readableListComponent
]

{ #category : #get }
HomeComponentState >> getReadablesComponents [
	self subclassResponsibility
]

{ #category : #initialization }
HomeComponentState >> of: aHomeComponent [
	homeComponent := aHomeComponent.
	readableListComponent := ReadableListComponent
		with: self getReadablesComponents
]

{ #category : #rendering }
HomeComponentState >> renderElementsOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
HomeComponentState >> renderReadablesOn: html [
	html render: readableListComponent
]

{ #category : #reset }
HomeComponentState >> resetState [
	self subclassResponsibility
]
