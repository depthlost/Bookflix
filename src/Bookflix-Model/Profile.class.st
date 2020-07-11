Class {
	#name : #Profile,
	#superclass : #Object,
	#instVars : [
		'name',
		'historial',
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
Profile >> addReadbleForHistorial: aBook [
	aBook addReader: self.
	(historial anySatisfy: [ :element | element book = aBook ])
		ifTrue:
			[ (historial detect: [ :element | element book = aBook ]) updateMoment ]
		ifFalse: [ historial add: (HistorialElemnt book: aBook) ]
]

{ #category : #accessing }
Profile >> favorites [
	^ favorites
]

{ #category : #accessing }
Profile >> finish: aBook [
	(historial anySatisfy: [ :element | element book = aBook ])
		ifTrue:
			[ ^ (historial detect: [ :element | element book = aBook ]) isFinish ]
		ifFalse: [ ^ false ]
]

{ #category : #adding }
Profile >> historial [
	^ historial
]

{ #category : #initialization }
Profile >> initialize [
	name := '---'.
	favorites := Set new.
	historial := OrderedCollection new
]

{ #category : #accessing }
Profile >> isInFavorites: aBook [
	^ favorites includes: aBook
]

{ #category : #testing }
Profile >> isInProgres: aBook [
	^ historial anySatisfy: [ :element | element book = aBook ]
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
Profile >> removeFavorite: aBook [
	favorites remove: aBook
]

{ #category : #accessing }
Profile >> toggleFinish: aBook [
	(historial anySatisfy: [ :element | element book = aBook ])
		ifTrue:
			[ (historial detect: [ :element | element book = aBook ]) toggleFinish ]
]
