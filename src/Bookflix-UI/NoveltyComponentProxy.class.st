Class {
	#name : #NoveltyComponentProxy,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #accessing }
NoveltyComponentProxy class >> with: aNovelty in: aComponent [
	^ self new with: aNovelty in: aComponent
]

{ #category : #initialization }
NoveltyComponentProxy >> with: aNovelty in: aComponent [
	| readableComponent |
	readableComponent := NoveltyComponent with: aNovelty in: aComponent.
	^ self session profile isAdmin
		ifFalse: [ readableComponent ]
		ifTrue: [ ReadableAdminComponent decorateTo: readableComponent ]
]
