Class {
	#name : #NoveltyComponent,
	#superclass : #ReadableComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #rendering }
NoveltyComponent >> renderSubtitleOn: html [
	html small
		class: 'mb-2 text-muted';
		with: 'Novedad'
]
