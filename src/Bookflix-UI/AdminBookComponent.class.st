Class {
	#name : #AdminBookComponent,
	#superclass : #BookComponent,
	#category : #'Bookflix-UI'
}

{ #category : #rendering }
AdminBookComponent >> renderBookContentOn: html [
	super renderBookContentOn: html.
	self renderBookFooterOn: html
]

{ #category : #rendering }
AdminBookComponent >> renderBookFooterOn: html [
	html div
		class: 'card-footer text-right';
		with: [ self
				renderModifyButtonOn: html;
				renderRemoveButtonOn: html ]
]

{ #category : #rendering }
AdminBookComponent >> renderModifyButtonOn: html [
	html anchor
		class: 'text-primary';
		callback: [  ];
		with: 'Modificar'
]

{ #category : #rendering }
AdminBookComponent >> renderRemoveButtonOn: html [
	html anchor
		class: 'text-danger ml-3';
		callback: [  ];
		with: 'Borrar'
]
