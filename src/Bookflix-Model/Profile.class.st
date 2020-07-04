Class {
	#name : #Profile,
	#superclass : #Object,
	#instVars : [
		'name',
		'historial',
		'reades'
	],
	#category : #'Bookflix-Model'
}

{ #category : #accessing }
Profile class >> name: aName [
	^ self new name: aName
]

{ #category : #adding }
Profile >> addReadableForHistorial: aReadble [
	historial add: aReadble
]

{ #category : #adding }
Profile >> historial [
	^ historial
]

{ #category : #initialization }
Profile >> initialize [
	name := '---'.
	reades := Set new.
	historial := OrderedCollection new
]

{ #category : #accessing }
Profile >> isRead: aBook [
	^ reades anySatisfy: [ :book | book = aBook ]
]

{ #category : #accessing }
Profile >> name [
	^ name
]

{ #category : #accessing }
Profile >> name: aName [
	name := aName
]

{ #category : #accessing }
Profile >> notRead: aBook [
	reades remove: aBook
]

{ #category : #accessing }
Profile >> yesRead: aBook [
	reades add: aBook
]
