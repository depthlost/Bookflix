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
	^ Array empty
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

{ #category : #rendering }
HomeComponentState >> renderReadablesOn: html [
	html
		render: (ReadableListComponent with: self getReadablesComponents)
]

{ #category : #reset }
HomeComponentState >> resetState [
	self subclassResponsibility
]
