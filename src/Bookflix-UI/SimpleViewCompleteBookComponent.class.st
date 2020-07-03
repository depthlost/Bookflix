Class {
	#name : #SimpleViewCompleteBookComponent,
	#superclass : #SimpleViewBookComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #rendering }
SimpleViewCompleteBookComponent >> renderReadButtonOn: html [
	html anchor
		class: 'btn btn-success';
		url: 'javascript:{}';
		onClick:
			(html jQuery ajax
				callback: [ self session user addReadableForHistorial: readable ];
				onComplete: (html javascript goto: readable content first , '#toolbar=0'));
		with: 'Leer'
]