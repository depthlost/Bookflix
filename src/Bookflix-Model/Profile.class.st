Class {
	#name : #Profile,
	#superclass : #Object,
	#instVars : [
		'name',
		'historial',
		'reades',
		'finished',
		'favorites'
	],
	#category : #'Bookflix-Model'
}

{ #category : #accessing }
Profile class >> name: aName [
	^ self new name: aName
]

{ #category : #accessing }
Profile >> addFavorite: aBook [
	favorites add: aBook
]

{ #category : #adding }
Profile >> addReadableForHistorial: aReadble [
	historial add: aReadble
]

{ #category : #accessing }
Profile >> favorites [
	^ favorites
]

{ #category : #adding }
Profile >> historial [
	^ historial
]

{ #category : #initialization }
Profile >> initialize [
	name := '---'.
	reades := Set new.
	finished := Set new.
	favorites := Set new.
	historial := Set new
]

{ #category : #accessing }
Profile >> isFinished: aBook [
	^ finished anySatisfy: [ :book | book = aBook ]
]

{ #category : #accessing }
Profile >> isInFavorites: aBook [
	^ favorites includes: aBook
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
Profile >> notFinished: aBook [
	finished remove: aBook
]

{ #category : #accessing }
Profile >> notRead: aBook [
	reades remove: aBook
]

{ #category : #accessing }
Profile >> removeFavorite: aBook [
	favorites remove: aBook
]

{ #category : #accessing }
Profile >> yesFinished: aBook [
	finished add: aBook
]

{ #category : #accessing }
Profile >> yesRead: aBook [
	reades add: aBook
]
