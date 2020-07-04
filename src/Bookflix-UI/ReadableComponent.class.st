Class {
	#name : #ReadableComponent,
	#superclass : #WAComponent,
	#instVars : [
		'readable',
		'parentComponent'
	],
	#category : #'Bookflix-UI-readables'
}

{ #category : #construction }
ReadableComponent class >> with: aReadable in: aComponent [
	^ self new with: aReadable in: aComponent
]

{ #category : #private }
ReadableComponent >> getReadableDescriptionWithMaxLength: aNumber [
	^ readable description size <= aNumber
		ifTrue: [ readable description takeFirst: aNumber ]
		ifFalse: [ (readable description first: aNumber) , '...' ]
]

{ #category : #callbacks }
ReadableComponent >> goToReadableDetail [
	parentComponent
		call:
			(readable className = 'Novelty'
				ifTrue: [ NoveltyDetailComponent with: readable ]
				ifFalse: [ readable className = 'Advance'
						ifTrue: [ TrailerDetailComponent with: readable ]
						ifFalse: [ BookDetailComponent with: readable ] ])
]

{ #category : #accessing }
ReadableComponent >> parentComponent [
	^ parentComponent
]

{ #category : #accessing }
ReadableComponent >> readable [
	^ readable
]

{ #category : #rendering }
ReadableComponent >> renderBodyOn: html [
	html div
		class: 'card-body';
		with: [ self
				renderTitleOn: html;
				renderSubtitleOn: html;
				renderDescriptionOn: html;
				renderInformationButtonOn: html ]
]

{ #category : #rendering }
ReadableComponent >> renderCardOn: html [
	self
		renderHeadOn: html;
		renderBodyOn: html
]

{ #category : #rendering }
ReadableComponent >> renderContentOn: html [
	html div
		class: 'card';
		with: [ self renderCardOn: html ]
]

{ #category : #rendering }
ReadableComponent >> renderDescriptionOn: html [
	html paragraph
		class: 'card-text';
		with: (self getReadableDescriptionWithMaxLength: 150)
]

{ #category : #rendering }
ReadableComponent >> renderHeadOn: html [
	
]

{ #category : #rendering }
ReadableComponent >> renderInformationButtonOn: html [
	html div
		class: 'd-flex justify-content-center mt-4';
		with: [ html anchor
				class: 'btn w-75 btn-outline-success align-center';
				callback: [ self goToReadableDetail ];
				with: 'Ver Información' ]
]

{ #category : #rendering }
ReadableComponent >> renderSubtitleOn: html [
	
]

{ #category : #rendering }
ReadableComponent >> renderTitleOn: html [
	html heading level5
		class: 'card-title';
		with: readable title
]

{ #category : #initialization }
ReadableComponent >> with: aReadable in: aComponent [
	readable := aReadable.
	parentComponent := aComponent
]
