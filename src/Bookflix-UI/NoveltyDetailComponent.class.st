Class {
	#name : #NoveltyDetailComponent,
	#superclass : #WAComponent,
	#instVars : [
		'novelty',
		'informationComponent',
		'simpleViewComponent'
	],
	#category : #'Bookflix-UI-readables'
}

{ #category : #construction }
NoveltyDetailComponent class >> with: aNovelty [
	^ self new with: aNovelty
]

{ #category : #rendering }
NoveltyDetailComponent >> renderContentOn: html [
	html div
		class: 'container my-4';
		with: [ self renderRowOn: html ]
]

{ #category : #rendering }
NoveltyDetailComponent >> renderRowOn: html [
	html div
		class: 'row';
		with: [ html div
				class: 'col-md-4 h-100 d-flex justify-content-center mb-4';
				with: [ html render: simpleViewComponent ].
			html div
				class: 'col-md-8 h-100 mb-4';
				with: [ html render: informationComponent ] ]
]

{ #category : #seaside }
NoveltyDetailComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - ' , novelty title
]

{ #category : #initialization }
NoveltyDetailComponent >> with: aNovelty [
	novelty := aNovelty.
	informationComponent := NoveltyInformationComponent with: novelty.
	simpleViewComponent := SimpleViewNoveltyComponent
		with: novelty
		in: self
]
