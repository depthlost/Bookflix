Class {
	#name : #TrailerComponentProxy,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #accessing }
TrailerComponentProxy class >> with: aTrailer in: aComponent [
	^ self new with: aTrailer in: aComponent
]

{ #category : #initialization }
TrailerComponentProxy >> with: aTrailer in: aComponent [
	| readableComponent |
	readableComponent := TrailerComponent with: aTrailer in: aComponent.
	^ self session user isAdmin
		ifFalse: [ readableComponent ]
		ifTrue: [ ReadableAdminComponent decorateTo: readableComponent ]
]
