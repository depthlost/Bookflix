Class {
	#name : #AdminBookComponent,
	#superclass : #BookComponent,
	#category : #'Bookflix-UI-books'
}

{ #category : #callbacks }
AdminBookComponent >> goToModifyBook [
	parentComponent call: (SetBookComponent with: book)
]

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
		callback: [ self goToModifyBook ];
		with: 'Modificar'
]

{ #category : #rendering }
AdminBookComponent >> renderRemoveButtonOn: html [
	html anchor
		class: 'text-danger ml-3';
		callback: [ book remove ];
		with: 'Borrar'
]
