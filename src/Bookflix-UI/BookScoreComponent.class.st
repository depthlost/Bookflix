Class {
	#name : #BookScoreComponent,
	#superclass : #WAComponent,
	#instVars : [
		'book'
	],
	#category : #'Bookflix-UI-readables'
}

{ #category : #'instance creation' }
BookScoreComponent class >> with: aBook [
	^ self new with: aBook
]

{ #category : #rendering }
BookScoreComponent >> renderBodyOn: html [
	html div
		class: 'card-body d-flex justify-content-between';
		with: [ self
				renderReadingQuantityOn: html;
				renderScoreOn: html ]
]

{ #category : #rendering }
BookScoreComponent >> renderContentOn: html [
	html div
		class: 'card mt-3';
		with: [ self renderBodyOn: html ]
]

{ #category : #rendering }
BookScoreComponent >> renderReadingQuantityOn: html [
	html small
		class: 'text-muted';
		with: 'Leido: 16 veces'
]

{ #category : #rendering }
BookScoreComponent >> renderScoreOn: html [
	html small
		class: 'text-muted';
		with: 'Calificación: 0,6'
]

{ #category : #initialization }
BookScoreComponent >> with: aBook [
	book := aBook
]
