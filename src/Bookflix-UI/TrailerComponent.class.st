Class {
	#name : #TrailerComponent,
	#superclass : #ReadableComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #rendering }
TrailerComponent >> renderSubtitleOn: html [
	html small
		class: 'mb-2 text-muted';
		with: 'Trailer'
]
