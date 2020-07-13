Class {
	#name : #SimpleViewNoveltyComponent,
	#superclass : #SimpleViewReadableComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #rendering }
SimpleViewNoveltyComponent >> renderBodyOn: html [
	readable isText
		ifTrue: [ html div
				class: 'card-body';
				with: [ self renderDocumentOn: html ] ]
]

{ #category : #rendering }
SimpleViewNoveltyComponent >> renderDocumentOn: html [
	html anchor
		class: 'btn btn-block btn-success';
		url: readable content;
		with: 'Ver Contenido'
]

{ #category : #rendering }
SimpleViewNoveltyComponent >> renderHeadOn: html [
	readable isPhoto
		ifTrue: [ self renderImageOn: html ]
		ifFalse: [ readable isVideo
				ifTrue: [ self renderVideoOn: html ] ]
]

{ #category : #rendering }
SimpleViewNoveltyComponent >> renderImageOn: html [
	html image
		style: 'max-height: 18rem';
		class: 'card-img-top book-cover-image';
		url: readable content
]

{ #category : #rendering }
SimpleViewNoveltyComponent >> renderVideoOn: html [
	html video
		class: 'img-fluid';
		url: readable content;
		controls: true
]
