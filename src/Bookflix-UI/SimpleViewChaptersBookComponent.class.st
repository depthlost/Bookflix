Class {
	#name : #SimpleViewChaptersBookComponent,
	#superclass : #SimpleViewBookComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #rendering }
SimpleViewChaptersBookComponent >> renderReadButtonDropdownMenuOn: html [
	html div
		class: 'dropdown-menu';
		attributeAt: 'aria-labelledby' put: 'read_button';
		with: [ readable content
				doWithIndex: [ :each :index | 
					self
						renderReadButtonItemNamed: 'Capítulo ' , index asString
						content: each
						on: html ] ]
]

{ #category : #rendering }
SimpleViewChaptersBookComponent >> renderReadButtonDropdownOn: html [
	html button
		id: 'read_button';
		type: 'button';
		class: 'btn btn-success dropdown-toggle';
		attributeAt: 'data-toggle' put: 'dropdown';
		attributeAt: 'aria-haspopup' put: 'true';
		attributeAt: 'aria-expanded' put: 'false';
		with: 'Leer'
]

{ #category : #rendering }
SimpleViewChaptersBookComponent >> renderReadButtonItemNamed: aName content: aContent on: html [
	html anchor
		class: 'dropdown-item';
		url: 'javascript:{}';
		onClick:
			(html jQuery ajax
				callback: [ self session profile addReadableForHistorial: readable ];
				onComplete: (html javascript goto: aContent , '#toolbar=0'));
		with: aName
]

{ #category : #rendering }
SimpleViewChaptersBookComponent >> renderReadButtonOn: html [
	html div
		class: 'btn-group w-100';
		attributeAt: 'role' put: 'group';
		with: [ self
				renderReadButtonDropdownOn: html;
				renderReadButtonDropdownMenuOn: html ]
]
