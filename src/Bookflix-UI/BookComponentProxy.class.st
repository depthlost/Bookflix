Class {
	#name : #BookComponentProxy,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #accessing }
BookComponentProxy class >> with: aBook in: aComponent [
	^ self new with: aBook in: aComponent
]

{ #category : #initialization }
BookComponentProxy >> with: aBook in: aComponent [
	| readableComponent |
	readableComponent := BookComponent with: aBook in: aComponent.
	^ self session user isAdmin
		ifFalse: [ readableComponent ]
		ifTrue: [ ReadableAdminComponent decorateTo: readableComponent ]
]
