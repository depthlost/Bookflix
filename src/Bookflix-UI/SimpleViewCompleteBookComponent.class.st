Class {
	#name : #SimpleViewCompleteBookComponent,
	#superclass : #SimpleViewBookComponent,
	#category : #'Bookflix-UI-readables'
}

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
