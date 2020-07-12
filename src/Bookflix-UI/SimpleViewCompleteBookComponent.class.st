Class {
	#name : #SimpleViewCompleteBookComponent,
	#superclass : #SimpleViewBookComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #rendering }
SimpleViewCompleteBookComponent >> renderBottomBodyOn: html [
	(self session profile isInProgres: readable)
		ifTrue: [ html div
				class: 'mt-3 d-flex justify-content-end';
				with: [ self renderScoreStateOn: html ] ]
]

{ #category : #rendering }
SimpleViewCompleteBookComponent >> renderReadButtonOn: html [
	html anchor
		class: 'btn btn-success w-100';
		url: 'javascript:{}';
		onClick:
			(html jQuery ajax
				callback: [ self readBook ];
				onComplete: (html javascript goto: readable content , '#toolbar=0'));
		with: 'Leer'
]
