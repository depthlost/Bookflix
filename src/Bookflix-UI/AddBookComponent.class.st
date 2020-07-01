Class {
	#name : #AddBookComponent,
	#superclass : #BookOperationComponent,
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #private }
AddBookComponent >> buildBook [
	self subclassResponsibility
]

{ #category : #private }
AddBookComponent >> buttonDescription [
	^ 'Registrar'
]

{ #category : #callbacks }
AddBookComponent >> onSubmit [
	self buildBook save.
	^ AlertComponent with: 'El libro fue registrado con exito'
]

{ #category : #seaside }
AddBookComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - Agregar Libro'
]

{ #category : #private }
AddBookComponent >> validateInputData [
	errorByRegisteredIsbn := Bookflix instance existingIsbn: isbnInput.
	^ super validateInputData & errorByRegisteredIsbn not
]
